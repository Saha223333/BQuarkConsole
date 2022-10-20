CREATE OR REPLACE procedure pokaz_rollback is

cursor cntrs is select a.* from bqrk.counters a;

begin
For cur_cntr in cntrs loop
  --скрипт на откатку показаний по счетчику на выбанную дату
delete from bqrk.errors where wdate>'03.09.2015' and serial_number=cur_cntr.serial_number;
delete from bqrk.pokaz where date_pok='03.09.2015' and id_counter=cur_cntr.id_counter;

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
/
