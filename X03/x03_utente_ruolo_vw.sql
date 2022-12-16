create or replace view x03_utente_ruolo_vw as
select ur.id utente_ruolo_id,
       ur.utente_id,
       u.utente,
       u.nome,
       u.attivo_yn,
       ur.ruolo_id,
       r.ruolo,
       r.descrizione,
       ur.data_inizio,
       ur.data_fine
  from x03_utente_ruolo ur
  join x03_utente u on ur.utente_id = u.id
  join x03_ruolo r on ur.ruolo_id = r.id;
