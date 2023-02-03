tipo_prodotto
  cod_tipo_prodotto vc20 /nn /unique
  tipo_prodotto vc50 /nn

prodotto
  cod_prodotto vc20 /nn /unique
  prodotto vc50 /nn
  tipo_prodotto_id /nn

cliente
  cod_cliente vc20 /nn /unique
  cliente vc50 /nn
  zona_cliente vc20 /nn

vendita
  data d /nn
  prodotto_id /nn
  cliente_id /nn
  quantita num /nn
  valore num /nn

#prefix:x04
#ondelete: restrict
#drop: true
