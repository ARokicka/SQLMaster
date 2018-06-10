
/*
	Utw�rz funkcj�, kt�ra zwr�ci koszt zam�wienia wyliczony jako �rednia warto�� wszystich produkt�w jakiego dotyczy zam�wienie.
	
	Nazwij funkcj�: dbo.ufnGetTotalCosts

	Na przyk�ad je�li zam�wienie o id 100 ma 5 produkt�w to wynikiem funkcji ma by� skalarna warto�� - �rednia wszystkich 5 produkt�w 
	(kolumna ListPrice w tabeli Production.Product).

	Przyk�ady poprawnych wynik�w funkcji dla kilku SalesOrderID
	SalesOrderID	TotalCosts
		43697		3578,27
		43698		3399,99
		43700		782,99

	Funkcja powinna zwr�ci� warto�� o typie MONEY
*/

/*
	Napisz procedur� sk�adowan�, kt�ra wykona nast�puj�ce czynno�ci:

	1. Dodanie nowej kolumny do tabeli Sales.SalesOrderHeader o nazwie TotalCosts z typem MONEY
	2. Kolumna mo�e przyj�� tylko warto�ci wi�ksze od 0
	3. Procedura ma si� wykona� z jednym parametrem: SalesOrderID z typem INT
	4. Po dodaniu kolumny do tabeli ma si� zaktualizowa� wiersz TotalCosts jako wykonanie fukncji dbo.ufnGetTotalCosts
	5. Na ko�cu procedura ma wy�wietli� zaktualizowany wiersz:
		
		Kolumny w zestawieniu:
			- SalesOrderId
			- TotalCosts
		
	
UWAGA!
	1. Procedura ma w sobie operacj� DDL, wi�c nale�y pami�ta�, �e wykonanie procedury po raz X zwr�ci b��d
		,poniewa� nie mo�emy za ka�dym razem dodawa� nowej kolumny o takiej samej nazwie do tej samej tabeli.
	2. Procedura powinna obs�u�y� ten przypadek. Moja propozycja 2 rozwi�za�:
		2a. Przed dodaniem kolumny usun�� kolumn� je�li istnieje - jest jedna konstrukcja do tego typu operacji ( DROP COLUMN IF EXISTS )
			UWAGA! zadzia�a tylko w wersji >= 2016
		2b. Bardziej klasyczne rozwi�zanie polegaj�ce na sprawdzeniu w tabelach systemowych czy istnieje kolumna TotalCosts w tabeli Sales.SalesOrderHeader.
			Do tego konstrukcja IF, je�li istnieje to nic nie r�b, a je�li nie to utw�rz.

*/
