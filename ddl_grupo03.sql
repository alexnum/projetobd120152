
drop table if exists AGENTE_FINANCIADOR;

drop table if exists ALUNO;

drop table if exists DEPARTAMENTO;

drop table if exists FINANCIADOR_PROJETO;

drop table if exists GRADUACAO;

drop table if exists LABORATORIO;

drop table if exists LINHA_PESQUISA;

drop table if exists PATENTE;

drop table if exists PESSOA;

drop table if exists PESSOA_PUBLICACAO;

drop table if exists POS;

drop table if exists PROFESSOR;

drop table if exists PROFESSOR_PROJETO;

drop table if exists PROJETO;

drop table if exists PROJETO_LABORATORIO;

drop table if exists PROJETO_LINHAPESQUISA;

drop table if exists PUBLICACAO;

drop table if exists RECURSO;

drop table if exists TELEFONE_DEPTO;

drop table if exists TELEFONE_FINANCIADOR;

/*==============================================================*/
/* Table: AGENTE_FINANCIADOR                                    */
/*==============================================================*/
create table AGENTE_FINANCIADOR
(
   COD_AGENTE           integer not null auto_increment,
   NOME_AGENTE          varchar(100),
   EMAIL_AGENTE         varchar(100),
   ENDERECO_AGENTE      varchar(200),
   primary key (COD_AGENTE)
);

/*==============================================================*/
/* Table: ALUNO                                                 */
/*==============================================================*/
create table ALUNO
(
   ID_ALUNO             integer not null auto_increment,
   MATRICULA            integer,
   COD_PROJETO          integer,
   COD_AREA             integer,
   COD_SUBAREA          integer,
   primary key (ID_ALUNO)
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO
(
   COD_DEPTO            integer not null auto_increment,
   ID_PROFESSOR         integer,
   NOME_DEPTO           varchar(50),
   ENDERECO             varchar(200),
   primary key (COD_DEPTO)
);

/*==============================================================*/
/* Table: FINANCIADOR_PROJETO                                   */
/*==============================================================*/
create table FINANCIADOR_PROJETO
(
   ID_AGENTE_PROJETO    integer not null auto_increment,
   COD_AGENTE           integer,
   COD_PROJETO          integer,
   primary key (ID_AGENTE_PROJETO)
);

/*==============================================================*/
/* Table: GRADUACAO                                             */
/*==============================================================*/
create table GRADUACAO
(
   ID_GRADUACAO         integer not null auto_increment,
   ID_ALUNO             integer,
   SUP_POS              integer,
   primary key (ID_GRADUACAO)
);

/*==============================================================*/
/* Table: LABORATORIO                                           */
/*==============================================================*/
create table LABORATORIO
(
   COD_LABORATORIO      integer not null auto_increment,
   NOME_LABORATORIO     varchar(100),
   LOCALIZACAO_LABORATORIO varchar(150),
   primary key (COD_LABORATORIO)
);

/*==============================================================*/
/* Table: LINHA_PESQUISA                                        */
/*==============================================================*/
create table LINHA_PESQUISA
(
   COD_AREA             integer not null,
   COD_SUBAREA          integer not null,
   NOME_AREA            varchar(50),
   NOME_SUBAREA         varchar(50),
   primary key (COD_AREA, COD_SUBAREA)
);

/*==============================================================*/
/* Table: PATENTE                                               */
/*==============================================================*/
create table PATENTE
(
   COD_PATENTE          integer not null auto_increment,
   COD_PROJETO          integer,
   NUM_REGISTRO         integer,
   DESCRICAO_PATENTE    varchar(150),
   primary key (COD_PATENTE)
);

/*==============================================================*/
/* Table: PESSOA                                                */
/*==============================================================*/
create table PESSOA
(
   MATRICULA            integer not null,
   NOME                 varchar(100),
   DATA_NASCIMENTO      date,
   primary key (MATRICULA)
);

/*==============================================================*/
/* Table: PESSOA_PUBLICACAO                                     */
/*==============================================================*/
create table PESSOA_PUBLICACAO
(
   ID_MAT_PUB           integer not null auto_increment,
   MATRICULA            integer,
   COD_PUBLICACAO       integer,
   primary key (ID_MAT_PUB)
);

/*==============================================================*/
/* Table: POS                                                   */
/*==============================================================*/
create table POS
(
   ID_POS               integer not null auto_increment,
   ID_ALUNO             integer,
   TITULACAO            varchar(100),
   primary key (ID_POS)
);

/*==============================================================*/
/* Table: PROFESSOR                                             */
/*==============================================================*/
create table PROFESSOR
(
   ID_PROFESSOR         integer not null auto_increment,
   MATRICULA            integer,
   COD_DEPTO            integer,
   TITULO               varchar(100),
   primary key (ID_PROFESSOR)
);

/*==============================================================*/
/* Table: PROFESSOR_PROJETO                                     */
/*==============================================================*/
create table PROFESSOR_PROJETO
(
   ID_PROF_PROJ         integer not null auto_increment,
   ID_PROFESSOR         integer,
   COD_PROJETO          integer,
   primary key (ID_PROF_PROJ)
);

/*==============================================================*/
/* Table: PROJETO                                               */
/*==============================================================*/
create table PROJETO
(
   COD_PROJETO          integer not null auto_increment,
   ID_PROFESSOR         integer,
   TITULO_PROJETO       varchar(150),
   DESCRICAO_PROJETO    varchar(200),
   ORCAMENTO_PROJETO    numeric(9,2),
   INICIO_PROJETO       date,
   FIM_PROJETO          date,
   primary key (COD_PROJETO)
);

/*==============================================================*/
/* Table: PROJETO_LABORATORIO                                   */
/*==============================================================*/
create table PROJETO_LABORATORIO
(
   ID_PROJ_LAB          integer not null auto_increment,
   COD_PROJETO          integer,
   COD_LABORATORIO      integer,
   primary key (ID_PROJ_LAB)
);

/*==============================================================*/
/* Table: PROJETO_LINHAPESQUISA                                 */
/*==============================================================*/
create table PROJETO_LINHAPESQUISA
(
   ID_PROJ_LINHA        integer not null auto_increment,
   COD_PROJETO          integer,
   COD_AREA             integer,
   COD_SUBAREA          integer,
   primary key (ID_PROJ_LINHA)
);

/*==============================================================*/
/* Table: PUBLICACAO                                            */
/*==============================================================*/
create table PUBLICACAO
(
   COD_PUBLICACAO       integer not null auto_increment,
   COD_PROJETO          integer,
   TITULO               varchar(150),
   ANO                  integer not null,
   VEICULO              varchar(100),
   primary key (COD_PUBLICACAO)
);

/*==============================================================*/
/* Table: RECURSO                                               */
/*==============================================================*/
create table RECURSO
(
   COD_RECURSO          integer not null auto_increment,
   COD_LABORATORIO      integer,
   NOME_RECURSO         varchar(100),
   DESCRICAO_RECURSO    varchar(150),
   TIPO_RECURSO         varchar(50),
   primary key (COD_RECURSO)
);

/*==============================================================*/
/* Table: TELEFONE_DEPTO                                        */
/*==============================================================*/
create table TELEFONE_DEPTO
(
   ID_TELEFONE          int not null auto_increment,
   COD_DEPTO            integer,
   TELEFONE_DEPTO       varchar(25),
   primary key (ID_TELEFONE)
);

/*==============================================================*/
/* Table: TELEFONE_FINANCIADOR                                  */
/*==============================================================*/
create table TELEFONE_FINANCIADOR
(
   ID_TELEFONE          integer not null auto_increment,
   COD_AGENTE           integer,
   TELEFONE_AGENTE      varchar(25),
   primary key (ID_TELEFONE)
);

alter table ALUNO add constraint FK_LINHAPESQUISA_ALUNO foreign key (COD_AREA, COD_SUBAREA)
      references LINHA_PESQUISA (COD_AREA, COD_SUBAREA) on delete restrict on update restrict;

alter table ALUNO add constraint FK_PESSOA_ALUNO foreign key (MATRICULA)
      references PESSOA (MATRICULA) on delete restrict on update restrict;

alter table ALUNO add constraint FK_PROJETO_ALUNO foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO) on delete restrict on update restrict;

alter table DEPARTAMENTO add constraint FK_PROFESSOR_DEPTO foreign key (ID_PROFESSOR)
      references PROFESSOR (ID_PROFESSOR) on delete restrict on update restrict;

alter table FINANCIADOR_PROJETO add constraint FK_REFERENCE_11 foreign key (COD_AGENTE)
      references AGENTE_FINANCIADOR (COD_AGENTE) on delete restrict on update restrict;

alter table FINANCIADOR_PROJETO add constraint FK_REFERENCE_12 foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO) on delete restrict on update restrict;

alter table GRADUACAO add constraint FK_ALUNO_GRADUACAO foreign key (ID_ALUNO)
      references ALUNO (ID_ALUNO) on delete restrict on update restrict;

alter table GRADUACAO add constraint FK_SUPERVISIONA foreign key (SUP_POS)
      references POS (ID_POS) on delete restrict on update restrict;

alter table PATENTE add constraint FK_PROJETO_PATENTE foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO) on delete restrict on update restrict;

alter table PESSOA_PUBLICACAO add constraint FK_PESSOA_AUTOR foreign key (MATRICULA)
      references PESSOA (MATRICULA) on delete restrict on update restrict;

alter table PESSOA_PUBLICACAO add constraint FK_PUBLICACAO_AUTOR foreign key (COD_PUBLICACAO)
      references PUBLICACAO (COD_PUBLICACAO) on delete restrict on update restrict;

alter table POS add constraint FK_ALUNO_POS foreign key (ID_ALUNO)
      references ALUNO (ID_ALUNO) on delete restrict on update restrict;

alter table PROFESSOR add constraint FK_DEPTO_PROFESSOR foreign key (COD_DEPTO)
      references DEPARTAMENTO (COD_DEPTO) on delete restrict on update restrict;

alter table PROFESSOR add constraint FK_PESSOA_PROFESSOR foreign key (MATRICULA)
      references PESSOA (MATRICULA) on delete restrict on update restrict;

alter table PROFESSOR_PROJETO add constraint FK_PROFESSOR_PROJETO foreign key (ID_PROFESSOR)
      references PROFESSOR (ID_PROFESSOR) on delete restrict on update restrict;

alter table PROFESSOR_PROJETO add constraint FK_PROJETO_PROFESSOR foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO) on delete restrict on update restrict;

alter table PROJETO add constraint FK_PROFESSOR_COORDENA foreign key (ID_PROFESSOR)
      references PROFESSOR (ID_PROFESSOR) on delete restrict on update restrict;

alter table PROJETO_LABORATORIO add constraint FK_REFERENCE_19 foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO) on delete restrict on update restrict;

alter table PROJETO_LABORATORIO add constraint FK_REFERENCE_20 foreign key (COD_LABORATORIO)
      references LABORATORIO (COD_LABORATORIO) on delete restrict on update restrict;

alter table PROJETO_LINHAPESQUISA add constraint FK_REFERENCE_21 foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO) on delete restrict on update restrict;

alter table PROJETO_LINHAPESQUISA add constraint FK_REFERENCE_22 foreign key (COD_AREA, COD_SUBAREA)
      references LINHA_PESQUISA (COD_AREA, COD_SUBAREA) on delete restrict on update restrict;

alter table PUBLICACAO add constraint FK_PROJETO_PUBLICACAO foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO) on delete restrict on update restrict;

alter table RECURSO add constraint FK_LABORATORIO_RECURSO foreign key (COD_LABORATORIO)
      references LABORATORIO (COD_LABORATORIO) on delete restrict on update restrict;

alter table TELEFONE_DEPTO add constraint FK_DEPTO_TELEFONE foreign key (COD_DEPTO)
      references DEPARTAMENTO (COD_DEPTO) on delete restrict on update restrict;

alter table TELEFONE_FINANCIADOR add constraint FK_REFERENCE_25 foreign key (COD_AGENTE)
      references AGENTE_FINANCIADOR (COD_AGENTE) on delete restrict on update restrict;

