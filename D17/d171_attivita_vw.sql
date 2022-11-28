create or replace view d171_attivita_vw as
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
  from d171_attivita a
  join d171_dipendente d on a.dipendente_id = d.id
  join d171_cliente    c on a.cliente_id    = c.id
  join d171_commessa   m on a.commessa_id   = m.id
