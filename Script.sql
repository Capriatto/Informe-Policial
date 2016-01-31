
/*==============================================================*/
/* Table: ASALTO                                                */
/*==============================================================*/
create table ASALTO (
   CODIGOSUCURSAL       INT4                 not null,
   CODIGODETENIDO       INT4                 not null,
   FECHAATRACO          DATE                 null
);

/*==============================================================*/
/* Index: SUFRE_FK                                              */
/*==============================================================*/
create  index SUFRE_FK on ASALTO (
CODIGOSUCURSAL
);

/*==============================================================*/
/* Index: REALIZO_FK                                            */
/*==============================================================*/
create  index REALIZO_FK on ASALTO (
CODIGODETENIDO
);

/*==============================================================*/
/* Table: BANDADELINCUENCIAL                                    */
/*==============================================================*/
create table BANDADELINCUENCIAL (
   CODIGOBANDA          INT4                 not null,
   CODIGODETENIDO       INT4                 null,
   NOMBREBANDA          VARCHAR(100)         null,
   NUMEROBANDA          NUMERIC              null,
   DELITO               BOOL                 null,
   constraint PK_BANDADELINCUENCIAL primary key (CODIGOBANDA)
);

/*==============================================================*/
/* Index: BANDADELINCUENCIAL_PK                                 */
/*==============================================================*/
create unique index BANDADELINCUENCIAL_PK on BANDADELINCUENCIAL (
CODIGOBANDA
);

/*==============================================================*/
/* Index: INTEGRA_FK                                            */
/*==============================================================*/
create  index INTEGRA_FK on BANDADELINCUENCIAL (
CODIGODETENIDO
);

/*==============================================================*/
/* Table: COMANDOPOLICIAL                                       */
/*==============================================================*/
create table COMANDOPOLICIAL (
   CODIGOCOMANDO        INT4                 not null,
   NOMBRECOMANDO        VARCHAR(100)         null,
   DIRECCIONCOMANDO     VARCHAR(100)         null,
   constraint PK_COMANDOPOLICIAL primary key (CODIGOCOMANDO)
);

/*==============================================================*/
/* Index: COMANDOPOLICIAL_PK                                    */
/*==============================================================*/
create unique index COMANDOPOLICIAL_PK on COMANDOPOLICIAL (
CODIGOCOMANDO
);

/*==============================================================*/
/* Table: CONTRATACION                                          */
/*==============================================================*/
create table CONTRATACION (
   CODIGOENTIDAD        INT4                 null,
   CODIGOVIGILANTE      INT4                 not null,
   CODIGOSUCURSAL       INT4                 null,
   FECHACONTRATACION    DATE                 null,
   ARMADO               BOOL                 null
);

/*==============================================================*/
/* Index: POSEE_FK                                              */
/*==============================================================*/
create  index POSEE_FK on CONTRATACION (
CODIGOVIGILANTE
);

/*==============================================================*/
/* Index: REQUIERE_FK                                           */
/*==============================================================*/
create  index REQUIERE_FK on CONTRATACION (
CODIGOSUCURSAL
);

/*==============================================================*/
/* Index: NECESITA_FK                                           */
/*==============================================================*/
create  index NECESITA_FK on CONTRATACION (
CODIGOENTIDAD
);

/*==============================================================*/
/* Table: DELITO                                                */
/*==============================================================*/
create table DELITO (
   CODIGODETENIDO       INT4                 not null,
   CODIGOJUEZ           INT4                 not null,
   NOMBREDELITO         VARCHAR(100)         null,
   CONDENA              BOOL                 null,
   CARCEL               NUMERIC              null
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on DELITO (
CODIGODETENIDO
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on DELITO (
CODIGOJUEZ
);

/*==============================================================*/
/* Table: DETENIDO                                              */
/*==============================================================*/
create table DETENIDO (
   CODIGODETENIDO       INT4                 not null,
   CODIGOMOD            INT4                 not null,
   NOMBREDETENIDO       VARCHAR(100)         null,
   APELLIDODETENIDO     VARCHAR(100)         null,
   FOTODETENIDO         CHAR(254)            null,
   constraint PK_DETENIDO primary key (CODIGODETENIDO)
);

/*==============================================================*/
/* Index: DETENIDO_PK                                           */
/*==============================================================*/
create unique index DETENIDO_PK on DETENIDO (
CODIGODETENIDO
);

/*==============================================================*/
/* Index: CAPTURA_FK                                            */
/*==============================================================*/
create  index CAPTURA_FK on DETENIDO (
CODIGOMOD
);

/*==============================================================*/
/* Table: ENTIDADBANCARIA                                       */
/*==============================================================*/
create table ENTIDADBANCARIA (
   CODIGOENTIDAD        INT4                 not null,
   NOMBREENTIDAD        VARCHAR(100)         null,
   DIRECCIONENTIDAD     VARCHAR(150)         null,
   constraint PK_ENTIDADBANCARIA primary key (CODIGOENTIDAD)
);

/*==============================================================*/
/* Index: ENTIDADBANCARIA_PK                                    */
/*==============================================================*/
create unique index ENTIDADBANCARIA_PK on ENTIDADBANCARIA (
CODIGOENTIDAD
);

/*==============================================================*/
/* Table: JUEZ                                                  */
/*==============================================================*/
create table JUEZ (
   CODIGOJUEZ           INT4                 not null,
   CLAVEJUZGADO         VARCHAR(10)          null,
   NOMBREJUEZ           VARCHAR(100)         null,
   SERVICIO             NUMERIC              null,
   constraint PK_JUEZ primary key (CODIGOJUEZ)
);

/*==============================================================*/
/* Index: JUEZ_PK                                               */
/*==============================================================*/
create unique index JUEZ_PK on JUEZ (
CODIGOJUEZ
);

/*==============================================================*/
/* Table: MODULO                                                */
/*==============================================================*/
create table MODULO (
   CODIGOMOD            SERIAL               not null,
   CODIGOCOMANDO        INT4                 not null,
   NUMEROMODULO         INT4                 null,
   DIRECCIONMODULO      VARCHAR(100)         null,
   FOTOMODULO           CHAR(254)            null,
   constraint PK_MODULO primary key (CODIGOMOD)
);

/*==============================================================*/
/* Index: MODULO_PK                                             */
/*==============================================================*/
create unique index MODULO_PK on MODULO (
CODIGOMOD
);

/*==============================================================*/
/* Index: COMPONE_FK                                            */
/*==============================================================*/
create  index COMPONE_FK on MODULO (
CODIGOCOMANDO
);

/*==============================================================*/
/* Table: NOTICIA                                               */
/*==============================================================*/
create table NOTICIA (
   CODIGONOTICIA        SERIAL               not null,
   CODIGOMOD            INT4                 not null,
   TITULAR              VARCHAR(40)          null,
   REDACCION            VARCHAR(1500)        null,
   FOTONOTICIA          CHAR(254)            null,
   constraint PK_NOTICIA primary key (CODIGONOTICIA)
);

/*==============================================================*/
/* Index: NOTICIA_PK                                            */
/*==============================================================*/
create unique index NOTICIA_PK on NOTICIA (
CODIGONOTICIA
);

/*==============================================================*/
/* Index: INFORMA_FK                                            */
/*==============================================================*/
create  index INFORMA_FK on NOTICIA (
CODIGOMOD
);

/*==============================================================*/
/* Table: POLICIA                                               */
/*==============================================================*/
create table POLICIA (
   CODIGOPOLICIA        INT4                 not null,
   CODIGOMOD            INT4                 not null,
   NOMBREPOL            VARCHAR(100)         null,
   APELLIDOPOL          VARCHAR(100)         null,
   EDAD                 INT4                 null,
   FECHANAC             DATE                 null,
   RANGO                VARCHAR(30)          null,
   FOTOPOLICIA          CHAR(254)            null,
   constraint PK_POLICIA primary key (CODIGOPOLICIA)
);

/*==============================================================*/
/* Index: POLICIA_PK                                            */
/*==============================================================*/
create unique index POLICIA_PK on POLICIA (
CODIGOPOLICIA
);

/*==============================================================*/
/* Index: COMPRENDE_FK                                          */
/*==============================================================*/
create  index COMPRENDE_FK on POLICIA (
CODIGOMOD
);

/*==============================================================*/
/* Table: SUCURSAL                                              */
/*==============================================================*/
create table SUCURSAL (
   CODIGOSUCURSAL       INT4                 not null,
   CODIGOENTIDAD        INT4                 not null,
   NOMBRESUCURSAL       VARCHAR(100)         null,
   DIRECCIONSUCURSAL    VARCHAR(150)         null,
   EMPLEADOS            INT4                 null,
   constraint PK_SUCURSAL primary key (CODIGOSUCURSAL)
);

/*==============================================================*/
/* Index: SUCURSAL_PK                                           */
/*==============================================================*/
create unique index SUCURSAL_PK on SUCURSAL (
CODIGOSUCURSAL
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on SUCURSAL (
CODIGOENTIDAD
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   CODUSUARIO           SERIAL               not null,
   CODIGOPOLICIA        INT4                 not null,
   CODIGOJUEZ           INT4                 not null,
   NICK                 VARCHAR(30)          null,
   PASSWORD             VARCHAR(70)          null,
   constraint PK_USUARIO primary key (CODUSUARIO)
);

/*==============================================================*/
/* Index: USUARIO_PK                                            */
/*==============================================================*/
create unique index USUARIO_PK on USUARIO (
CODUSUARIO
);

/*==============================================================*/
/* Index: ES__FK                                                */
/*==============================================================*/
create  index ES__FK on USUARIO (
CODIGOPOLICIA
);

/*==============================================================*/
/* Index: ES_FK                                                 */
/*==============================================================*/
create  index ES_FK on USUARIO (
CODIGOJUEZ
);

/*==============================================================*/
/* Table: VIGILANTE                                             */
/*==============================================================*/
create table VIGILANTE (
   CODIGOVIGILANTE      INT4                 not null,
   NOMBREVIGILANTE      VARCHAR(120)         null,
   EDAD                 INT4                 null,
   constraint PK_VIGILANTE primary key (CODIGOVIGILANTE)
);

/*==============================================================*/
/* Index: VIGILANTE_PK                                          */
/*==============================================================*/
create unique index VIGILANTE_PK on VIGILANTE (
CODIGOVIGILANTE
);

alter table ASALTO
   add constraint FK_ASALTO_REALIZO_DETENIDO foreign key (CODIGODETENIDO)
      references DETENIDO (CODIGODETENIDO)
      on delete restrict on update restrict;

alter table ASALTO
   add constraint FK_ASALTO_SUFRE_SUCURSAL foreign key (CODIGOSUCURSAL)
      references SUCURSAL (CODIGOSUCURSAL)
      on delete restrict on update restrict;

alter table BANDADELINCUENCIAL
   add constraint FK_BANDADEL_INTEGRA_DETENIDO foreign key (CODIGODETENIDO)
      references DETENIDO (CODIGODETENIDO)
      on delete restrict on update restrict;

alter table CONTRATACION
   add constraint FK_CONTRATA_NECESITA_ENTIDADB foreign key (CODIGOENTIDAD)
      references ENTIDADBANCARIA (CODIGOENTIDAD)
      on delete restrict on update restrict;

alter table CONTRATACION
   add constraint FK_CONTRATA_POSEE_VIGILANT foreign key (CODIGOVIGILANTE)
      references VIGILANTE (CODIGOVIGILANTE)
      on delete restrict on update restrict;

alter table CONTRATACION
   add constraint FK_CONTRATA_REQUIERE_SUCURSAL foreign key (CODIGOSUCURSAL)
      references SUCURSAL (CODIGOSUCURSAL)
      on delete restrict on update restrict;

alter table DELITO
   add constraint FK_DELITO_RELATIONS_DETENIDO foreign key (CODIGODETENIDO)
      references DETENIDO (CODIGODETENIDO)
      on delete restrict on update restrict;

alter table DELITO
   add constraint FK_DELITO_RELATIONS_JUEZ foreign key (CODIGOJUEZ)
      references JUEZ (CODIGOJUEZ)
      on delete restrict on update restrict;

alter table DETENIDO
   add constraint FK_DETENIDO_CAPTURA_MODULO foreign key (CODIGOMOD)
      references MODULO (CODIGOMOD)
      on delete restrict on update restrict;

alter table MODULO
   add constraint FK_MODULO_COMPONE_COMANDOP foreign key (CODIGOCOMANDO)
      references COMANDOPOLICIAL (CODIGOCOMANDO)
      on delete restrict on update restrict;

alter table NOTICIA
   add constraint FK_NOTICIA_INFORMA_MODULO foreign key (CODIGOMOD)
      references MODULO (CODIGOMOD)
      on delete restrict on update restrict;

alter table POLICIA
   add constraint FK_POLICIA_COMPRENDE_MODULO foreign key (CODIGOMOD)
      references MODULO (CODIGOMOD)
      on delete restrict on update restrict;

alter table SUCURSAL
   add constraint FK_SUCURSAL_TIENE_ENTIDADB foreign key (CODIGOENTIDAD)
      references ENTIDADBANCARIA (CODIGOENTIDAD)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_ES_JUEZ foreign key (CODIGOJUEZ)
      references JUEZ (CODIGOJUEZ)
      on delete restrict on update restrict;

alter table USUARIO
   add constraint FK_USUARIO_ES__POLICIA foreign key (CODIGOPOLICIA)
      references POLICIA (CODIGOPOLICIA)
      on delete restrict on update restrict;
