CREATE OR REPLACE PACKAGE BODY PACK_BQRK AS
--процедура обновления адресов после первичного переноса
procedure update_address is
pos number;
str varchar2(100);
prob number;
pdom varchar2(50);
 cursor cntrs is select a.* from bqrk.counters a where instr(a.street,'/')<>0;
begin 
--присваиваем технологическому адресу значение поля "улица" в первоначальном виде+сетевой адрес
update bqrk.counters a set a.tehn_address=a.street||' ['||a.counter_address||']';
For i in cntrs loop
    pos:=instr(i.street,'/',1);
	--удаляем все после первого "/" оставляя улицу и номер дома 
    update bqrk.counters a set a.street=substr(i.street,1,pos-1) where a.id_counter=i.id_counter;
	select a.street into str from bqrk.counters a where a.id_counter=i.id_counter;
	--вырезаем номер дома 
	update bqrk.counters a set a.dom=translate(substr(str,length(str)-6,length(str)),'-,','  ') 
		   				   	   									where a.id_counter=i.id_counter; 															
															   				   	   						  	 
 end loop; 
--обрабатываем поле "DOM" удаляя ненужные символы  
for d in (select a.* from bqrk.counters a where a.dom is not null) loop
 prob:=instr(d.dom,' ',1); 
 
 if (prob<>0)then 
   update counters a set a.dom=trim(substr(d.dom,prob,length(d.dom))) where a.id_counter=d.id_counter;
 end if; 
 
end loop;
 
commit;
end update_address;

procedure insert_addfields(pid_cnt number) is 
--процедура автоматического добавления доп.полей для счетчиков
 cursor cntrs is select c.* from bqrk.counters c where id_con=(select a.id_con 
 from bqrk.con_points a,bqrk.counters b where a.id_con=b.id_con and b.id_counter=pid_cnt)
 and c.id_counter<>pid_cnt;
 
 cursor add_flds is select * from bqrk.addfields where id_node=pid_cnt;
 
xid_field number;
xid_prop number;
xid_object number;
xname varchar2 (20);
xvalue2 varchar2 (50);

begin

For fld in add_flds loop 
 select fld.id_field into xid_field from bqrk.addfields a where id_node=fld.id_node and id_field=fld.id_field; 
 select fld.id_prop into xid_prop from bqrk.addfields a where id_node=fld.id_node and id_field=fld.id_field; 
 select fld.id_object into xid_object from bqrk.addfields a where id_node=fld.id_node and id_field=fld.id_field;
 select fld.name into xname from bqrk.addfields a where id_node=fld.id_node and id_field=fld.id_field;
 select fld.value2 into xvalue2 from bqrk.addfields a where id_node=fld.id_node and id_field=fld.id_field;
 
 For cur_cntr in cntrs loop
  begin
  
  Insert into bqrk.addfields (id_node,id_field,id_prop,id_object,name,value2) 
  		 values (cur_cntr.id_counter,xid_field,xid_prop,xid_object,xname,xvalue2);	 
   exception when DUP_VAL_ON_INDEX then
    goto metka;
  end;
  <<metka>> null;
   end loop;
   
end loop; 
 commit;
end insert_addfields;

procedure clear_base is
--процедура очищения базы
begin
For Con in (select * from bqrk.con_points) loop
 For Conc in (select * from bqrk.concentrator_points where id_con=con.id_con) loop
  For Count in (select * from bqrk.counters where id_con=conc.id_con and id_concentrator=conc.id_concentrator) loop
   Delete from bqrk.counters where id_counter=count.id_counter 
   		  	   and id_concentrator=count.id_concentrator and id_counter=count.id_counter;
  End loop;
  Delete from bqrk.concentrator_points where id_concentrator=conc.id_concentrator and id_con=conc.id_con;
 End loop; 
 Delete from bqrk.con_points where id_con=con.id_con;
End loop;

end clear_base;

procedure errors_on_opros (pdaten varchar2,pdatek varchar2) is
--процедура автоматически составляющая расписание из счетчиков которые были опрошены последний раз с указанной глубиной  
cursor errors_cur is select * from bqrk.counters where DATE_LAST_POK <= to_date(pdatek,'dd.mm.yyyy hh24:mi:ss')
and DATE_LAST_POK >= to_date(pdaten,'dd.mm.yyyy hh24:mi:ss') and SERIAL_NUMBER is not null; 
 
 next_sch_id number;
 conc_num number; conc_name varchar2(50); conc_type number;
 conn_num number; conn_name varchar2(50); conn_type number;
 bu number;
 
 begin
 --тащим новое значение последовательности для расписания
 select bqrk.SCHEDULEID.Nextval into next_sch_id from dual;
 --вставляем расписание
 insert into bqrk.schedule (id_schedule,name_schedule) values (next_sch_id,'Переопрос');
 --бежим по курсору с неопрошенными счетчиками 
  For err in errors_cur loop
   begin
  	--запоминаем идентификатор объекта "подключение" данного счетчика, его имя и тип
	 conn_num:=err.id_con;
	 select con_name into conn_name from bqrk.con_points where id_con=err.id_con;
	 select con_type into conn_type from bqrk.con_points where id_con=err.id_con;
	 --запоминаем идентификатор объекта "концентратор" данного счетчика, его имя и тип
	 conc_num:=err.id_concentrator;
	 select name_concentrator into conc_name from bqrk.concentrator_points where id_concentrator=err.id_concentrator;
	 select type into conc_type from bqrk.concentrator_points where id_concentrator=err.id_concentrator;
	  
	--в цикле вставляем их в сетку с соответсвующим номером расписания
	--перед этим ищем есть ли текущий объект в новом расписании. Если его нет то вставляем
	--сначала идут подключения
  begin
	select nvl(id_node,-1) into bu from bqrk.grid where id_schedule=next_sch_id and id_node=conn_num;
     exception when NO_DATA_FOUND then
    bu:=null;
  end;

	 if bu is null then
	   insert into grid values (next_sch_id,conn_num,0,conn_type,conn_name); 
	 end if;   
	end; 
	--далее идут концентраторы 
	begin
	 select id_node into bu from bqrk.grid where id_schedule=next_sch_id and id_node=conc_num;
	  exception when NO_DATA_FOUND then
     bu:=null;
    end;
	 if bu is null then
	   insert into grid  values (next_sch_id,conc_num,conn_num,conc_type,conc_name); 
	  commit;
	  end if;
	  
	 --потом счетчики
	 begin
     select id_node into bu from bqrk.grid where id_schedule=next_sch_id and id_node=err.id_counter;
	  exception when NO_DATA_FOUND then
       bu:=null;
  	 end;
	  
	  if bu is null then
	   insert into grid  values (next_sch_id,err.id_counter,conc_num,2003,err.counter_name); 
	  end if;
	   
   end loop;
commit;
end errors_on_opros;

procedure delete_node (pid_node number,pobj_id number) is
--процедура удаления узла
begin
--отключаем внешний ключ чтобы появилась возможность  удалить показания
--для кемерово

--ALTER TABLE bqrk.pokaz 
--DISABLE CONSTRAINT sys_c007053

--для ленинска
--ALTER TABLE bqrk.pokaz DISABLE CONSTRAINT sys_c004475

 if pobj_id in (1001,1002,1003) then --шлюз
 --удаляем показания
 Delete from bqrk.pokaz where id_con=pid_node; 
 --вся иерархия точки
  Delete from bqrk.counters where id_con=pid_node;
  Delete from bqrk.concentrator_points where id_con=pid_node;
  Delete from bqrk.con_points where id_con=pid_node;
  --удаляем из всех расписаний
  Delete from bqrk.grid where id_node=pid_node;
 end if;
 
 if pobj_id in (2001,2005) then --концентратор
  --удаляем показания
    Delete from bqrk.pokaz where id_concentrator=pid_node;
	
    Delete from bqrk.counters where id_concentrator=pid_node;
 	Delete from bqrk.concentrator_points where id_concentrator=pid_node;
	
	Delete from bqrk.grid where id_node=pid_node; 
 end if;
 
 if pobj_id in (2003) then --счетчик
   --удаляем показания
    Delete from bqrk.pokaz where id_counter=pid_node;
	
    Delete from bqrk.counters where id_counter=pid_node;
	
	Delete from bqrk.grid where id_node=pid_node; 
 end if;
 
 if pobj_id in (2002,2004,2006,2007,2008,2009) then
 	Delete from bqrk.addobjects where id_addobj=pid_node;
	
	Delete from bqrk.grid where id_node=pid_node;
 end if;

--для кемерово
--ALTER TABLE bqrk.pokaz ENABLE CONSTRAINT sys_c007053
--для ленинска
--ALTER TABLE bqrk.pokaz ENABLE CONSTRAINT sys_c004475
 
 commit;

end delete_node;

procedure delete_node_from_schedule (pid_node number,pobj_id number,psch number) is
--процедура удаления узлов из сохраненного расписания
id_conc number;
begin
 if pobj_id in (1001,1002,1003) then --при удалении шлюза
 --цикл по концентраторам шлюза
  for i in (select * from bqrk.grid where id_schedule=psch and id_parent=pid_node) loop 
  	--удаляем счетчики и доп.объекты текущего концентратора
 	Delete from bqrk.grid where id_parent=i.id_node and id_schedule=psch;
	--удаляем сам текущий концетратор
	Delete from bqrk.grid where id_node=i.id_node and id_schedule=psch;
  end loop;	
  --удаляем шлюз
  Delete from bqrk.grid where id_node=pid_node and id_schedule=psch;
 end if;
 
 if pobj_id in (2001,2005) then --при удалении концентратора
 --удаляем счетчики и доп.объекты текущего концентратора
   Delete from bqrk.grid where id_parent=pid_node and id_schedule=psch;
  --удаляем сам текущий концетратор 
   Delete from bqrk.grid where id_node=pid_node and id_schedule=psch;
 end if;
 
 if pobj_id in (2003) then --при удалении счетчика
 --удаляем доп.объекты текущего счетчика
   Delete from bqrk.grid where id_parent=pid_node and id_schedule=psch;
   --удаляем сам текущий счетчик
   Delete from bqrk.grid where id_node=pid_node and id_schedule=psch;
 end if;
end;

procedure upd_last_avg is 
--процедура расчета последнего среднего расхода для каждого счетчика
 cursor cntrs is select a.* from bqrk.counters a; --where a.SERIAL_NUMBER='05375938'; 
 
 rashodp number;
 delta_daysp number;
 last_avg_rashp number;
 
 begin
  For cur_cntr in cntrs loop
    --вытаскиваем расход из последней записи таблицы pokaz по текущему счетчику 
  Begin 
   --в случае если будет считаться среднемесячный расход
   --select avg(rashod) into last_avg_rashp from bqrk.pokaz where serial_number=cur_cntr.serial_number and date_pok between sysdate-30 and sysdate
    Select rashod into rashodp from bqrk.pokaz where date_pok=
	(select max(date_pok) from pokaz where serial_number=cur_cntr.serial_number)
	 and serial_number=cur_cntr.serial_number;
	 
	 exception when NO_DATA_FOUND then
	 rashodp:=1;
  End;
	--вытаскиваем кол-во дней от последнего опроса 
	--из последней записи таблицы pokaz по текущему счетчику
  Begin	
	Select delta_days into delta_daysp from bqrk.pokaz where date_pok=
	(select max(date_pok) from pokaz where serial_number=cur_cntr.serial_number)
	 and serial_number=cur_cntr.serial_number;
	 
	 exception when NO_DATA_FOUND then
	 delta_daysp:=1;
  End;
	--считаем средний расход за предпоследний период 
	last_avg_rashp:=rashodp/delta_daysp; 
	if last_avg_rashp is null then
	  last_avg_rashp:=0;
	end if;
	--записываем его в counters для последующего использования при очередном опросе
	update bqrk.counters set last_avg_rash=last_avg_rashp where serial_number=cur_cntr.serial_number;
	  
   end loop;
   commit;   
end upd_last_avg;

procedure pokaz_rollback is

cursor cntrs is select a.* from bqrk.counters a;

begin
For cur_cntr in cntrs loop
  --скрипт на откатку показаний по счетчику на выбанную дату
delete from bqrk.errors where wdate>'10.06.2015' and serial_number=cur_cntr.serial_number;
delete from bqrk.pokaz where date_pok='10.06.2015' and id_counter=cur_cntr.id_counter;

update bqrk.counters set date_last_pok=(select max(date_pok) from bqrk.pokaz where id_counter=cur_cntr.id_counter
group by id_counter) where id_counter=cur_cntr.id_counter;
--сумма
update bqrk.counters set last_pok=
(select summ from bqrk.pokaz where date_pok=
(select max(date_pok) from bqrk.pokaz where id_counter=cur_cntr.id_counter
 group by id_counter) and id_counter=cur_cntr.id_counter)
  where id_counter=cur_cntr.id_counter;
--тариф 1
update bqrk.counters set last_pokt1=
(select tarif1 from bqrk.pokaz where date_pok=
(select max(date_pok) from bqrk.pokaz where id_counter=cur_cntr.id_counter
 group by id_counter) and id_counter=cur_cntr.id_counter)
  where id_counter=cur_cntr.id_counter;
--тариф 2
update bqrk.counters set last_pokt2=
(select tarif2 from bqrk.pokaz where date_pok=
(select max(date_pok) from bqrk.pokaz where id_counter=cur_cntr.id_counter
 group by id_counter) and id_counter=cur_cntr.id_counter)
  where id_counter=cur_cntr.id_counter;
--тариф 3
update bqrk.counters set last_pokt3=
(select tarif3 from bqrk.pokaz where date_pok=
(select max(date_pok) from bqrk.pokaz where id_counter=cur_cntr.id_counter
 group by id_counter) and id_counter=cur_cntr.id_counter
 ) where id_counter=cur_cntr.id_counter;
--тариф 4
update bqrk.counters set last_pokt4=
(select tarif4 from bqrk.pokaz where date_pok=
(select max(date_pok) from bqrk.pokaz where id_counter=cur_cntr.id_counter
 group by id_counter) and id_counter=cur_cntr.id_counter)
  where id_counter=cur_cntr.id_counter;
--последний средний расход
update bqrk.counters set last_avg_rash=(select (rashod/delta_days) as div 
from bqrk.pokaz where date_pok=
(select max(date_pok) from bqrk.pokaz where id_counter=cur_cntr.id_counter
group by id_counter) and id_counter=cur_cntr.id_counter) 
 where id_counter=cur_cntr.id_counter;

 end loop;
 --commit;
end pokaz_rollback;
END PACK_BQRK;
/
