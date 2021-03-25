CREATE table ReportData as
	SELECT * FROM dhmp.Reportdata_restructured order by ReportId asc,
    StateId asc,DistrictId asc,VisitType asc,Gender asc;



SET SQL_SAFE_UPDATES=0;
update dhmp.ReportData SET FacilityType=2 where MncHospitalId is not NULL;
update dhmp.ReportData SET TalukaId=MncHospitalId where TalukaId=0;
SET SQL_SAFE_UPDATES=1;

Alter Table dhmp.ReportData DROP column MncHospitalId;


SET SQL_SAFE_UPDATES=0;
update dhmp.ReportData SET TalukaId=274 where ReportId=80682 and TalukaId=0;
update dhmp.ReportData SET TalukaId=180 where ReportId=80882 and TalukaId=0;
update dhmp.ReportData SET FacilityType=1 where TalukaId=274 or TalukaId=180;
SET SQL_SAFE_UPDATES=1;

DROP TABLE dhmp.Reportdata_restructured;
