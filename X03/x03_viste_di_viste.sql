create or replace view x03_attivita_dip_vw as
    select dipendente,
           sum(ore) tot_ore,
           sum(importo)importo
      from x03_attivita_vw
  group by dipendente;
  
   create or replace view x03_attivita_dip_cli_vw as
    select dipendente,
           cliente,
           sum(ore) tot_ore,
           sum(importo)importo
      from x03_attivita_vw
  group by dipendente,
           cliente;
  
  create or replace view x03_attivita_annomese_vw as
    select annomese,
           sum(ore) tot_ore,
           sum(importo)importo
      from x03_attivita_vw
  group by annomese;
