drop table AGENTE_FINANCIADOR cascade constraints
/

drop table ALUNO cascade constraints
/

drop table DEPARTAMENTO cascade constraints
/

drop table FINANCIADOR_PROJETO cascade constraints
/

drop table GRADUACAO cascade constraints
/

drop table LABORATORIO cascade constraints
/

drop table LINHA_PESQUISA cascade constraints
/

drop table PATENTE cascade constraints
/

drop table PESSOA cascade constraints
/

drop table PESSOA_PUBLICACAO cascade constraints
/

drop table POS cascade constraints
/

drop table PROFESSOR cascade constraints
/

drop table PROFESSOR_PROJETO cascade constraints
/

drop table PROJETO cascade constraints
/

drop table PROJETO_LABORATORIO cascade constraints
/

drop table PROJETO_LINHAPESQUISA cascade constraints
/

drop table PUBLICACAO cascade constraints
/

drop table RECURSO cascade constraints
/

drop table TELEFONE_DEPTO cascade constraints
/

drop table TELEFONE_FINANCIADOR cascade constraints
/

/*==============================================================*/
/* Table: AGENTE_FINANCIADOR                                    */
/*==============================================================*/
create table AGENTE_FINANCIADOR 
(
   COD_AGENTE           NUMBER(6)            not null,
   NOME_AGENTE          VARCHAR2(100),
   EMAIL_AGENTE         VARCHAR2(100),
   ENDERECO_AGENTE      VARCHAR2(200),
   constraint PK_AGENTE_FINANCIADOR primary key (COD_AGENTE)
)
/

/*==============================================================*/
/* Table: ALUNO                                                 */
/*==============================================================*/
create table ALUNO 
(
   ID_ALUNO             NUMBER(6)            not null,
   MATRICULA            INTEGER,
   COD_PROJETO          INTEGER,
   COD_AREA             INTEGER,
   COD_SUBAREA          INTEGER,
   constraint PK_ALUNO primary key (ID_ALUNO)
)
/

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO 
(
   COD_DEPTO            NUMBER(6)            not null,
   ID_PROFESSOR         INTEGER,
   NOME_DEPTO           VARCHAR2(50),
   ENDERECO             VARCHAR2(200),
   constraint PK_DEPARTAMENTO primary key (COD_DEPTO)
)
/

/*==============================================================*/
/* Table: FINANCIADOR_PROJETO                                   */
/*==============================================================*/
create table FINANCIADOR_PROJETO 
(
   ID_AGENTE_PROJETO    NUMBER(6)            not null,
   COD_AGENTE           INTEGER,
   COD_PROJETO          INTEGER,
   constraint PK_FINANCIADOR_PROJETO primary key (ID_AGENTE_PROJETO)
)
/

/*==============================================================*/
/* Table: GRADUACAO                                             */
/*==============================================================*/
create table GRADUACAO 
(
   ID_GRADUACAO         NUMBER(6)            not null,
   ID_ALUNO             INTEGER,
   SUP_POS              INTEGER,
   constraint PK_GRADUACAO primary key (ID_GRADUACAO)
)
/

/*==============================================================*/
/* Table: LABORATORIO                                           */
/*==============================================================*/
create table LABORATORIO 
(
   COD_LABORATORIO      NUMBER(6)            not null,
   NOME_LABORATORIO     VARCHAR2(100),
   LOCALIZACAO_LABORATORIO VARCHAR2(150),
   constraint PK_LABORATORIO primary key (COD_LABORATORIO)
)
/

/*==============================================================*/
/* Table: LINHA_PESQUISA                                        */
/*==============================================================*/
create table LINHA_PESQUISA 
(
   COD_AREA             INTEGER              not null,
   COD_SUBAREA          INTEGER              not null,
   NOME_AREA            VARCHAR2(50),
   NOME_SUBAREA         VARCHAR2(50),
   constraint PK_LINHA_PESQUISA primary key (COD_AREA, COD_SUBAREA)
)
/

/*==============================================================*/
/* Table: PATENTE                                               */
/*==============================================================*/
create table PATENTE 
(
   COD_PATENTE          NUMBER(6)            not null,
   COD_PROJETO          INTEGER,
   NUM_REGISTRO         INTEGER,
   DESCRICAO_PATENTE    VARCHAR2(150),
   constraint PK_PATENTE primary key (COD_PATENTE)
)
/

/*==============================================================*/
/* Table: PESSOA                                                */
/*==============================================================*/
create table PESSOA 
(
   MATRICULA            INTEGER              not null,
   NOME                 VARCHAR2(100),
   DATA_NASCIMENTO      DATE,
   constraint PK_PESSOA primary key (MATRICULA)
)
/

/*==============================================================*/
/* Table: PESSOA_PUBLICACAO                                     */
/*==============================================================*/
create table PESSOA_PUBLICACAO 
(
   ID_MAT_PUB           NUMBER(6)            not null,
   MATRICULA            INTEGER,
   COD_PUBLICACAO       INTEGER,
   constraint PK_PESSOA_PUBLICACAO primary key (ID_MAT_PUB)
)
/

/*==============================================================*/
/* Table: POS                                                   */
/*==============================================================*/
create table POS 
(
   ID_POS               NUMBER(6)            not null,
   ID_ALUNO             INTEGER,
   TITULACAO            VARCHAR2(100),
   constraint PK_POS primary key (ID_POS)
)
/

/*==============================================================*/
/* Table: PROFESSOR                                             */
/*==============================================================*/
create table PROFESSOR 
(
   ID_PROFESSOR         NUMBER(6)            not null,
   MATRICULA            INTEGER,
   COD_DEPTO            INTEGER,
   TITULO               VARCHAR2(100),
   constraint PK_PROFESSOR primary key (ID_PROFESSOR)
)
/

/*==============================================================*/
/* Table: PROFESSOR_PROJETO                                     */
/*==============================================================*/
create table PROFESSOR_PROJETO 
(
   ID_PROF_PROJ         NUMBER(6)            not null,
   ID_PROFESSOR         INTEGER,
   COD_PROJETO          INTEGER,
   constraint PK_PROFESSOR_PROJETO primary key (ID_PROF_PROJ)
)
/

/*==============================================================*/
/* Table: PROJETO                                               */
/*==============================================================*/
create table PROJETO 
(
   COD_PROJETO          NUMBER(6)            not null,
   ID_PROFESSOR         INTEGER,
   TITULO_PROJETO       VARCHAR2(150),
   DESCRICAO_PROJETO    VARCHAR2(200),
   ORCAMENTO_PROJETO    NUMBER(9,2),
   INICIO_PROJETO       DATE,
   FIM_PROJETO          DATE,
   constraint PK_PROJETO primary key (COD_PROJETO)
)
/

/*==============================================================*/
/* Table: PROJETO_LABORATORIO                                   */
/*==============================================================*/
create table PROJETO_LABORATORIO 
(
   ID_PROJ_LAB          NUMBER(6)            not null,
   COD_PROJETO          INTEGER,
   COD_LABORATORIO      INTEGER,
   constraint PK_PROJETO_LABORATORIO primary key (ID_PROJ_LAB)
)
/

/*==============================================================*/
/* Table: PROJETO_LINHAPESQUISA                                 */
/*==============================================================*/
create table PROJETO_LINHAPESQUISA 
(
   ID_PROJ_LINHA        NUMBER(6)            not null,
   COD_PROJETO          INTEGER,
   COD_AREA             INTEGER,
   COD_SUBAREA          INTEGER,
   constraint PK_PROJETO_LINHAPESQUISA primary key (ID_PROJ_LINHA)
)
/

/*==============================================================*/
/* Table: PUBLICACAO                                            */
/*==============================================================*/
create table PUBLICACAO 
(
   COD_PUBLICACAO       NUMBER(6)            not null,
   COD_PROJETO          INTEGER,
   TITULO               VARCHAR2(150),
   ANO                  INTEGER              not null,
   VEICULO              VARCHAR2(100),
   constraint PK_PUBLICACAO primary key (COD_PUBLICACAO)
)
/

/*==============================================================*/
/* Table: RECURSO                                               */
/*==============================================================*/
create table RECURSO 
(
   COD_RECURSO          NUMBER(6)            not null,
   COD_LABORATORIO      INTEGER,
   NOME_RECURSO         VARCHAR2(100),
   DESCRICAO_RECURSO    VARCHAR2(150),
   TIPO_RECURSO         VARCHAR2(50),
   constraint PK_RECURSO primary key (COD_RECURSO)
)
/

/*==============================================================*/
/* Table: TELEFONE_DEPTO                                        */
/*==============================================================*/
create table TELEFONE_DEPTO 
(
   ID_TELEFONE          NUMBER(6)            not null,
   COD_DEPTO            INTEGER,
   TELEFONE_DEPTO       VARCHAR2(25),
   constraint PK_TELEFONE_DEPTO primary key (ID_TELEFONE)
)
/

/*==============================================================*/
/* Table: TELEFONE_FINANCIADOR                                  */
/*==============================================================*/
create table TELEFONE_FINANCIADOR 
(
   ID_TELEFONE          NUMBER(6)            not null,
   COD_AGENTE           INTEGER,
   TELEFONE_AGENTE      VARCHAR2(25),
   constraint PK_TELEFONE_FINANCIADOR primary key (ID_TELEFONE)
)
/

alter table ALUNO
   add constraint FK_ALUNO_LINHAPESQ_LINHA_PE foreign key (COD_AREA, COD_SUBAREA)
      references LINHA_PESQUISA (COD_AREA, COD_SUBAREA)
/

alter table ALUNO
   add constraint FK_ALUNO_PESSOA_AL_PESSOA foreign key (MATRICULA)
      references PESSOA (MATRICULA)
/

alter table ALUNO
   add constraint FK_ALUNO_PROJETO_A_PROJETO foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO)
/

alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_PROFESSOR_PROFESSO foreign key (ID_PROFESSOR)
      references PROFESSOR (ID_PROFESSOR)
/

alter table FINANCIADOR_PROJETO
   add constraint FK_FINANCIA_REFERENCE_AGENTE_F foreign key (COD_AGENTE)
      references AGENTE_FINANCIADOR (COD_AGENTE)
/

alter table FINANCIADOR_PROJETO
   add constraint FK_FINANCIA_REFERENCE_PROJETO foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO)
/

alter table GRADUACAO
   add constraint FK_GRADUACA_ALUNO_GRA_ALUNO foreign key (ID_ALUNO)
      references ALUNO (ID_ALUNO)
/

alter table GRADUACAO
   add constraint FK_GRADUACA_SUPERVISI_POS foreign key (SUP_POS)
      references POS (ID_POS)
/

alter table PATENTE
   add constraint FK_PATENTE_PROJETO_P_PROJETO foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO)
/

alter table PESSOA_PUBLICACAO
   add constraint FK_PESSOA_P_PESSOA_AU_PESSOA foreign key (MATRICULA)
      references PESSOA (MATRICULA)
/

alter table PESSOA_PUBLICACAO
   add constraint FK_PESSOA_P_PUBLICACA_PUBLICAC foreign key (COD_PUBLICACAO)
      references PUBLICACAO (COD_PUBLICACAO)
/

alter table POS
   add constraint FK_POS_ALUNO_POS_ALUNO foreign key (ID_ALUNO)
      references ALUNO (ID_ALUNO)
/

alter table PROFESSOR
   add constraint FK_PROFESSO_DEPTO_PRO_DEPARTAM foreign key (COD_DEPTO)
      references DEPARTAMENTO (COD_DEPTO)
/

alter table PROFESSOR
   add constraint FK_PROFESSO_PESSOA_PR_PESSOA foreign key (MATRICULA)
      references PESSOA (MATRICULA)
/

alter table PROFESSOR_PROJETO
   add constraint FK_PROFESSO_PROFESSOR_PROFESSO foreign key (ID_PROFESSOR)
      references PROFESSOR (ID_PROFESSOR)
/

alter table PROFESSOR_PROJETO
   add constraint FK_PROFESSO_PROJETO_P_PROJETO foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO)
/

alter table PROJETO
   add constraint FK_PROJETO_PROFESSOR_PROFESSO foreign key (ID_PROFESSOR)
      references PROFESSOR (ID_PROFESSOR)
/

alter table PROJETO_LABORATORIO
   add constraint FK_PROJLAB__REFERENCE_PROJETO foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO)
/

alter table PROJETO_LABORATORIO
   add constraint FK_PROJLAB__REFERENCE_LABORATO foreign key (COD_LABORATORIO)
      references LABORATORIO (COD_LABORATORIO)
/

alter table PROJETO_LINHAPESQUISA
   add constraint FK_PROJETO__REFERENCE_PROJETO foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO)
/

alter table PROJETO_LINHAPESQUISA
   add constraint FK_PROJETO__REFERENCE_LINHA_PE foreign key (COD_AREA, COD_SUBAREA)
      references LINHA_PESQUISA (COD_AREA, COD_SUBAREA)
/

alter table PUBLICACAO
   add constraint FK_PUBLICAC_PROJETO_P_PROJETO foreign key (COD_PROJETO)
      references PROJETO (COD_PROJETO)
/

alter table RECURSO
   add constraint FK_RECURSO_LABORATOR_LABORATO foreign key (COD_LABORATORIO)
      references LABORATORIO (COD_LABORATORIO)
/

alter table TELEFONE_DEPTO
   add constraint FK_TELEFONE_DEPTO_TEL_DEPARTAM foreign key (COD_DEPTO)
      references DEPARTAMENTO (COD_DEPTO)
/

alter table TELEFONE_FINANCIADOR
   add constraint FK_TELEFONE_REFERENCE_AGENTE_F foreign key (COD_AGENTE)
      references AGENTE_FINANCIADOR (COD_AGENTE)
/
