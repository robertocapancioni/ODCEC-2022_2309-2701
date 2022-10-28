select 
      a.ID,
      a.DATA_INIZIO,
      a.DATA_FINE,
      a.DESCRIZIONE,
      a.TIPO_APPUNTAMENTO_ID,
     ta.TIPO_APPUNTAMENTO, 
      a.NOME_ID,
      n.NOME,
      case ta.TIPO_APPUNTAMENTO
          when 'Primo Appuntamento'  then 'apex-cal-red'
          when 'Altro Appuntamento'  then 'apex-cal-blue'
          when 'Ultimo Appuntamento' then 'apex-cal-green'
      end CLASSE_COLORE
 from D10_APPUNTAMENTO a
 join D10_TIPO_APPUNTAMENTO ta
   on a.TIPO_APPUNTAMENTO_ID = 
     ta.TIPO_APPUNTAMENTO_ID
 join D10_NOME n
   on a.NOME_ID = n.NOME_ID
