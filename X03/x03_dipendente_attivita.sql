-- drop objects
drop table x03_dipendente cascade constraints;
drop table x03_cliente cascade constraints;
drop table x03_stato cascade constraints;
drop table x03_commessa cascade constraints;
drop table x03_attivita cascade constraints;

-- create tables
create table x03_dipendente (
    id                             number generated by default on null as identity 
                                   constraint x03_dipendente_id_pk primary key,
    dipendente                     varchar2(9 char)
                                   constraint x03_dipendente_dipendente_unq unique not null,
    tariffa                        number not null
)
;

create table x03_cliente (
    id                             number generated by default on null as identity 
                                   constraint x03_cliente_id_pk primary key,
    cliente                        varchar2(10 char)
                                   constraint x03_cliente_cliente_unq unique not null,
    logo                           blob,
    logo_filename                  varchar2(512 char),
    logo_mimetype                  varchar2(512 char),
    logo_charset                   varchar2(512 char),
    logo_lastupd                   date
)
;

create table x03_stato (
    id                             number generated by default on null as identity 
                                   constraint x03_stato_id_pk primary key,
    stato                          varchar2(14 char)
                                   constraint x03_stato_stato_unq unique not null,
    stato_class                    varchar2(9 char)
)
;

create table x03_commessa (
    id                             number generated by default on null as identity 
                                   constraint x03_commessa_id_pk primary key,
    commessa                       varchar2(6 char)
                                   constraint x03_commessa_commessa_unq unique
)
;

create table x03_attivita (
    id                             number generated by default on null as identity 
                                   constraint x03_attivita_id_pk primary key,
    dipendente_id                  number
                                   constraint x03_attivita_dipendente_id_fk
                                   references x03_dipendente not null,
    cliente_id                     number
                                   constraint x03_attivita_cliente_id_fk
                                   references x03_cliente not null,
    commessa_id                    number
                                   constraint x03_attivita_commessa_id_fk
                                   references x03_commessa not null,
    stato_id                       number
                                   constraint x03_attivita_stato_id_fk
                                   references x03_stato not null,
    attivita                       varchar2(50 char)
                                   constraint x03_attivita_attivita_unq unique not null,
    data                           date not null,
    ore                            number not null
)
;

-- table index
create index x03_attivita_i1 on x03_attivita (cliente_id);
create index x03_attivita_i152 on x03_attivita (commessa_id);
create index x03_attivita_i163 on x03_attivita (dipendente_id);
create index x03_attivita_i174 on x03_attivita (stato_id);

-- load data
 
insert into x03_dipendente (
    id,
    dipendente,
    tariffa
) values (
    1,
    'FRANCESCA',
    200
);

insert into x03_dipendente (
    id,
    dipendente,
    tariffa
) values (
    2,
    'ANNA',
    150
);

insert into x03_dipendente (
    id,
    dipendente,
    tariffa
) values (
    3,
    'MARCO',
    100
);

commit;

alter table x03_dipendente
modify id generated always as identity restart start with 4;
 
-- load data
-- load data
 
insert into x03_cliente (
    id,
    cliente,
    logo,
    logo_filename,
    logo_mimetype,
    logo_charset,
    logo_lastupd
) values (
    1,
    'CLIENTE_01',
    null,
    'Client Library Upgrade',
    'Et ultrices posuere cubilia Curae; Proin vulputate placerat pellentesque. Proin viverra lacinialectus, quis consectetur mi venenatis nec.',
    'Vestibulum ante ipsumprimis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vulputate placerat pellentesque. Proin viverra lacinialectus, quis consectetur mi.',
    sysdate - 16
);

insert into x03_cliente (
    id,
    cliente,
    logo,
    logo_filename,
    logo_mimetype,
    logo_charset,
    logo_lastupd
) values (
    2,
    'CLIENTE_02',
    null,
    'Agile Scrum Training',
    'Proin viverra lacinialectus, quis consectetur mi venenatis nec.',
    'Rhoncus non,molestie sit amet lectus. Nulla placerat iaculis aliquam. Vestibulum lacinia arcu in massa pharetra, id mattis risus.',
    sysdate - 85
);

insert into x03_cliente (
    id,
    cliente,
    logo,
    logo_filename,
    logo_mimetype,
    logo_charset,
    logo_lastupd
) values (
    3,
    'CLIENTE_03',
    null,
    'Elastic Rightsize Automation',
    'Ac ante ipsum primis in faucibus. Ut id nulla ac sapien suscipit tristique ac volutpat risus.Phasellus vitae ligula commodo, dictum lorem sit amet, imperdiet ex. Etiam cursus.',
    'Mattis risus rhoncus.Cras vulputate porttitor ligula. Nam semper diam suscipit elementum sodales. Proin sit amet massa eu lorem commodo ullamcorper.Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut id nulla ac sapien suscipit tristique ac volutpat risus.Phasellus vitae ligula commodo, dictum lorem sit amet, imperdiet ex. Etiam cursus porttitor tincidunt. Vestibulum.',
    sysdate - 16
);

commit;

alter table x03_cliente
modify id generated always as identity restart start with 4;
 
-- load data
 
insert into x03_stato (
    id,
    stato,
    stato_class
) values (
    1,
    '10_DA_INIZIARE',
    'U-INFO'
);

insert into x03_stato (
    id,
    stato,
    stato_class
) values (
    2,
    '20_INIZIATO',
    'U-WARNING'
);

insert into x03_stato (
    id,
    stato,
    stato_class
) values (
    3,
    '30_CONCLUSO',
    'U-SUCCESS'
);

insert into x03_stato (
    id,
    stato,
    stato_class
) values (
    4,
    '90_ANNULLATO',
    'U-DANGER'
);

commit;

alter table x03_stato
modify id generated always as identity restart start with 5;
 
-- load data
 
insert into x03_commessa (
    id,
    commessa
) values (
    1,
    'COMM01'
);

insert into x03_commessa (
    id,
    commessa
) values (
    2,
    'COMM02'
);

insert into x03_commessa (
    id,
    commessa
) values (
    3,
    'COMM03'
);

commit;

alter table x03_commessa
modify id generated always as identity restart start with 4;
 
-- load data
 
insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    1,
    'Vulputate Placerat Pellentesque Proin',
    2,
    1,
    3,
    4,
    sysdate - 43,
    76
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    2,
    'Rhoncus Nonmolestie Sit Amet',
    3,
    2,
    2,
    4,
    sysdate - 43,
    94
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    3,
    'Risus Rhoncuscras Vulputate Porttitor',
    1,
    1,
    2,
    1,
    sysdate - 72,
    72
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    4,
    'Diam Suscipit Elementum Sodales',
    3,
    1,
    1,
    2,
    sysdate - 74,
    50
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    5,
    'Cubilia Curae; Proin Vulputate',
    1,
    2,
    1,
    2,
    sysdate - 76,
    65
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    6,
    'Arcu In Massa Pharetra',
    2,
    2,
    2,
    1,
    sysdate - 88,
    2
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    7,
    'Et Malesuada Fames Ac',
    1,
    2,
    1,
    4,
    sysdate - 23,
    20
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    8,
    'Placerat Iaculis Aliquam Vestibulum',
    3,
    2,
    3,
    4,
    sysdate - 82,
    56
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    9,
    'Etiam Cursus Porttitor Tincidunt',
    3,
    1,
    3,
    4,
    sysdate - 66,
    21
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    10,
    'Malesuada Fames Ac Ante',
    3,
    3,
    2,
    1,
    sysdate - 20,
    28
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    11,
    'Ante Ipsumprimis In Faucibus',
    2,
    3,
    2,
    2,
    sysdate - 20,
    56
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    12,
    'Nonmolestie Sit Amet Lectus',
    3,
    1,
    2,
    1,
    sysdate - 99,
    93
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    13,
    'Etiam Cursus Porttitor Tincidunt',
    2,
    1,
    2,
    1,
    sysdate - 40,
    43
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    14,
    'Vitae Ligula Commodo Dictum',
    3,
    1,
    3,
    4,
    sysdate - 47,
    10
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    15,
    'Vulputate Placerat Pellentesque Proin',
    2,
    2,
    1,
    1,
    sysdate - 69,
    21
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    16,
    'Risus Rhoncuscras Vulputate Porttitor',
    1,
    2,
    2,
    3,
    sysdate - 2,
    87
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    17,
    'Diam Suscipit Elementum Sodales',
    3,
    3,
    2,
    1,
    sysdate - 97,
    72
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    18,
    'Ante Ipsumprimis In Faucibus',
    2,
    3,
    1,
    2,
    sysdate - 73,
    3
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    19,
    'Ut Id Nulla Ac',
    2,
    3,
    1,
    3,
    sysdate - 50,
    12
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    20,
    'Luctus Et Ultrices Posuere',
    1,
    2,
    3,
    3,
    sysdate - 99,
    54
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    21,
    'Et Ultrices Posuere Cubilia',
    1,
    1,
    3,
    3,
    sysdate - 78,
    62
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    22,
    'Sit Amet Imperdiet Ex',
    3,
    3,
    1,
    1,
    sysdate - 83,
    66
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    23,
    'Ex Etiam Cursus Porttitor',
    2,
    3,
    1,
    2,
    sysdate - 47,
    65
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    24,
    'Vestibulum Eget Rhoncus Nonmolestie',
    3,
    2,
    3,
    2,
    sysdate - 27,
    1
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    25,
    'Ligula Nam Semper Diam',
    2,
    3,
    1,
    3,
    sysdate - 3,
    22
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    26,
    'Cursus Porttitor Tincidunt Vestibulum',
    2,
    3,
    1,
    2,
    sysdate - 40,
    36
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    27,
    'Cursus Porttitor Tincidunt Vestibulum',
    1,
    2,
    2,
    4,
    sysdate - 41,
    82
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    28,
    'Ex Etiam Cursus Porttitor',
    1,
    2,
    3,
    4,
    sysdate - 3,
    94
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    29,
    'Lectus Nulla Placerat Iaculis',
    2,
    1,
    3,
    3,
    sysdate - 15,
    61
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    30,
    'Etiam Cursus Porttitor Tincidunt',
    2,
    3,
    1,
    2,
    sysdate - 20,
    21
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    31,
    'Ligula Nam Semper Diam',
    1,
    1,
    2,
    1,
    sysdate - 41,
    81
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    32,
    'Pellentesque Proin Viverra Lacinialectus',
    2,
    3,
    3,
    3,
    sysdate - 25,
    25
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    33,
    'Nec Donec Convallis Sollicitudin',
    3,
    2,
    2,
    3,
    sysdate - 8,
    96
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    34,
    'Sollicitudin Elementum Nulla Facilisi',
    1,
    3,
    1,
    4,
    sysdate - 88,
    69
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    35,
    'Sit Amet Massa Eu',
    2,
    3,
    1,
    1,
    sysdate - 26,
    50
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    36,
    'Nonmolestie Sit Amet Lectus',
    3,
    3,
    1,
    4,
    sysdate - 33,
    100
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    37,
    'Posuere Cubilia Curae; Proin',
    2,
    2,
    1,
    1,
    sysdate - 35,
    14
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    38,
    'Rhoncus Nonmolestie Sit Amet',
    3,
    3,
    3,
    4,
    sysdate - 39,
    79
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    39,
    'Venenatis Nec Donec Convallis',
    1,
    3,
    3,
    2,
    sysdate - 64,
    24
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    40,
    'Ligula Nam Semper Diam',
    2,
    3,
    3,
    3,
    sysdate - 97,
    4
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    41,
    'Sit Amet Imperdiet Ex',
    3,
    1,
    3,
    3,
    sysdate - 85,
    41
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    42,
    'Ante Ipsumprimis In Faucibus',
    1,
    1,
    2,
    1,
    sysdate - 18,
    82
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    43,
    'Arcu In Massa Pharetra',
    2,
    2,
    2,
    3,
    sysdate - 71,
    79
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    44,
    'Ex Etiam Cursus Porttitor',
    3,
    3,
    1,
    2,
    sysdate - 59,
    23
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    45,
    'Luctus Et Ultrices Posuere',
    2,
    2,
    1,
    3,
    sysdate - 13,
    67
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    46,
    'Proin Viverra Lacinialectus Quis',
    3,
    2,
    3,
    1,
    sysdate - 10,
    99
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    47,
    'Ante Ipsumprimis In Faucibus',
    1,
    1,
    3,
    2,
    sysdate - 18,
    91
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    48,
    'Suscipit Tristique Ac Volutpat',
    1,
    2,
    1,
    4,
    sysdate - 37,
    59
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    49,
    'Nec Donec Convallis Sollicitudin',
    1,
    2,
    2,
    3,
    sysdate - 28,
    85
);

insert into x03_attivita (
    id,
    attivita,
    dipendente_id,
    cliente_id,
    commessa_id,
    stato_id,
    data,
    ore
) values (
    50,
    'Venenatis Nec Donec Convallis',
    1,
    1,
    3,
    3,
    sysdate - 15,
    30
);

commit;

alter table x03_attivita
modify id generated always as identity restart start with 51;
 
 
-- Generated by Quick SQL Venerdì Dicembre 16, 2022  11:09:13
 
/*
dipendente /insert 3
  dipendente vc50 /nn /values francesca,anna,marco /unique
  tariffa num /nn /values 200,150,100

cliente /insert 3
  cliente vc50 /nn /values cliente_01,cliente_02,cliente_03 /unique
  logo file

stato /insert 4
  stato vc50 /nn /values 10_da_iniziare, 20_iniziato, 30_concluso,90_annullato /unique
  stato_class vc50 /values u-info,u-warning,u-success,u-danger

commessa /insert 3
  commessa vc30 /values comm01,comm02,comm03 /unique

attivita /insert 50
  attivita vc50 /nn /unique
  dipendente_id /nn
  cliente_id /nn
  commessa_id /nn
  stato_id /nn
  data d /nn
  ore num /nn
#ondelete:restrict
#drop:true

# settings = { prefix: "X03", onDelete: "RESTRICT", semantics: "CHAR", drop: true, language: "EN", APEX: true }
*/
