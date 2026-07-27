use capstone;
select* from capstone;

-- 1.Total No.of patients
SELECT COUNT(*) AS Total_Patients
FROM capstone;

-- 2.No.of patients in each department
SELECT department,
COUNT(*) AS No_of_patients FROM capstone
GROUP BY department;

-- 3.Avg.waiting time for each department
SELECT department,
AVG(WaitingTime_Min) FROM capstone
GROUP BY department;

-- 4.Avg.Treatement cost for each department
SELECT Department,
ROUND(AVG(TreatmentCost),2) AS Average_Treatment_Cost FROM capstone
GROUP BY Department;

-- 5.Total Revenue
SELECT Department,
ROUND(SUM(TotalBill),2) AS Total_Revenue
FROM capstone
GROUP BY Department;

-- 6.Num.of patients in each city
use capstone;
select* from capstone;

-- 1.Total No.of patients
SELECT COUNT(*) AS Total_Patients
FROM capstone;

-- 2.No.of patients in each department
SELECT department,
COUNT(*) AS No_of_patients FROM capstone
GROUP BY department;

-- 3.Avg.waiting time for each department
SELECT department,
AVG(WaitingTime_Min) FROM capstone
GROUP BY department;

-- 4.Avg.Treatement cost for each department
SELECT Department,
AVG(TreatmentCost) AS Average_Treatment_Cost FROM capstone
GROUP BY Department;

-- 5.Total Revenue
SELECT Department,
ROUND(SUM(TotalBill),2) AS Total_Revenue FROM capstone
GROUP BY Department
ORDER BY Total_Revenue DESC;

-- 6.Num.of patients in each city
SELECT City,
COUNT(*) AS Total_Patients
FROM capstone
GROUP BY City
ORDER BY Total_Patients DESC;

-- 7.Payment mode used frequently
SELECT PaymentMode,
COUNT(*) AS Usage_Count
FROM capstone GROUP BY PaymentMode
ORDER BY Usage_Count DESC
LIMIT 1;

-- 8.Avg patient satisfaction score
SELECT Department,
ROUND(AVG(PatientSatisfaction),2) AS Average_Satisfaction FROM capstone
GROUP BY Department
ORDER BY Average_Satisfaction DESC;

-- 9.top 10 patients bill
SELECT ï»¿PatientID, Department, City, TotalBill FROM capstone
ORDER BY TotalBill DESC
LIMIT 10;

-- 10.
SELECT Department,
ROUND(AVG(LengthOfStay_Days),2) AS Average_Stay
FROM capstone
GROUP BY Department
HAVING AVG(LengthOfStay_Days) > 5;

-- 11.Total Bill>Avg.Total Bill
SELECT ï»¿PatientID, Department, City, TotalBill
FROM capstone
WHERE TotalBill >
(
SELECT AVG(TotalBill)
FROM capstone
);

-- 12.Patients ranking based on total bill
SELECT ï»¿PatientID, Department, TotalBill,
RANK() OVER(ORDER BY TotalBill DESC) AS Bill_Rank
FROM capstone;

-- 13.Treatment cost>avg.treatment cost
SELECT ï»¿PatientID, Department, TreatmentCost
FROM capstone h
WHERE TreatmentCost >
(SELECT AVG(TreatmentCost)
FROM capstone
WHERE Department = h.Department
);
