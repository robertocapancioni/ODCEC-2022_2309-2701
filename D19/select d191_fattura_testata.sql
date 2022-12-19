select ft.id,
       c.ragione_sociale,
       c.piva,
       c.indirizzo,
       c.codice_sdi,
       ft.anno,
       ft.numero,
       ft.descrizione,
       ft.data,
       fd.riga,
       fd.descrizione,
       fd.quantita,
       fd.importo
  from d191_fattura_testata ft
  join d191_cliente c on ft.cliente_id = c.id
  join d191_fattura_dettaglio fd on fd.fattura_testata_id = ft.id
