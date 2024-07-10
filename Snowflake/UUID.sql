with A(id,value) as (
select * from values
(1,1254),
(2,5022),
(3,3327),
(4,3327)
)
select id,value,hash(uuid_string()||value) as hashed_value from A;


SELECT UUID_STRING();