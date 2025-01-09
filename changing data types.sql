USE Levkivska_271_�������
GO

CREATE TABLE ������� (
	���������� INT, 
	���������� CHAR(50),
	���������� DECIMAL(10, 2)
	CONSTRAINT key_2 PRIMARY KEY(����������)
);

CREATE TABLE [����������]
(
	������������� INT, 
	������� CHAR(50), 
	[��'�] CHAR(50),
	������ CHAR(50) CONSTRAINT C2 CHECK([������] IN('�������� ���������', '���������',
													'��������� �����', '�������� �����',
													'���������', '�������', 
													'���������', '�����')),
	����������� DATE,
	���������� INT,
	³��� CHAR(50),
	���� AS (DATEDIFF(year, �����������, GETDATE())),
	CONSTRAINT key_1  PRIMARY KEY([�������������]),
	CONSTRAINT L_KEY_2 FOREIGN KEY (����������) REFERENCES �������(����������),
)

CREATE TABLE ������ (
	������������� INT,
	�������������� DATE,
	������ CHAR(100),
	����� CHAR(50) CONSTRAINT C3 CHECK(����� IN('����', '�������', '�������', '������� ������')),
	����������� CHAR(20),
	ѳ���������� CHAR(20),
	CONSTRAINT L_KEY_1 FOREIGN KEY (�������������) REFERENCES [����������](�������������),
);
