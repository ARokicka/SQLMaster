
USE [AdventureWorks2012]
GO
/****** Object:  StoredProcedure [dbo].[uspGetBillOfMaterials]    Script Date: 19.05.2018 10:01:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.uspUpdateTotalCosts
	@SalesOrderID INT
AS
BEGIN
	
	/*
		Usunięcie kolumny
	*/	

	--1. Usunięcie kolumny jeśli istnieje poprzez DROP COLUMN IF EXISTS
	ALTER TABLE Sales.SalesOrderHeader DROP COLUMN IF EXISTS TotalCosts;
	-- 2. Usunięcie kolumny jeśli istnieje przeprzez "stare" rozwiązanie przed SQL 2016
	--IF EXISTS(SELECT * FROM SYS.columns WHERE [name] = 'TotalCosts' AND  
	--		  OBJECT_ID = OBJECT_ID('Sales.SalesOrderHeader'))
	--ALTER TABLE Sales.SalesOrderHeader DROP COLUMN TotalCosts

	/*
		Dodanie kolumny TotalCosts do tabeli Sales.SalesOrderHeader
	*/

		ALTER TABLE Sales.SalesOrderHeader ADD TotalCosts MONEY;

	/*
		Aktualizacja kolumny TotalCosts
	*/

		UPDATE	Sales.SalesOrderHeader
		SET		TotalCosts = dbo.ufnGetTotalCosts(@SalesOrderID)
		WHERE	SalesOrderID = @SalesOrderID;

		SELECT SalesOrderID, TotalCosts 
		FROM Sales.SalesOrderHeader WHERE SalesOrderID = @SalesOrderID;

END 