USE Academy5

/* 1 */
SELECT D.Building FROM Departments D GROUP BY D.Building HAVING SUM(D.Financing) > 100000

/* 3 */
SELECT G.Name AS GroupName FROM Groups G WHERE (SELECT AVG(S.Rating) FROM Students S WHERE S.Id 
IN (SELECT GS.StudentId FROM GroupsStudents GS WHERE GS.GroupId = G.Id)) > (SELECT AVG(S.Rating) FROM Students S WHERE S.Id IN 
(SELECT GS.StudentId FROM GroupsStudents GS WHERE GS.GroupId = (SELECT Id FROM Groups WHERE Name = 'D221')));

/* 4 */
SELECT Name + ' ' + Surname AS FullName FROM Teachers WHERE Salary > (SELECT AVG(Salary) FROM Teachers WHERE IsProfessor = 1);

/* 5 */

SELECT G.Name AS GroupName FROM Groups G WHERE (SELECT COUNT(*) FROM GroupsCurators GC WHERE GC.GroupId = G.Id) > 1;

/* 7 */

SELECT F.Name AS FacultyName FROM Faculties F WHERE (SELECT SUM(D.Financing) FROM Departments D WHERE D.FacultyId = F.Id) 
	> (SELECT SUM(D.Financing) FROM Departments D WHERE D.FacultyId = (SELECT Id FROM Faculties WHERE Name = 'Computer Science'));

/* 9 */

SELECT (SELECT Name FROM Subjects WHERE Id = (SELECT TOP 1 L.SubjectId FROM Lectures L GROUP BY L.SubjectId 
       ORDER BY COUNT(*) ASC)) AS Subj