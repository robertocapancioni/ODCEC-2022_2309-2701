select xmlelement("Anno",ft.anno)Anno,
       xmlelement("Numero",ft.numero)Numero
  from d201_fattura_testata ft;

select xmlelement("Testata",
                 xmlelement("Anno",ft.anno),
                 xmlelement("Numero",ft.numero)
       ) Xml  
  from d201_fattura_testata ft;

select xmlagg(xmlelement("Dettaglio",
                         xmlelement("Riga",fd.riga),
                         xmlelement("Descrizione",fd.descrizione),
                         xmlelement("Quantita",fd.quantita),
                         xmlelement("Importo",fd.importo)
                        ) 
              order by fd.riga
             ) xml 
  from d201_fattura_dettaglio fd 
 where fattura_testata_id=1;
 
 
  
  
