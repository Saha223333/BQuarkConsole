--SYNCHDEL_ADDOBJS_W_CONS
--SYNCHDEL_ADDOBJS_W_COUNTERS
--SYNCHDEL_ADDOBJ_W_GRID
--SYNCHDEL_CONCENTRATORS_W_GRID
--SYNCHDEL_CON_POINTS_W_GRID
--SYNCHDEL_COUNTERS_W_GRID
--SYNCHDEL_INTERFACE_W_GRID
--SYNCHDEL_SCHEDULE_W_GRID
--SYNCHDEL_SCHEDULE_W_INTERFACE
--SYNCHDEL_ADDFIELDS_W_CONCEN
--SYNCHDEL_ADDFIELDS_W_COUNTERS
--SYNCHDEL_ADDOBJS_W_CONCEN
--SYNCHDEL_ADDFIELDS_W_ADDOBJS
--SYNCHADD_GRID_W_CONCENTRATOR
--SYNCHDEL_ADDFIELDS_W_CONS
--SYNCHADD_GRID_W_COUNTERS
--SYNCHUPD_CONCENTRATORS_W_GRID
--SYNCHUPD_CONNECTIONS_W_GRID
--SYNCHUPD_COUNTERS_W_GRID
--SYNCHUPD_GRID_W_COUNTERS
--SYNCHUPD_TEHNADDRESS
--UPD_COUNTER_AFTER_INSERT
--UPD_LASTPOK
--
CREATE OR REPLACE TRIGGER SynchAdd_grid_w_concentrator
AFTER INSERT
ON bqrk.concentrator_points
FOR EACH ROW
DECLARE
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
   For gridconn in (select * from bqrk.grid a where :new.id_con=a.id_node) loop
    Insert into bqrk.grid values (gridconn.id_schedule,:new.id_concentrator,:new.id_con,2001,
		   :new.concentrator_address);
		   
    Update bqrk.schedule set last_date=sysdate where id_schedule=gridconn.id_schedule;
   End loop; 
 commit;
END;
/



CREATE OR REPLACE TRIGGER SynchAdd_grid_w_counters
AFTER INSERT
ON bqrk.counters
FOR EACH ROW
DECLARE
sxidconc integer;
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
 --Select :new.id_concentrator into sxidconc from counters where id_counter=:new.id_counter;
 
-- Select  from 
  --If sxidconc is not null then
   For gridcon in (select * from bqrk.grid a where :new.id_concentrator=a.id_node) loop
    Insert into bqrk.grid values (gridcon.id_schedule,:new.id_counter,:new.id_concentrator,2003,
		   :new.street||' '||:new.dom);
		   
    Update bqrk.schedule set last_date=sysdate where id_schedule=gridcon.id_schedule;
   End loop;
  --End if;   
 commit;
END;
/



CREATE OR REPLACE TRIGGER SynchDel_AddFields_w_AddObjs
AFTER DELETE
ON bqrk.AddObjects
FOR EACH ROW
DECLARE
BEGIN
 Delete from bqrk.addfields a where a.id_node=:old.id_addobj;

END;
/



CREATE OR REPLACE TRIGGER SynchDel_AddFields_w_concen
AFTER DELETE
ON bqrk.concentrator_points
FOR EACH ROW
DECLARE
BEGIN
 Delete from bqrk.addfields a where a.id_node=:old.id_concentrator;

END;
/



CREATE OR REPLACE TRIGGER SynchDel_AddFields_w_cons
AFTER DELETE
ON bqrk.con_points
FOR EACH ROW
DECLARE
BEGIN
 Delete from bqrk.addfields a where a.id_node=:old.id_con;

END;
/



CREATE OR REPLACE TRIGGER SynchDel_AddFields_w_counters
AFTER DELETE
ON bqrk.counters
FOR EACH ROW
DECLARE
BEGIN
 Delete from bqrk.addfields a where a.id_node=:old.id_counter;

END;
/



CREATE OR REPLACE TRIGGER SynchDel_AddObjs_w_concen
AFTER DELETE
ON bqrk.concentrator_points
FOR EACH ROW
DECLARE
BEGIN
 Delete from bqrk.addobjects a where a.id_parent=:old.id_concentrator;

END;
/



CREATE OR REPLACE TRIGGER SynchDel_AddObjs_w_cons
AFTER DELETE
ON bqrk.con_points
FOR EACH ROW
DECLARE
BEGIN
 Delete from bqrk.addobjects a where a.id_parent=:old.id_con;

END;
/



CREATE OR REPLACE TRIGGER SynchDel_AddObjs_w_counters
AFTER DELETE
ON bqrk.counters
FOR EACH ROW
DECLARE
BEGIN
 Delete from bqrk.addobjects a where a.id_parent=:old.id_counter;

END;
/



CREATE OR REPLACE TRIGGER SynchDel_addobj_w_grid
AFTER DELETE
ON bqrk.addobjects
FOR EACH ROW
DECLARE
BEGIN
 DELETE FROM bqrk.grid a
 WHERE :old.id_addobj = a.id_node;

END;
/

ALTER TRIGGER SYNCHDEL_ADDOBJ_W_GRID DISABLE;



CREATE OR REPLACE TRIGGER SynchDel_concentrators_w_grid
AFTER DELETE
ON bqrk.concentrator_points
FOR EACH ROW
DECLARE
BEGIN
 update bqrk.schedule set last_date=sysdate where id_schedule in (select id_schedule
  from grid where id_node=:old.id_concentrator);

 DELETE FROM bqrk.grid a
 WHERE :old.id_concentrator = a.id_node;


END;
/



CREATE OR REPLACE TRIGGER SynchDel_con_points_w_grid
AFTER DELETE
ON bqrk.con_points
FOR EACH ROW
DECLARE
BEGIN
  update bqrk.schedule set last_date=sysdate where id_schedule in (select id_schedule
  from grid where id_node=:old.id_con);
  
 DELETE FROM bqrk.grid a
 WHERE :old.id_con = a.id_node;

END;
/



CREATE OR REPLACE TRIGGER SynchDel_counters_w_grid
AFTER DELETE
ON bqrk.counters
FOR EACH ROW
DECLARE
BEGIN
  update bqrk.schedule set last_date=sysdate where id_schedule in (select id_schedule
  from grid where id_node=:old.id_counter);

 DELETE FROM bqrk.grid a
 WHERE :old.id_counter = a.id_node;

END;
/



CREATE OR REPLACE TRIGGER SynchDel_interface_w_grid
AFTER DELETE
ON bqrk.interface
FOR EACH ROW
DECLARE
BEGIN
 DELETE FROM bqrk.interface a
 WHERE :old.id_schedule = a.id_schedule;
 commit;
END;
/



CREATE OR REPLACE TRIGGER SynchDel_schedule_w_grid
BEFORE DELETE
ON bqrk.schedule
FOR EACH ROW
DECLARE
BEGIN
 Delete from bqrk.grid a where a.id_schedule=:old.id_schedule;

END;
/



CREATE OR REPLACE TRIGGER SynchDel_schedule_w_interface
BEFORE DELETE
ON bqrk.schedule
FOR EACH ROW
DECLARE
BEGIN
 Delete from bqrk.interface a where :old.id_schedule=a.id_schedule;

END;
/



CREATE OR REPLACE TRIGGER SynchUpd_concentrators_w_grid
AFTER UPDATE
ON bqrk.concentrator_points
FOR EACH ROW
DECLARE
BEGIN
 UPDATE bqrk.grid a SET a.text=:new.concentrator_address where a.id_node=:new.id_concentrator;

END;
/



CREATE OR REPLACE TRIGGER SynchUpd_connections_w_grid
AFTER UPDATE
ON bqrk.con_points
FOR EACH ROW
DECLARE
BEGIN
 UPDATE bqrk.grid a SET a.text=:new.con_name where a.id_node=:new.id_con;

END;
/



CREATE OR REPLACE TRIGGER SynchUpd_counters_w_grid
AFTER UPDATE
ON bqrk.counters
FOR EACH ROW
DECLARE
BEGIN
 UPDATE bqrk.grid a SET a.text=:new.street||' '||:new.dom where a.id_node=:new.id_counter;

END;
/



CREATE OR REPLACE TRIGGER SynchUpd_grid_w_counters
AFTER UPDATE
ON bqrk.counters
FOR EACH ROW
DECLARE
BEGIN
 UPDATE bqrk.grid a SET a.id_parent=:new.id_concentrator where a.id_node=:new.id_counter;

END;
/



CREATE OR REPLACE TRIGGER SynchUpd_TehnAddress
AFTER UPDATE
ON bqrk.counters
FOR EACH ROW
DECLARE
stri varchar2(100);
dm  varchar2(20);
BEGIN
if :new.street is not null then 
 stri:=:new.street;
end if;

if :new.dom is not null then 
 dm:=:new.dom;
end if;

 UPDATE bqrk.counters a SET a.tehn_address=stri||dm 
 where :old.id_counter=:new.id_counter;

END;
/

ALTER TRIGGER SYNCHUPD_TEHNADDRESS DISABLE;



CREATE OR REPLACE TRIGGER Upd_Counter_After_Insert
AFTER INSERT
ON bqrk.Counters
FOR EACH ROW
DECLARE
BEGIN
 Update bqrk.counters b set b.counter_name=(select a.con_name from bqrk.con_points a
 where :new.id_con=a.id_con);

END;
/

ALTER TRIGGER UPD_COUNTER_AFTER_INSERT DISABLE;



CREATE OR REPLACE TRIGGER Upd_LastPok
BEFORE INSERT
ON bqrk.pokaz
FOR EACH ROW
DECLARE
BEGIN
 UPDATE bqrk.counters t SET t.last_pok=:new.summ,t.date_last_pok=:new.date_pok
 		,t.last_pok_con=:new.id_concentrator, t.last_pokt1=:new.tarif1, 
		t.last_pokt2=:new.tarif2,t.last_pokt3=:new.tarif3,
		t.last_pokt4=:new.tarif4
 where t.serial_number=:new.serial_number;

END;
/




