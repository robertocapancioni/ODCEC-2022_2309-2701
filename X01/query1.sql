select 
'fa fa-building-o'ICON_CLASS,
'u-hot'ICON_COLOR_CLASS,
'N° Progetti Totali'list_text,
to_char(sum(numero),'999G999G999G990') list_title
from X01_KICKSTARTER
union
select 
'fa fa-smile-o'ICON_CLASS,
'u-warning'ICON_COLOR_CLASS,
'N° Progetti Riusciti'list_text,
to_char(sum(numero),'999G999G999G990') list_title
from X01_KICKSTARTER
where esito='Riuscito'
union
select 
'fa fa-frown-o'ICON_CLASS,
'u-info'ICON_COLOR_CLASS,
'N° Failed Projects'list_text,
to_char(sum(numero),'999G999G999G990') list_title
from X01_KICKSTARTER
where esito='Fallito'
union
select 
'fa fa-smile-o'ICON_CLASS,
'u-danger'ICON_COLOR_CLASS,
'Value cifra_raggiunta Riuscitol'list_text,
to_char(sum(cifra_raggiunta)/1000000,'999G999G999G990')||' M$'list_title
from X01_KICKSTARTER
where esito='Riuscito'
