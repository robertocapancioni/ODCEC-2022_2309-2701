select A.ID,
       A.PERSONA,
       A.COMMESSA,
       A.ATTIVITA,
       A.DATA,
       A.ORE,
       A.COSTO,
       A.ORE * P.TARIFFA COSTO_PERSONA
  from X02_ATTIVITA A
  join X02_PERSONE P
    on A.PERSONA = P.PERSONA
 where A.PERSONA = :APP_USER or :APP_USER='LUISA'
