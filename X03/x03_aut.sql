.-- create tables
create table x03_utente (
    id                             number generated by default on null as identity 
                                   constraint x03_utente_id_pk primary key,
    utente                         varchar2(32 char)
                                   constraint x03_utente_utente_unq unique not null,
    nome                           varchar2(50 char) not null,
    attivo_yn                      varchar2(1 char) default 'Y' constraint x03_utente_attivo_yn_ck
                                   check (attivo_yn in ('Y','N')) not null
)
;

create table x03_ruolo (
    id                             number generated by default on null as identity 
                                   constraint x03_ruolo_id_pk primary key,
    ruolo                          varchar2(32 char)
                                   constraint x03_ruolo_ruolo_unq unique not null,
    descrizione                    varchar2(50 char) not null
)
;

create table x03_utente_ruolo (
    id                             number generated by default on null as identity 
                                   constraint x03_utente_ruolo_id_pk primary key,
    utente_id                      number
                                   constraint x03_utente_ruolo_utente_id_fk
                                   references x03_utente not null,
    ruolo_id                       number
                                   constraint x03_utente_ruolo_ruolo_id_fk
                                   references x03_ruolo not null,
    data_inizio                    date not null,
    data_fine                      date
)
;

-- table index
create index x03_utente_ruolo_i1 on x03_utente_ruolo (ruolo_id);
create index x03_utente_ruolo_i92 on x03_utente_ruolo (utente_id);

-- load data
 
-- Generated by Quick SQL Venerdì Dicembre 16, 2022  07:47:19
 
/*
utente
  utente vc32 /nn /unique
  nome vc50 /nn
  attivo_yn /nn /default Y

ruolo
  ruolo vc32 /nn /unique
  descrizione vc50 /nn

utente_ruolo
  utente_id /nn
  ruolo_id /nn
  data_inizio d /nn
  data_fine d
  
#ondelete:restrict

# settings = { prefix: "X03", onDelete: "RESTRICT", semantics: "CHAR", language: "EN", APEX: true }
*/

