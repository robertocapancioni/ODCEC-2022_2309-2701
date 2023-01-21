insert into d231_cliente 
            (CODICE_CLIENTE,
             RAGIONE_SOCIALE,
             PIVA,
             INDIRIZZO,
             CODICE_SDI
            )
     values ('C001',
             'ORACLE S.p.A.',
             '1111111',
             'Via Roma 123,Roma (RM)',
             'aa123b');

insert into d231_fattura_testata 
           (cliente_id,
            anno,
            numero,
            descrizione,
            data)
            values
           ((select id from d231_cliente where codice_cliente='C001'),
             2023,
             1,
             'Sviluppo Software',
             to_date('23/01/2023','DD/MM/YYYY')
           );

insert into d231_fattura_dettaglio 
           (fattura_testata_id,
            riga,
            descrizione,
            quantita,
            importo)
            values
           ((select id from d231_fattura_testata where anno = 2023 and numero = 1),
             10,
             'Sviluppo Software',
             1,
             2000
           );
