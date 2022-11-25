create or replace view d156_richiesta_vw as
select r.id,
       r.dipendente_id,
       d.utente,
       d.email,
       r.tipo_richiesta_id,
      tr.tipo_richiesta,
       r.descrizione,
       r.data_inizio,
       r.data_fine,
       round((data_fine - data_inizio)*24,2) ore
  from d156_richiesta r
  join d156_dipendente d
    on r.dipendente_id = d.id
  join d156_tipo_richiesta tr
    on r.tipo_richiesta_id = tr.id
