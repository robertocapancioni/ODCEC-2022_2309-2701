-- area annomese
select ANNOMESE, count(*) value
  from D222_VENDITA
 where DATA between nvl(:P2_DATA_INIZIO,data) and nvl(:P2_DATA_FINE,data)
 group by ANNOMESE
 order by ANNOMESE
