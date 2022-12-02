create or replace view d181_attivita_vw as
select 
       a.id,
       a.dipendente_id,
       d.dipendente,
       d.tariffa,
       a.cliente_id,
       c.cliente,
       a.commessa_id,
       m.commessa,
       a.data,
       a.ore,
       d.tariffa * a.ore importo
  from d181_attivita a
  join d181_dipendente d on a.dipendente_id = d.id
  join d181_cliente    c on a.cliente_id    = c.id
  join d181_commessa   m on a.commessa_id   = m.id
