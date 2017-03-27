Drop DATABASE univ;
CREATE  DATABASE univ;

USE UNIV;

#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: formation
#------------------------------------------------------------

CREATE TABLE formation(
        id_formation  int (11) Auto_increment  NOT NULL ,
        nom_formation Varchar (25) ,
        id_prof       Int ,
        PRIMARY KEY (id_formation ) ,
        INDEX (id_prof )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Professeur
#------------------------------------------------------------

CREATE TABLE Professeur(
        nom_prof    Varchar (25) ,
        id_prof     int (11) Auto_increment  NOT NULL ,
        nom_form    Varchar (25) ,
        prenom_prof Varchar (25) ,
        PRIMARY KEY (id_prof )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Semestre
#------------------------------------------------------------

CREATE TABLE Semestre(
        id_semestre  int (11) Auto_increment  NOT NULL ,
        nom_semestre Varchar (25) ,
        id_formation Int ,
        PRIMARY KEY (id_semestre ) ,
        INDEX (id_formation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Matiere
#------------------------------------------------------------

CREATE TABLE Matiere(
        id_matiere     int (11) Auto_increment  NOT NULL ,
        nom_matiere    Varchar (25) ,
        credit_matiere Int ,
        horaire_cm     Int ,
        horaire_td     Int ,
        horaire_tp     Int ,
        id_ue          Int ,
        id_prof        Int ,
        PRIMARY KEY (id_matiere ) ,
        INDEX (id_ue ,id_prof )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: stage
#------------------------------------------------------------

CREATE TABLE stage(
        id_stage       int (11) Auto_increment  NOT NULL ,
        id_prof        Int ,
        id_eleve       Int ,
        id_entreprise  Int ,
        duree          Varchar (25) ,
        id_eleve_Eleve Int ,
        PRIMARY KEY (id_stage ) ,
        INDEX (id_prof ,id_eleve ,id_entreprise )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Entreprise
#------------------------------------------------------------

CREATE TABLE Entreprise(
        id_entreprise       int (11) Auto_increment  NOT NULL ,
        nom_entreprise      Varchar (25) ,
        tel_entrepirise     Varchar (25) ,
        addresse_entreprise Varchar (25) ,
        nom_responsable     Varchar (25) ,
        PRIMARY KEY (id_entreprise )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: note
#------------------------------------------------------------

CREATE TABLE note(
        id_note     int (11) Auto_increment  NOT NULL ,
        valeur_note Float ,
        id_prof     Int ,
        id_eleve    Int ,
        PRIMARY KEY (id_note ) ,
        INDEX (id_prof ,id_eleve )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Salle
#------------------------------------------------------------

CREATE TABLE Salle(
        id_salle   int (11) Auto_increment  NOT NULL ,
        disponible Bool ,
        nom_salle  Varchar (25) ,
        id_prof    Int ,
        PRIMARY KEY (id_salle ) ,
        INDEX (id_prof )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Eleve
#------------------------------------------------------------

CREATE TABLE Eleve(
        id_eleve     int (11) Auto_increment  NOT NULL ,
        nom_eleve    Varchar (25) ,
        prenom_eleve Varchar (25) ,
        date_naisseE Date ,
        date_debut   Date ,
        date_fin     Date ,
        id_ue        Int ,
        id_formation Int ,
        id_note      Int ,
        PRIMARY KEY (id_eleve ) ,
        INDEX (id_ue )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: UE
#------------------------------------------------------------

CREATE TABLE UE(
        id_ue       int (11) Auto_increment  NOT NULL ,
        nom_ue      Varchar (25) ,
        id_semestre Int ,
        PRIMARY KEY (id_ue ) ,
        INDEX (id_semestre )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Constantes
#------------------------------------------------------------

CREATE TABLE Constantes(
        id_constante    int (11) Auto_increment  NOT NULL ,
        id_prof         Int ,
        effectif_max_cm Int ,
        effectif_max_td Int ,
        effectif_max_tp Int ,
        cout_horaire_cm Int ,
        cout_horaire_td Int ,
        cout_horaire_tp Int ,
        PRIMARY KEY (id_constante ) ,
        INDEX (id_prof )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: responsable de
#------------------------------------------------------------

CREATE TABLE responsable_de(
        id_prof      Int NOT NULL ,
        id_formation Int NOT NULL ,
        PRIMARY KEY (id_prof ,id_formation )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: compos�_de
#------------------------------------------------------------

CREATE TABLE compose_de(
        id_formation Int NOT NULL ,
        id_semestre  Int NOT NULL ,
        PRIMARY KEY (id_formation ,id_semestre )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: poss�de
#------------------------------------------------------------

CREATE TABLE possede(
        id_semestre Int NOT NULL ,
        id_ue       Int NOT NULL ,
        PRIMARY KEY (id_semestre ,id_ue )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: poss�de2
#------------------------------------------------------------

CREATE TABLE possede2(
        id_ue      Int NOT NULL ,
        id_matiere Int NOT NULL ,
        PRIMARY KEY (id_ue ,id_matiere )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: offre
#------------------------------------------------------------

CREATE TABLE offre(
        id_stage      Int NOT NULL ,
        id_entreprise Int NOT NULL ,
        PRIMARY KEY (id_stage ,id_entreprise )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: reserve
#------------------------------------------------------------

CREATE TABLE reserve(
        id_prof  Int NOT NULL ,
        id_salle Int NOT NULL ,
        PRIMARY KEY (id_prof ,id_salle )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: suit
#------------------------------------------------------------

CREATE TABLE suit(
        id_formation Int NOT NULL ,
        id_eleve     Int NOT NULL ,
        PRIMARY KEY (id_formation ,id_eleve )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: �tudie
#------------------------------------------------------------

CREATE TABLE etudie(
        id_eleve   Int NOT NULL ,
        id_matiere Int NOT NULL ,
        PRIMARY KEY (id_eleve ,id_matiere )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: supervise
#------------------------------------------------------------

CREATE TABLE supervise(
        id_prof  Int NOT NULL ,
        id_stage Int NOT NULL ,
        PRIMARY KEY (id_prof ,id_stage )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: enseigne
#------------------------------------------------------------

CREATE TABLE enseigne(
        id_prof    Int NOT NULL ,
        id_matiere Int NOT NULL ,
        PRIMARY KEY (id_prof ,id_matiere )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: donne
#------------------------------------------------------------

CREATE TABLE donne(
        id_note Int NOT NULL ,
        id_prof Int NOT NULL ,
        PRIMARY KEY (id_note ,id_prof )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: calcule
#------------------------------------------------------------

CREATE TABLE calcule(
        id_prof      Int NOT NULL ,
        id_constante Int NOT NULL ,
        PRIMARY KEY (id_prof ,id_constante )
)ENGINE=InnoDB;

ALTER TABLE stage ADD CONSTRAINT FK_stage_id_eleve_Eleve FOREIGN KEY (id_eleve_Eleve) REFERENCES Eleve(id_eleve);
ALTER TABLE Eleve ADD CONSTRAINT FK_Eleve_id_note FOREIGN KEY (id_note) REFERENCES note(id_note);
ALTER TABLE responsable_de ADD CONSTRAINT FK_responsable_de_id_prof FOREIGN KEY (id_prof) REFERENCES Professeur(id_prof);
ALTER TABLE responsable_de ADD CONSTRAINT FK_responsable_de_id_formation FOREIGN KEY (id_formation) REFERENCES formation(id_formation);
ALTER TABLE compose_de ADD CONSTRAINT FK_compose_de_id_formation FOREIGN KEY (id_formation) REFERENCES formation(id_formation);
ALTER TABLE compose_de ADD CONSTRAINT FK_compose_de_id_semestre FOREIGN KEY (id_semestre) REFERENCES Semestre(id_semestre);
ALTER TABLE possede ADD CONSTRAINT FK_possede_id_semestre FOREIGN KEY (id_semestre) REFERENCES Semestre(id_semestre);
ALTER TABLE possede ADD CONSTRAINT FK_possede_id_ue FOREIGN KEY (id_ue) REFERENCES UE(id_ue);
ALTER TABLE possede2 ADD CONSTRAINT FK_possede2_id_ue FOREIGN KEY (id_ue) REFERENCES UE(id_ue);
ALTER TABLE possede2 ADD CONSTRAINT FK_possede2_id_matiere FOREIGN KEY (id_matiere) REFERENCES Matiere(id_matiere);
ALTER TABLE offre ADD CONSTRAINT FK_offre_id_stage FOREIGN KEY (id_stage) REFERENCES stage(id_stage);
ALTER TABLE offre ADD CONSTRAINT FK_offre_id_entreprise FOREIGN KEY (id_entreprise) REFERENCES Entreprise(id_entreprise);
ALTER TABLE reserve ADD CONSTRAINT FK_reserve_id_prof FOREIGN KEY (id_prof) REFERENCES Professeur(id_prof);
ALTER TABLE reserve ADD CONSTRAINT FK_reserve_id_salle FOREIGN KEY (id_salle) REFERENCES Salle(id_salle);
ALTER TABLE suit ADD CONSTRAINT FK_suit_id_formation FOREIGN KEY (id_formation) REFERENCES formation(id_formation);
ALTER TABLE suit ADD CONSTRAINT FK_suit_id_eleve FOREIGN KEY (id_eleve) REFERENCES Eleve(id_eleve);
ALTER TABLE etudie ADD CONSTRAINT FK_etudie_id_eleve FOREIGN KEY (id_eleve) REFERENCES Eleve(id_eleve);
ALTER TABLE etudie ADD CONSTRAINT FK_etudie_id_matiere FOREIGN KEY (id_matiere) REFERENCES Matiere(id_matiere);
ALTER TABLE supervise ADD CONSTRAINT FK_supervise_id_prof FOREIGN KEY (id_prof) REFERENCES Professeur(id_prof);
ALTER TABLE supervise ADD CONSTRAINT FK_supervise_id_stage FOREIGN KEY (id_stage) REFERENCES stage(id_stage);
ALTER TABLE enseigne ADD CONSTRAINT FK_enseigne_id_prof FOREIGN KEY (id_prof) REFERENCES Professeur(id_prof);
ALTER TABLE enseigne ADD CONSTRAINT FK_enseigne_id_matiere FOREIGN KEY (id_matiere) REFERENCES Matiere(id_matiere);
ALTER TABLE donne ADD CONSTRAINT FK_donne_id_note FOREIGN KEY (id_note) REFERENCES note(id_note);
ALTER TABLE donne ADD CONSTRAINT FK_donne_id_prof FOREIGN KEY (id_prof) REFERENCES Professeur(id_prof);
ALTER TABLE calcule ADD CONSTRAINT FK_calcule_id_prof FOREIGN KEY (id_prof) REFERENCES Professeur(id_prof);
ALTER TABLE calcule ADD CONSTRAINT FK_calcule_id_constante FOREIGN KEY (id_constante) REFERENCES Constantes(id_constante);
