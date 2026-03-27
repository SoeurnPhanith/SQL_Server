-- /*Create store procedure to get data by inner join*/
CREATE PROCEDURE getResult
AS 
BEGIN
    SELECT s.StuId, s.Name, s.Gender, sc.Score
    FROM tblStudents s 
    INNER JOIN tblScore sc 
    ON s.StuId = sc.ScId;
END;
GO
    


CREATE PROCEDURE insertStudents
    @Student_Name VARCHAR(100),
    @Gender VARCHAR(6),
    @DoB DATE
AS
BEGIN
    INSERT INTO tblStudents(Name, Gender, DoB)
    VALUES(@Student_Name, @Gender, @DoB);
END;
GO



CREATE PROCEDURE updateStudents
    @StuId INT,
    @Student_Name VARCHAR(100) = NULL,
    @Gender VARCHAR(6) = NULL, 
    @DoB DATE = NULL
AS
BEGIN 
    UPDATE tblStudents
    SET Name   = CASE WHEN @Student_Name IS NOT NULL THEN @Student_Name ELSE Name END,
        Gender = CASE WHEN @Gender IS NOT NULL THEN @Gender ELSE Gender END,
        DoB    = CASE WHEN @DoB IS NOT NULL THEN @DoB ELSE DoB END
    WHERE StuId = @StuId;
END;
GO


CREATE PROCEDURE deleteStudentById
    @StuId int
AS 
BEGIN 
    DELETE FROM tblStudents WHERE StuId = @StuId;
END;
GO

/*This procedure*/

EXEC getResult;

EXEC insertStudents 'Soeurn Chanana', 'Female', '2016-06-16';

EXEC updateStudents @StuId=1, @Student_Name = 'phanith soeurn';

EXEC deleteStudentById 5;
