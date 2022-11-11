update x02_ciclo_attivo set datipagamento_dettagliopagamento_importopagame = round(datipagamento_dettagliopagamento_importopagame,2);
update x02_ciclo_passivo set datipagamento_dettagliopagamento_importopagame = round(datipagamento_dettagliopagamento_importopagame,2);



create or replace force editionable view x02_ciclo_attivo_cumulato_vw  as 
  select annomese_incasso,
       sum(importo_incasso) over ( order by annomese_incasso range unbounded preceding )importo_incasso_cumulato,
       importo_incasso
       from (
              select 
                     to_char(datipagamento_dettagliopagamento_datascadenzap,'YYYY-MM')annomese_incasso,
                     sum(datipagamento_dettagliopagamento_importopagame) importo_incasso
                from x02_ciclo_attivo
            group by to_char(datipagamento_dettagliopagamento_datascadenzap,'YYYY-MM')
           )
  order by annomese_incasso
/

create or replace force editionable view x02_ciclo_passivo_cumulato_vw as 
  select annomese_pagamento,
       sum(importo_pagamento) over ( order by annomese_pagamento range unbounded preceding )importo_pagamento_cumulato,
       importo_pagamento
       from (
              select 
                     to_char(datipagamento_dettagliopagamento_datascadenzap,'YYYY-MM')annomese_pagamento,
                     sum(datipagamento_dettagliopagamento_importopagame) importo_pagamento                from x02_ciclo_passivo
            group by to_char(datipagamento_dettagliopagamento_datascadenzap,'YYYY-MM')
           )
  order by annomese_pagamento
/

create or replace force editionable view x02_altri_incassi_pagamenti_cumulati_vw as 
  select annomese_movimento,
       sum(importo_movimento) over ( order by annomese_movimento range unbounded preceding )importo_movimento_cumulato,
       importo_movimento
       from (
              select 
                     to_char(data,'YYYY-MM')annomese_movimento,
                     sum(importo) importo_movimento 
              from x02_altri_incassi_pagamenti
            group by to_char(data,'YYYY-MM')
           )
  order by annomese_movimento
/

create or replace force editionable view x02_tesoreria_anno_mese_tipo_operazione_vw  as 
  select 'PAGAMENTO' tipo_operazione,annomese_pagamento annomese,-importo_pagamento importo,-importo_pagamento_cumulato importo_cumulato from x02_ciclo_passivo_cumulato_vw union
select 'INCASSO' tipo_operazione,annomese_incasso annomese,importo_incasso importo,importo_incasso_cumulato importo_cumulato from x02_ciclo_attivo_cumulato_vw union
select 'ALTRI MOVIMENTI' tipo_operazione,annomese_movimento annomese,importo_movimento importo,importo_movimento_cumulato importo_cumulato from x02_altri_incassi_pagamenti_cumulati_vw
/

create or replace view x02_ciclo_attivo_vw as
select cessionariocommittente_datianagrafici_anag_1 ragione_sociale,
       cessionariocommittente_sede_comune comune,
       cessionariocommittente_sede_provincia provincia,
       datigenerali_datigeneralidocumento_data data_emissione,
       datipagamento_dettagliopagamento_datascadenzap data_scadenza,
       datipagamento_dettagliopagamento_datapagamento data_pagamento,
       datipagamento_dettagliopagamento_importopagame importo,
       case 
         when datipagamento_dettagliopagamento_datapagamento is null 
         then 0 
         else datipagamento_dettagliopagamento_importopagame
       end importo_pagato,
       case 
         when datipagamento_dettagliopagamento_datapagamento is not null 
         then 0 
         else datipagamento_dettagliopagamento_importopagame
       end importo_non_pagato
        from x02_ciclo_attivo
    /
 
create or replace view x02_ciclo_attivo_annomese_vw as
select 
       to_char(data_emissione,'YYYY-MM')annomese_emissione,
       sum(importo)importo,
       sum(importo_pagato)importo_pagato,
       sum(importo_non_pagato)importo_non_pagato,
       round(100*sum(importo_non_pagato)/sum(importo),2) perc_impagato
  from x02_ciclo_attivo_vw
 group by to_char(data_emissione,'YYYY-MM')
 /

create or replace  view x02_ciclo_attivo_ragione_sociale_vw as 
  select 
       ragione_sociale,
       sum(importo)importo,
       sum(importo_pagato)importo_pagato,
       sum(importo_non_pagato)importo_non_pagato,
       round(100*sum(importo_non_pagato)/sum(importo),2) perc_impagato
  from x02_ciclo_attivo_vw
 group by ragione_sociale
 /
 
 create or replace view x02_ciclo_passivo_vw as
select cedenteprestatore_datianagrafici_anagrafica_ ragione_sociale,
       cedenteprestatore_sede_comune comune,
       cedenteprestatore_sede_provincia provincia,
       datigenerali_datigeneralidocumento_data data_emissione,
       datipagamento_dettagliopagamento_datascadenzap data_scadenza,
       datipagamento_dettagliopagamento_importopagame importo
        from x02_ciclo_passivo
    /

create or replace view x02_ciclo_passivo_annomese_vw as
select 
       to_char(data_emissione,'YYYY-MM')annomese_emissione,
       sum(importo)importo
  from x02_ciclo_passivo_vw
 group by to_char(data_emissione,'YYYY-MM')
 /
