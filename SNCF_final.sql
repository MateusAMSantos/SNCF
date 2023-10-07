USE SNCF

SELECT *
FROM SNCF..Lost_Objects

--SELECT *
--FROM SNCF..Lost_Objects
--WHERE Gare like '%Nord%'
--	AND [Type d'objets] like '%Bagagerie%'
--	AND [Date de la déclaration de perte] like '%2018-10%'
--ORDER BY [Date de la déclaration de perte] DESC


SELECT *
FROM SNCF..Lost_Objects

SELECT *
FROM SNCF..Found_Objects

--- ============================ Creating a table to store the lost items data
CREATE TABLE Lost_Items (
	Date DATE,
	Station NVARCHAR(250),
	Item_Nature NVARCHAR(250),
	Item_Type NVARCHAR(250)
)

INSERT INTO Lost_Items
SELECT
	Date,
	Gare,
	[Nature d'objets],
	[Type d'objets]
FROM SNCF..Lost_Objects
ORDER BY DATE DESC

--- ============================ Creating a table to store the found items data
CREATE TABLE Found_Items (
	Date DATE,
	Station NVARCHAR(250),
	Item_Nature NVARCHAR(250),
	Item_Type NVARCHAR(250)
)

INSERT INTO Found_Items
SELECT
	Date,
	Gare,
	[Nature d'objets],
	[Type d'objets]
FROM SNCF..Found_Objects
ORDER BY Date DESC