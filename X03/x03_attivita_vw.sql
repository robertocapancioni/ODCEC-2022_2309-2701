create or replace view x03_attivita_vw as
select 
       a.id,
       a.attivita,
       a.dipendente_id,
       d.dipendente,
       d.tariffa,
       a.cliente_id,
       c.cliente,
       a.commessa_id,
       m.commessa,
       a.stato_id,
       s.stato,
       s.stato_class,
       a.data,
       to_char(a.data,'YYYY')    anno,
       to_char(a.data,'MM')      mese,
       to_char(a.data,'YYYY-MM') annomese,
       a.ore,
       d.tariffa * a.ore importo
  from x03_attivita a
  join x03_dipendente d on a.dipendente_id = d.id
  join x03_cliente    c on a.cliente_id    = c.id
  join x03_commessa   m on a.commessa_id   = m.id
  join x03_stato      s on a.stato_id      = s.id
