create or replace view d241_vendita_vw as
select v.id,
       v.cliente_id,
       c.cliente,
       c.zona_cliente,
       v.prodotto_id,
       p.prodotto,
       p.tipo_prodotto_id,
       tp.tipo_prodotto,
       v.data,
       v.quantita,
       v.importo
  from d241_vendita v
  join d241_cliente c on v.cliente_id = c.id 
  join d241_prodotto p on v.prodotto_id = p.id
  join d241_tipo_prodotto tp on p.tipo_prodotto_id = tp.id;

select v.id,
       v.cliente,
       v.zona_cliente,
       v.prodotto,
       v.tipo_prodotto,
       v.data,
       v.quantita,
       v.importo
  from d241_vendita_vw v
  where exists (
select 1
  from apex_appl_acl_user_roles r
 where r.application_id = :app_id
   and r.user_name = :app_user
   and r.role_static_id in (v.zona_cliente,'ADMINISTRATOR')
 );
