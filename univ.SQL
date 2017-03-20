DROP DATABASE IF EXISTS univ;

CREATE DATABASE IF NOT EXISTS univ;
USE univ;
# -----------------------------------------------------------------------------
#       TABLE : PROF
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PROF
 (
   IDP int(11) AUTO_INCREMENT NOT NULL,
   NOMP VARCHAR(32),
   PRENOMP VARCHAR(32),
   PRIXP  float(0.5),
   PRIMARY KEY (IDP)
 );

# -----------------------------------------------------------------------------
#       TABLE : MATIERE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MATIERE
 (
   IDMAT int(11) AUTO_INCREMENT NOT NULL,
   NOMMAT VARCHAR(32),
   OBJPRINCIPALMAT VARCHAR(32),
   EFFECTIFMAT int(32) NULL,
   PRIMARY KEY (IDMAT)
 );

# -----------------------------------------------------------------------------
#       TABLE : UNITEDENSEIGNEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS UNITEDENSEIGNEMENT
 (
   IDUE int(11) AUTO_INCREMENT NOT NULL,
   NOMUE VARCHAR(32),
   PRIMARY KEY (IDUE)
 );

# -----------------------------------------------------------------------------
#       TABLE : STAGE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STAGE
 (
   IDSTAGE int(11) AUTO_INCREMENT NOT NULL,
   PRIMARY KEY (IDSTAGE)
 );

# -----------------------------------------------------------------------------
#       TABLE : ELEVE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ELEVE
 (
   IDE int(11) AUTO_INCREMENT NOT NULL,
   NOME VARCHAR(32),
   PRENOME VARCHAR(32),
   DATENAISSEE date,
   FORMATIONE VARCHAR(32),
   PRIMARY KEY (IDE)
 );

# -----------------------------------------------------------------------------
#       TABLE : SEMESTRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SEMESTRE
 (
   IDSEMESTRE int(11) AUTO_INCREMENT NOT NULL,
   NOMSEMESTRE VARCHAR(32),
   PRIMARY KEY (IDSEMESTRE)
 );

# -----------------------------------------------------------------------------
#       TABLE : FORMATION
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FORMATION
 (
   IDFOR int(11) AUTO_INCREMENT NOT NULL,
   NOMFOR VARCHAR(32),
   PRIMARY KEY (IDFOR)
 );

# -----------------------------------------------------------------------------
#       TABLE : NOTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS NOTE
 (
   IDN int(11) AUTO_INCREMENT NOT NULL,
   VALEURN VARCHAR(32),
   PRIMARY KEY (IDN)
 );

# -----------------------------------------------------------------------------
#       TABLE : ENTREPRISE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ENTREPRISE
 (
   IDENT int(11) AUTO_INCREMENT NOT NULL,
   NOMENT VARCHAR(32),
   RESPONSABLEENT VARCHAR(32),
   NUMENT int(32) NOT NULL,
   ADRESSENT VARCHAR(32) NULL,
   PRIMARY KEY (IDENT)
 );

# -----------------------------------------------------------------------------
#       TABLE : SALLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SALLE
 (
   IDS int(11) AUTO_INCREMENT NOT NULL,
   NOMS VARCHAR(32),
   LIBRES VARCHAR(32),
   PRIMARY KEY (IDS)
 );

# -----------------------------------------------------------------------------
#       TABLE : RESERVE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RESERVE
 (
   IDP int(11) NOT NULL,
   IDS int(11) NOT NULL,
   PRIMARY KEY (IDP,IDS)
 );

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE RESERVE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_RESERVE_PROF
     ON RESERVE (IDP ASC);

CREATE  INDEX I_FK_RESERVE_SALLE
     ON RESERVE (IDS ASC);

# -----------------------------------------------------------------------------
#       TABLE : GERER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS GERER
 (
   IDP int(11) NOT NULL,
   IDFOR int(11) NOT NULL
   , PRIMARY KEY (IDP,IDFOR)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE GERER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_GERER_PROF
     ON GERER (IDP ASC);

CREATE  INDEX I_FK_GERER_FORMATION
     ON GERER (IDFOR ASC);

# -----------------------------------------------------------------------------
#       TABLE : A2
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS A2
 (
   IDFOR int(11) NOT NULL,
   IDSEMESTRE int(11) NOT NULL
   , PRIMARY KEY (IDFOR,IDSEMESTRE)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE A2
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_A2_FORMATION
     ON A2 (IDFOR ASC);

CREATE  INDEX I_FK_A2_SEMESTRE
     ON A2 (IDSEMESTRE ASC);

# -----------------------------------------------------------------------------
#       TABLE : DONNER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DONNER
 (
   IDSEMESTRE int(11) NOT NULL  ,
   IDUE int(11) NOT NULL
   , PRIMARY KEY (IDSEMESTRE,IDUE)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE DONNER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_DONNER_SEMESTRE
     ON DONNER (IDSEMESTRE ASC);

CREATE  INDEX I_FK_DONNER_UNITEDENSEIGNEMENT
     ON DONNER (IDUE ASC);

# -----------------------------------------------------------------------------
#       TABLE : CONTENIR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONTENIR
 (
   IDUE int(11) NOT NULL  ,
   IDMAT int(11) NOT NULL
   , PRIMARY KEY (IDUE,IDMAT)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CONTENIR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CONTENIR_UNITEDENSEIGNEMENT
     ON CONTENIR (IDUE ASC);

CREATE  INDEX I_FK_CONTENIR_MATIERE
     ON CONTENIR (IDMAT ASC);

# -----------------------------------------------------------------------------
#       TABLE : GERE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS GERE
 (
   IDP int(11) NOT NULL ,
   IDMAT int(11) NOT NULL
   , PRIMARY KEY (IDP,IDMAT)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE GERE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_GERE_PROF
     ON GERE (IDP ASC);

CREATE  INDEX I_FK_GERE_MATIERE
     ON GERE (IDMAT ASC);

# -----------------------------------------------------------------------------
#       TABLE : RESPONSABLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RESPONSABLE
 (
   IDP int(11) NOT NULL  ,
   IDSTAGE int(11) NOT NULL
   , PRIMARY KEY (IDP,IDSTAGE)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE RESPONSABLE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_RESPONSABLE_PROF
     ON RESPONSABLE (IDP ASC);

CREATE  INDEX I_FK_RESPONSABLE_STAGE
     ON RESPONSABLE (IDSTAGE ASC);

# -----------------------------------------------------------------------------
#       TABLE : EN
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EN
 (
   IDENT int(11) NOT NULL,
   IDSTAGE int(11) NOT NULL
   , PRIMARY KEY (IDENT,IDSTAGE)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE EN
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_EN_ENTREPRISE
     ON EN (IDENT ASC);

CREATE  INDEX I_FK_EN_STAGE
     ON EN (IDSTAGE ASC);

# -----------------------------------------------------------------------------
#       TABLE : FAIT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FAIT
 (
   IDE int(11) NOT NULL,
   IDSTAGE int(11) NOT NULL
   , PRIMARY KEY (IDE,IDSTAGE)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE FAIT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_FAIT_ELEVE
     ON FAIT (IDE ASC);

CREATE  INDEX I_FK_FAIT_STAGE
     ON FAIT (IDSTAGE ASC);

# -----------------------------------------------------------------------------
#       TABLE : A
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS A
 (
   IDE int(11) NOT NULL,
   IDN int(11) NOT NULL
   , PRIMARY KEY (IDE,IDN)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE A
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_A_ELEVE
     ON A (IDE ASC);

CREATE  INDEX I_FK_A_NOTE
     ON A (IDN ASC);

# -----------------------------------------------------------------------------
#       TABLE : DONNE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DONNE
 (
   IDP int(11) NOT NULL,
   IDN int(11) NOT NULL
   , PRIMARY KEY (IDP,IDN)
 )
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE DONNE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_DONNE_PROF
     ON DONNE (IDP ASC);

CREATE  INDEX I_FK_DONNE_NOTE
     ON DONNE (IDN ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE RESERVE
  ADD FOREIGN KEY FK_RESERVE_PROF (IDP)
      REFERENCES PROF (IDP) ;


ALTER TABLE RESERVE
  ADD FOREIGN KEY FK_RESERVE_SALLE (IDS)
      REFERENCES SALLE (IDS) ;


ALTER TABLE GERER
  ADD FOREIGN KEY FK_GERER_PROF (IDP)
      REFERENCES PROF (IDP) ;


ALTER TABLE GERER
  ADD FOREIGN KEY FK_GERER_FORMATION (IDFOR)
      REFERENCES FORMATION (IDFOR) ;


ALTER TABLE A2
  ADD FOREIGN KEY FK_A2_FORMATION (IDFOR)
      REFERENCES FORMATION (IDFOR) ;


ALTER TABLE A2
  ADD FOREIGN KEY FK_A2_SEMESTRE (IDSEMESTRE)
      REFERENCES SEMESTRE (IDSEMESTRE) ;


ALTER TABLE DONNER
  ADD FOREIGN KEY FK_DONNER_SEMESTRE (IDSEMESTRE)
      REFERENCES SEMESTRE (IDSEMESTRE) ;


ALTER TABLE DONNER
  ADD FOREIGN KEY FK_DONNER_UNITEDENSEIGNEMENT (IDUE)
      REFERENCES UNITEDENSEIGNEMENT (IDUE) ;


ALTER TABLE CONTENIR
  ADD FOREIGN KEY FK_CONTENIR_UNITEDENSEIGNEMENT (IDUE)
      REFERENCES UNITEDENSEIGNEMENT (IDUE) ;


ALTER TABLE CONTENIR
  ADD FOREIGN KEY FK_CONTENIR_MATIERE (IDMAT)
      REFERENCES MATIERE (IDMAT) ;


ALTER TABLE GERE
  ADD FOREIGN KEY FK_GERE_PROF (IDP)
      REFERENCES PROF (IDP) ;


ALTER TABLE GERE
  ADD FOREIGN KEY FK_GERE_MATIERE (IDMAT)
      REFERENCES MATIERE (IDMAT) ;


ALTER TABLE RESPONSABLE
  ADD FOREIGN KEY FK_RESPONSABLE_PROF (IDP)
      REFERENCES PROF (IDP) ;


ALTER TABLE RESPONSABLE
  ADD FOREIGN KEY FK_RESPONSABLE_STAGE (IDSTAGE)
      REFERENCES STAGE (IDSTAGE) ;


ALTER TABLE EN
  ADD FOREIGN KEY FK_EN_ENTREPRISE (IDENT)
      REFERENCES ENTREPRISE (IDENT) ;


ALTER TABLE EN
  ADD FOREIGN KEY FK_EN_STAGE (IDSTAGE)
      REFERENCES STAGE (IDSTAGE) ;


ALTER TABLE FAIT
  ADD FOREIGN KEY FK_FAIT_ELEVE (IDE)
      REFERENCES ELEVE (IDE) ;


ALTER TABLE FAIT
  ADD FOREIGN KEY FK_FAIT_STAGE (IDSTAGE)
      REFERENCES STAGE (IDSTAGE) ;


ALTER TABLE A
  ADD FOREIGN KEY FK_A_ELEVE (IDE)
      REFERENCES ELEVE (IDE) ;


ALTER TABLE A
  ADD FOREIGN KEY FK_A_NOTE (IDN)
      REFERENCES NOTE (IDN) ;


ALTER TABLE DONNE
  ADD FOREIGN KEY FK_DONNE_PROF (IDP)
      REFERENCES PROF (IDP) ;


ALTER TABLE DONNE
  ADD FOREIGN KEY FK_DONNE_NOTE (IDN)
      REFERENCES NOTE (IDN) ;
