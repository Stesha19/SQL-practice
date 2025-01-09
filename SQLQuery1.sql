CREATE DATABASE Levkivska_271_основна;
GO

USE Levkivska_271_основна
GO
/* Створення таблиці "Users" зі значеннями за замовчуванням і перевіркою введених даних*/
CREATE TABLE Users (
    id INT PRIMARY KEY,
    name VARCHAR(50) DEFAULT 'Невідомо',
    age INT DEFAULT 0,
    gender VARCHAR(10) CHECK (gender IN ('Чоловік', 'Жінка', 'Інше'))
);

/* Створення таблиці "Products" з обчислювальною колонкою та видаленням її в подальшому*/
CREATE TABLE Products (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10, 2),
    discount DECIMAL(5, 2),
    total_price AS (price - (price * discount / 100)) PERSISTED,
);

/*Видалення обчислювальної колонки з таблиці "Products"*/
ALTER TABLE Products
DROP COLUMN total_price;

/* Додавання PRIMARY KEY до таблиці "Users" за допомогою констрейнта*/
ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY (id);

CREATE DATABASE Левківська_Анастасія_271_видалено;

USE Левківська_Анастасія_271_видалено
GO

-- Створення таблиці "Table1" на основі існуючої таблиці "ExistingTable1"
SELECT *
INTO Левківська_Анастасія_271_видалено.dbo.Table1
FROM Users ;

-- Створення таблиці "Table2" на основі існуючої таблиці "ExistingTable2"
SELECT *
INTO Левківська_Анастасія_271_видалено.dbo.Table2
FROM Products;

-- Видалення таблиці "Table1"
DROP TABLE Левківська_Анастасія_271_видалено.dbo.Table1;

-- Видалення таблиці "Table2"
DROP TABLE Левківська_Анастасія_271_видалено.dbo.Table2;

DROP DATABASE Левківська_Анастасія_271_видалено;
GO
