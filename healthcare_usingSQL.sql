----- Changing The Column name "Name" ---------------

EXEC sp_rename 'healthcare_dataset.Patient Name', 'Patient_Name', 'COLUMN'



 ------ Fixing the name format-----------

UPDATE healthcare_dataset
SET  Patient_Name = UPPER(Patient_Name)	


-------- Fixing Billing Values to a consistant decimal place-----------

UPDATE healthcare_dataset
SET Billing_Amount = CONVERT(decimal(10,2), Billing_Amount)


------ Fixing the text results----

UPDATE healthcare_dataset
SET Test_Results = 'Pending'
FROM healthcare_dataset
WHERE Test_Results = 'Inconclusive'



---- REMOVING DUPLICATES-------------

WITH DUPLICATE AS(

	SELECT *,
	ROW_NUMBER() OVER(PARTITION BY Patient_Name, Medical_Condition, Hospital ORDER BY(SELECT NULL)) [RowNum]
	FROM healthcare_dataset

	)
 
DELETE FROM DUPLICATE
WHERE RowNum>1





------------OPERATIONS-------------------

SELECT *
FROM healthcare_dataset


-------------COUNT OF TOTAL PATIENTS PER HOSPITAL-------------

SELECT Hospital, COUNT(Patient_Name) [Number of Patients]
FROM healthcare_dataset
GROUP BY Hospital
ORDER BY [Number of Patients] DESC



-------------Find the Most Common Medical Conditions------------


SELECT Medical_Condition, COUNT(Medical_Condition) [Disease Count]
FROM healthcare_dataset
GROUP BY Medical_Condition
ORDER BY [Disease Count] DESC



---------------Calculate Average Billing Amount by Admission Type-----------

SELECT Admission_Type,  ROUND(AVG(Billing_Amount), 2) [Average Bill]
FROM healthcare_dataset
GROUP BY Admission_Type
ORDER BY [Average Bill] DESC



---------------Calculate Average Hospital Stay Duration----------------

SELECT Hospital, AVG(DATEDIFF(DAY, Date_of_Admission, Discharge_Date)) [Stay Duration]
FROM healthcare_dataset
GROUP BY Hospital
ORDER BY [Stay Duration] DESC



----------------Rank Hospitals by Average Billing--------------------

SELECT Hospital,AVG(Billing_Amount)[Average Bill],
RANK() OVER(ORDER BY AVG(Billing_Amount) DESC) [Rank]
FROM healthcare_dataset
GROUP BY Hospital


----------------Identify Patients with Highest Bills in Each Hospital-----------


WITH BillRank AS(

	SELECT Patient_Name, Hospital, Billing_Amount,
	RANK() OVER(PARTITION BY HOSPITAL ORDER BY Billing_Amount DESC) [Patient Rank]
	FROM healthcare_dataset
	WHERE Billing_Amount > 0
)

SELECT *
FROM BillRank
WHERE [Patient Rank] =1



--------- Top 10 hospitals----------

WITH Hospital_Rank AS(

	SELECT Hospital, SUM(CASE WHEN Billing_Amount>0 THEN Billing_Amount ELSE 0 END) [Total Billing Amount],
	RANK() OVER(ORDER BY SUM(CASE WHEN Billing_Amount> 0 THEN Billing_Amount ELSE 0 END) DESC)[Hospital Rank]
	FROM healthcare_dataset
	WHERE Billing_Amount > 0
	GROUP BY Hospital
	
)

SELECT * 
FROM Hospital_Rank
WHERE [Hospital Rank] <= 10
ORDER BY [Hospital Rank]



------------ Top 10 hospitals with the most patient--------


WITH Patient_Count AS(
	
	SELECT Hospital, COUNT(Patient_Name) [Total Patient],
	ROW_NUMBER() OVER(ORDER BY COUNT(Patient_Name) DESC) [Hospital_Rank]
	FROM healthcare_dataset
	GROUP BY Hospital		
)

SELECT *
FROM Patient_Count
WHERE Hospital_Rank <= 10
ORDER BY Hospital_Rank





------------- Top 10 Hospitals with the highest billing ----------------


WITH Billing_Rank AS (

	SELECT Hospital, AVG(Billing_Amount) [Average of Bill],
	ROW_NUMBER() OVER(ORDER BY AVG(Billing_Amount)DESC) [Rank]
	FROM healthcare_dataset
	GROUP BY Hospital

)

SELECT *
FROM Billing_Rank
WHERE [Rank] <=10




----------- Unidentified Billings ---------

SELECT COUNT(*) [No. of Unidentified Billings]
FROM healthcare_dataset
WHERE Billing_Amount < 0 





------------ Clients with most bills -------------

WITH Patient_Bill AS(

	SELECT Patient_Name, Billing_Amount [Billing Amount], Hospital, Medical_Condition,
	RANK() OVER(ORDER BY Billing_Amount DESC) [Bill_Rank]
	FROM healthcare_dataset
	WHERE Billing_Amount > 0


)

SELECT *
FROM Patient_Bill
WHERE Bill_Rank <= 10



