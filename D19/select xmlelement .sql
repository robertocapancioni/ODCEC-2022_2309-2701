select xmlelement("Anno",ft.anno)Anno,
       xmlelement("Numero",ft.numero)Numero
  from d191_fattura_testata ft
  

select xmlelement("Anno",ft.anno) ||
       xmlelement("Numero",ft.numero) Xml
  from d191_fattura_testata ft
  
 
select xmlelement("FatturaElettronica",
                  xmlelement("Anno",ft.anno) ||
                  xmlelement("Numero",ft.numero)
       ) Xml
  from d191_fattura_testata ft
  
 
 -- i replace correggono la visualizzazione sul web per i caratteri < e >
 select replace(replace(replace(
        xmlelement("FatturaElettronica",
                  xmlelement("Anno",ft.anno) ||
                  xmlelement("Numero",ft.numero)
       )
       ,'&amp;','&'),'&gt;','>'),'&lt;','<')
       xml
  from d191_fattura_testata ft
  
  -- esempio di tag xml annidati
  select 
       replace(replace(replace(
       xmlelement("FatturaElettronica",
                    xmlelement("FatturaElettronicaBody",
                                xmlelement("Anno",ft.anno) ||
                                xmlelement("Numero",ft.numero)
                    )
       )
       ,'&amp;','&'),'&gt;','>'),'&lt;','<') 
       Xml
  from d191_fattura_testata ft
  
  select 
       replace(replace(replace(
       xmlelement("FatturaElettronica",
                 xmlelement("Anno",ft.anno) ||
                 xmlelement("Numero",ft.numero)||
                 xmlelement("RagioneSociale",c.ragione_sociale)
       )
       ,'&amp;','&'),'&gt;','>'),'&lt;','<') 
       Xml  
  from d191_fattura_testata ft
  join d191_cliente c on ft.cliente_id = c.id
  
  
  
