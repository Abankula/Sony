CREATE OR REPLACE TABLE "PO_HRIS_DB"."ld".po_cbd_nugget
(
First_Name Varchar(100),
Last_Name  Varchar(100),
Employee_Email Varchar(100),
Course Varchar(1000),
Last_Accessed Varchar(100),
Total_Minutes Varchar(10),
Completetion_Percent Varchar(10),
Time_Trained Varchar(10),
Skills_Watched Varchar(10)
)
kevin_kavanagh@spe.sony.com	1:39:28	5	1/31/2024 16:15

Insert Into po_cbd_nugget values('Kevin','Kavanagh','kevin_kavanagh@spe.sony.com','Palo Alto Networks Certified Cybersecurity Entry-level Technician (PCCET)',10/25/2023  6:19:23 PM','18','"2.86%"','"1:39:28 AM"','5')
Insert Into po_cbd_nugget values('Kevin','Kavanagh','kevin_kavanagh@spe.sony.com','Cisco CCNP Enterprise Core (350-401 ENCOR)','1/31/2024  4:15:50 PM','446','14.39%','4:28:53 PM','22')
Insert Into po_cbd_nugget values('Maria','Carrillo','maria_carrillo@spe.sony.com','Microsoft Azure Data Fundamentals (DP-900)','11/30/2023  7:50:24 PM','37','7.35%','2:18:52 AM','3');
Insert Into po_cbd_nugget values('Mike','Morris','mike_morris@spe.sony.com','CCNP Designing Cisco Enterprise Wireless Networks (300-425 ENWLSD)','6/19/2023  3:45:36 PM','563','25.43%','3:21:39 AM','10');

select * from PO_HRIS_DB."survey".PO_DECLINE_SURVEY
