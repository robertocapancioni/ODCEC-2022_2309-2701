select c.comune,
       c.provincia_cod,
       p.provincia_cod,
       p.provincia
  from d13_comuni c
  join d13_province p
    on c.provincia_cod = p.provincia_cod
    
