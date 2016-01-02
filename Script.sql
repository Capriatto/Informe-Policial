===========================================================*/
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
   NOMBREDETENIDO       VARCHAR(100)         null,
   APELLIDODETENIDO     VARCHAR(100)         null,
   constraint PK_DETENIDO primary key (CODIGODETENIDO)
);

/*==============================================================*/
/* Index: DETENIDO_PK                                           */
/*==============================================================*/
create unique index DETENIDO_PK on DETENIDO (
CODIGODETENIDO
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

alter table SUCURSAL
   add constraint FK_SUCURSAL_TIENE_ENTIDADB foreign key (CODIGOENTIDAD)
      references ENTIDADBANCARIA (CODIGOENTIDAD)
      on delete restrict on update restrict;
