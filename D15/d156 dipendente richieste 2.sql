-- create tables
create table d156_dipendente (
    id                             number generated by default on null as identity 
                                   constraint d156_dipendente_id_pk primary key,
    utente                         varchar2(9 char)
                                   constraint d156_dipendente_utente_unq unique not null,
    email                          varchar2(19 char)
                                   constraint d156_dipendente_email_unq unique not null
)
;

create table d156_tipo_richiesta (
    id                             number generated by default on null as identity 
                                   constraint d156_tipo_richiest_id_pk primary key,
    tipo_richiesta                 varchar2(9 char)
                                   constraint d156_tipo_ric_tipo_richies_unq unique not null
)
;

create table d156_richiesta (
    id                             number generated by default on null as identity 
                                   constraint d156_richiesta_id_pk primary key,
    dipendente_id                  number
                                   constraint d156_richiesta_dipendente_i_fk
                                   references d156_dipendente not null,
    tipo_richiesta_id              number
                                   constraint d156_richiest_tipo_richiest_fk
                                   references d156_tipo_richiesta not null,
    descrizione                    varchar2(100 char) not null,
    data_inizio                    date not null,
    data_fine                      date,
    approvato_yn                   varchar2(1 char) constraint d156_richiesta_approvato_yn_ck
                                   check (approvato_yn in ('Y','N'))
)
;

-- table index
create index d156_richiesta_i1 on d156_richiesta (dipendente_id);
create index d156_richiesta_i102 on d156_richiesta (tipo_richiesta_id);

-- load data
 
insert into d156_dipendente (
    id,
    utente,
    email
) values (
    1,
    'MARIO',
    'MARIO@EMAIL.COM'
);

insert into d156_dipendente (
    id,
    utente,
    email
) values (
    2,
    'PAOLA',
    'PAOLA@EMAIL.COM'
);

insert into d156_dipendente (
    id,
    utente,
    email
) values (
    3,
    'FRANCESCA',
    'FRANCESCA@EMAIL.COM'
);

insert into d156_dipendente (
    id,
    utente,
    email
) values (
    4,
    'LUIGI',
    'LUIGI@EMAIL.COM'
);

insert into d156_dipendente (
    id,
    utente,
    email
) values (
    5,
    'SIMONA',
    'SIMONA@EMAIL.COM'
);

commit;

alter table d156_dipendente
modify id generated always as identity restart start with 6;
 
-- load data
-- load data
 
insert into d156_tipo_richiesta (
    id,
    tipo_richiesta
) values (
    1,
    'MALATTIA'
);

insert into d156_tipo_richiesta (
    id,
    tipo_richiesta
) values (
    2,
    'FERIE'
);

insert into d156_tipo_richiesta (
    id,
    tipo_richiesta
) values (
    3,
    'PERMESSO'
);

insert into d156_tipo_richiesta (
    id,
    tipo_richiesta
) values (
    4,
    'SMART'
);

insert into d156_tipo_richiesta (
    id,
    tipo_richiesta
) values (
    5,
    'TRASFERTA'
);

commit;

alter table d156_tipo_richiesta
modify id generated always as identity restart start with 6;
 
 
-- Generated by Quick SQL Luned?? Novembre 21, 2022  10:31:46
 
/*
dipendente /insert 5
  utente vc50 /nn /values mario,paola,francesca,luigi,simona  /unique
  email /nn /values mario@email.com,paola@email.com,francesca@email.com,luigi@email.com,simona@email.com /unique

tipo_richiesta /insert 5
  tipo_richiesta vc30 /nn /values MALATTIA, FERIE, PERMESSO, SMART, TRASFERTA /unique

richiesta
  dipendente_id /nn
  tipo_richiesta_id /nn
  descrizione vc100 /nn
  data_inizio d /nn
  data_fine d 
  approvato_yn 
#ondelete: restrict

# settings = { prefix: "D156", onDelete: "RESTRICT", semantics: "CHAR", language: "EN", APEX: true }
*/
