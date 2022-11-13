select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d13_comuni c
  join d13_province p
    on c.provincia_cod = p.provincia_cod
    
delete 
  from d13_comuni 
 where provincia_cod in ('BG','BS','CO')

delete 
  from d13_provincia 
 where provincia_cod in ('MN','PV','SO','VA')

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d13_comuni c
  left
  join d13_province p
    on c.provincia_cod = p.provincia_cod

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d13_comuni c
  left
  join d13_province p
    on c.provincia_cod = p.provincia_cod

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d13_comuni c
 right
  join d13_province p
    on c.provincia_cod = p.provincia_cod

select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d13_comuni c
  full
  join d13_province p
    on c.provincia_cod = p.provincia_cod

insert 
  into d13_comuni 
       (comune,provincia_cod)
values ('Arese','MI')

insert 
  into d13_province
       (provincia_cod,provincia)
values ('MI','Milano (doppio)')
