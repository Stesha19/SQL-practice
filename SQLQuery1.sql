CREATE DATABASE Levkivska_271_�������;
GO

USE Levkivska_271_�������
GO
/* ��������� ������� "Users" � ���������� �� ������������� � ��������� �������� �����*/
CREATE TABLE Users (
    id INT PRIMARY KEY,
    name VARCHAR(50) DEFAULT '�������',
    age INT DEFAULT 0,
    gender VARCHAR(10) CHECK (gender IN ('������', 'Ƴ���', '����'))
);

/* ��������� ������� "Products" � �������������� �������� �� ���������� �� � ����������*/
CREATE TABLE Products (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10, 2),
    discount DECIMAL(5, 2),
    total_price AS (price - (price * discount / 100)) PERSISTED,
);

/*��������� ������������� ������� � ������� "Products"*/
ALTER TABLE Products
DROP COLUMN total_price;

/* ��������� PRIMARY KEY �� ������� "Users" �� ��������� �����������*/
ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY (id);

CREATE DATABASE ���������_��������_271_��������;

USE ���������_��������_271_��������
GO

-- ��������� ������� "Table1" �� ����� ������� ������� "ExistingTable1"
SELECT *
INTO ���������_��������_271_��������.dbo.Table1
FROM Users ;

-- ��������� ������� "Table2" �� ����� ������� ������� "ExistingTable2"
SELECT *
INTO ���������_��������_271_��������.dbo.Table2
FROM Products;

-- ��������� ������� "Table1"
DROP TABLE ���������_��������_271_��������.dbo.Table1;

-- ��������� ������� "Table2"
DROP TABLE ���������_��������_271_��������.dbo.Table2;

DROP DATABASE ���������_��������_271_��������;
GO
