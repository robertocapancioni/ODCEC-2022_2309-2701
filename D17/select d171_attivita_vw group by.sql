select 
       dipendente,
       tariffa,
       cliente,
       commessa,
       data,
       ore,
       importo
  from d171_attivita_vw
  
  select 
       sum(ore) tot_ore,
       sum(importo)importo
  from d171_attivita_vw

select dipendente,
           sum(ore) tot_ore,
           sum(importo)importo
      from d171_attivita_vw
  group by dipendente

select dipendente,
           cliente,
           sum(ore) tot_ore,
           sum(importo)importo
      from d171_attivita_vw
  group by dipendente,
           cliente
