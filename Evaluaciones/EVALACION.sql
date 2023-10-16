use Chinook;

CREATE OR REPLACE VIEW Cliente_info as
	SELECT COUNT(il.invoiceId) as CANT_PISTAS_VENDIDAS, Sum(il.invoiceId*il.UnitPrice) as TODAS_COMPRAS 
	FROM InvoiceLine il
	WHERE EXISTS (SELECT a.Name, al.Title FROM Artist a 
				  JOIN Album al using (ArtistId) );  
				  
DROP PROCEDURE IF EXISTS costos_pistas;			 
				 
DELIMITER //
	
CREATE PROCEDURE costos_pistas (IN invoiceId int, OUT UnitPrice)

BEGIN
	
END

//

DELMITER;