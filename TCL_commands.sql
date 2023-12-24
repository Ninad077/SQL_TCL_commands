-- TCL Commands (Transaction control Commands)
-- Commit, Savepoint and Rollback
-- Commit: Saves a query
-- Savepoint: Provides a bookmark to save query.
-- Rollback: Undo the action till savepoint/commit.

-- Until first commit/rollback;
start transaction;
drop table  student;

create table student(
GR_No int primary key,
Stud_name varchar(50) not null,
Roll_int int unique,
Address varchar(100) default "-",
Age int check(Age>=18)
);

insert into student(GR_No,Stud_name,Roll_int, Age)
values( 111, "Ninad",1,19);

insert into student(GR_No,Stud_name,Roll_int,Address,Age) 
values( 112, "Pranali",2, "Sunburn Apt",19);
commit;

start transaction;
INSERT INTO student values
(113, "Rajesh",3, "Blue hill",25);
rollback;                           -- Rollbacks to commit (Undo till Commit)

start transaction;
INSERT INTO student values
(114, "Radha",4, "Northpoint",27);
savepoint ins;

Update student 
Set Address="Lalbaug"
where GR_No=114;
savepoint upd;

-- Rollback ins;                  -- Rollbacks till savepoint ins (Undo till ins)
-- Rollback upd                   -- Rollbacks till savepoint upd (Undo till upd)