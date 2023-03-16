/*CREATE PROC USP_tblEvent
AS
BEGIN
	SELECT * FROM tblEvent
END
GO

CREATE PROC USP_tblCountry
AS
BEGIN
	SELECT * FROM tblCountry
END*/

SELECT * FROM SYS.sql_modules WHERE definition LIKE '%tblEvent%'

SP_DEPENDS 'tblEvent'

SELECT OBJECT_NAME(id)
FROM SYSCOMMENTS
WHERE text LIKE '%tblEvent%' AND
OBJECTPROPERTY(id, 'IsProcedure') = 1
GROUP BY OBJECT_NAME(id)

select OBJECT_NAME(object_id)
from sys.sql_modules 
WHERE definition LIKE '%tblEvent%'

SELECT ROUTINE_NAME
FROM INFORMATION_SCHEMA.ROUTINES 
WHERE ROUTINE_DEFINITION LIKE '%tblEvent%' AND 
ROUTINE_TYPE='PROCEDURE'