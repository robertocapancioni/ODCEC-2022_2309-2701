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
