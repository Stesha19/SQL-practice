USE Levkivska_271_основна
GO

SELECT КодПрацівника, Освіта
FROM Анкети

SELECT DISTINCT Освіта
FROM  Анкети

SELECT Коефіцієнт
FROM Доплати
ORDER BY Коефіцієнт ASC

SELECT *
FROM Працівники
ORDER BY [Ім'я], Посада desc

SELECT Анкети.КодПрацівника,Анкети.Освіта,Працівники.[Ім'я]
FROM Анкети, Працівники

SELECT Анкети.КодПрацівника,Анкети.Освіта,Працівники.[Ім'я]
FROM Анкети, Працівники
WHERE Анкети.КодПрацівника=1

SELECT *
FROM Працівники
WHERE КодДоплати>=2 AND Стаж>2

SELECT *
FROM Працівники
WHERE КодДоплати>=2 OR Стаж>2

SELECT *
FROM Доплати
WHERE Коефіцієнт BETWEEN 0.30 AND 0.40

SELECT *
FROM Працівники
WHERE Прізвище LIKE 'Л%'

SELECT *
FROM Працівники
WHERE Прізвище LIKE 'К_____'

SELECT *
FROM Анкети
WHERE Освіта LIKE 'В[и]%'



SELECT *
FROM Анкети
WHERE Освіта LIKE 'В[^щ]%'

SELECT *
FROM Доплати
WHERE КодДоплати NOT IN (1,2,4)

SELECT *
FROM Анкети
WHERE ДатаНародження IS NULL