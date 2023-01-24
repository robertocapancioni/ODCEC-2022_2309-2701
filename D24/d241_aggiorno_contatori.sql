--select max(id)+1 from d241_cliente; -- 26
alter table d241_cliente modify id generated always as identity restart start with 26;
--select max(id)+1 from d241_tipo_prodotto; -- 13
alter table d241_tipo_prodotto modify id generated always as identity restart start with 13;
--select max(id)+1 from d241_prodotto; -- 78
alter table d241_prodotto modify id generated always as identity restart start with 78;
--select max(id)+1 from d241_vendita; -- 26
alter table d241_vendita modify id generated always as identity restart start with 501;
