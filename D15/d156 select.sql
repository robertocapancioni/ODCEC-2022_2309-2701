select ID,
       UTENTE,
       EMAIL
  from D156_DIPENDENTE
  where utente = :APP_USER

select R.ID,
       R.DIPENDENTE_ID,
       R.TIPO_RICHIESTA_ID,
       R.DESCRIZIONE,
       R.DATA_INIZIO,
       R.DATA_FINE,
       R.APPROVATO_YN
  from D156_RICHIESTA R
  join D156_DIPENDENTE D
    on R.DIPENDENTE_ID = D.ID
 where D.UTENTE = :APP_USER
