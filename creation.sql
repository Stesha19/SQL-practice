USE Levkivska_271_�������
GO
/*CREATE VIEW VIEW3
AS
SELECT �������������, ѳ����������
FROM     ������
WHERE  (ѳ���������� = '�����������') AND (�������������� > '01-01-2001')
*/
CREATE VIEW VIEW4
AS
SELECT �������, ������, (����+1) AS [���� ����� ��]
FROM ����������

CREATE VIEW VIEW5
AS
SELECT �������������, AVG(����) AS [�������� ����]
FROM ����������
GROUP BY �������������

ALTER VIEW VIEW5
AS
SELECT �������������, AVG(����) AS [�������� ����], �������
FROM ����������
GROUP BY �������������, �������

CREATE VIEW VIEWDEL
AS
SELECT * 
FROM ������

DROP VIEW VIEWDEL

INSERT INTO dbo.VIEW1 (�������������, �������, [��'�], ������, �����������, ����������, ³���)
VALUES
(18, '�����������', '����', '�������� �����', '2019-06-27', 3, '�����'),
(19, '��������', '���������', '���������', '2018-12-01', 3, '���������'),
(20, '�������� ', '����', '��������� �����', '2017-10-10', 3, '�����'),
(21, '�������� ', '��������', '���������', '2020-03-14', 2, '�������������'),
(22, '��������� ', '������', '�������� �����', '2022-01-17', 1, '���������');

UPDATE dbo.VIEW1
SET [����������] = 1
WHERE ���� > 6

DELETE FROM dbo.VIEW1 WHERE ������������� = 15

ALTER VIEW dbo.VIEW1
AS
SELECT *
FROM ����������
WHERE ������������� IN(1,3,5,7,9,11)

ALTER VIEW VIEW2
AS
SELECT ����������.�������, ����������.[��'�], ������.ѳ����������
FROM     ������ INNER JOIN
                  ���������� ON ������.������������� = ����������.�������������

ALTER VIEW VIEW3
AS
SELECT �������������, ѳ����������
FROM     ������
WHERE  (ѳ���������� = '�����������') AND (�������������� > '01-01-2001')

SELECT VIEW1.�������������, VIEW1.�������, [�������].����������
FROM VIEW1 JOIN [�������] ON 
VIEW1.������������� = VIEW1.�������������
