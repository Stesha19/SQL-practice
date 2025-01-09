USE Levkivska_271_основна
GO

CREATE TABLE Доплати (
	КодДоплати INT, 
	ВидДоплати CHAR(50),
	Коефіцієнт DECIMAL(10, 2)
	CONSTRAINT key_2 PRIMARY KEY(КодДоплати)
);

CREATE TABLE [Працівники]
(
	КодПрацівника INT, 
	Прізвище CHAR(50), 
	[Ім'я] CHAR(50),
	Посада CHAR(50) CONSTRAINT C2 CHECK([Посада] IN('Головний спеціаліст', 'Інспектор',
													'Начальник віддіду', 'Провідний юрист',
													'Програміст', 'Сисадмін', 
													'Спеціаліст', 'Юрист')),
	ДатаПрийому DATE,
	КодДоплати INT,
	Відділ CHAR(50),
	Стаж AS (DATEDIFF(year, ДатаПрийому, GETDATE())),
	CONSTRAINT key_1  PRIMARY KEY([КодПрацівника]),
	CONSTRAINT L_KEY_2 FOREIGN KEY (КодДоплати) REFERENCES Доплати(КодДоплати),
)

CREATE TABLE Анкети (
	КодПрацівника INT,
	ДатаНародження DATE,
	Адреса CHAR(100),
	Освіта CHAR(50) CONSTRAINT C3 CHECK(Освіта IN('вища', 'середня', 'неповна', 'наукова ступінь')),
	МобілТелефон CHAR(20),
	СімейнийСтан CHAR(20),
	CONSTRAINT L_KEY_1 FOREIGN KEY (КодПрацівника) REFERENCES [Працівники](КодПрацівника),
);
