USE Levkivska_271_основна
GO

CREATE VIEW VIEW1
AS
SELECT *
FROM Працівники

CREATE VIEW VIEW2
AS
SELECT Відділ, [Ім'я],
FROM Працівники JOIN
Анкети ON ДатаНародження


