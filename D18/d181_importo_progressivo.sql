select annomese,
        tot_ore,
        importo, 
        sum(importo) over (order by annomese rows unbounded preceding) importo_progr
   from d181_attivita_annomese_vw
  order by annomese
