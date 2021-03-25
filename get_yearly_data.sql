

       -- To run  startdate enddate and c for calender year f for financial year
   -- call dhmp.give_data_yearly('2018-01-01', '2018-06-01', 'f');




CREATE DEFINER=`root`@`localhost` PROCEDURE `give_data_yearly`(start_date date,IN end_date date,IN year_type varchar(100))
BEGIN
      DECLARE yr INT;
       
          IF year_type='c' THEN
          
          select ReportingMonthyear,sum(SMD),sum(CMD),sum(SuicideAttempts),sum(Epilepsy),sum(DevelopmentalDisorders),sum(TotalPatient) 
         from reportdata where ReportingMonthyear 
		BETWEEN start_date and end_date group by YEAR(ReportingMonthyear);
         
            
         ELSEIF  year_type='f' THEN

         SELECT 
         CASE WHEN MONTH(ReportingMonthyear) BETWEEN 4 AND 12 THEN
         concat(YEAR(ReportingMonthyear), '-',YEAR(ReportingMonthyear)+1)
		 WHEN MONTH(ReportingMonthyear) BETWEEN 1 AND 3 THEN
         concat(YEAR(ReportingMonthyear)-1,'-', YEAR(ReportingMonthyear)) 
         END as financial_year,
         
         ReportingMonthyear,sum(SMD),sum(CMD),sum(SuicideAttempts),sum(Epilepsy),sum(DevelopmentalDisorders),sum(TotalPatient)
		
		from reportdata
        where ReportingMonthyear     -- filtering 
        
		BETWEEN start_date and end_date 
        GROUP BY financial_year;
         end if;
         
     
          
 
END