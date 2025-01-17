SPOOL "C:\temp\log\SISSOKHO_KADOUSSI_Create_Table.log"

PROMPT '>> Nettoyage ecran'
host cls

PROMPT '>> Connection en tant que asi_cka'
connect asi_cka/asi_cka

PROMPT '------ CREATION DU MODELE PHYSIQUE DE DONNEES ------'

PROMPT '>> Table REF_TYP_DEM : Référentiel des types de demandes'
CREATE TABLE REF_TYP_DEM
(
    code_demande  VARCHAR2(6) NOT NULL,
    libelle_demande VARCHAR2(50) NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table REF_STATUT : Référentiel des statuts des demandes'
CREATE TABLE REF_STATUT
(
    code_statut  NUMBER NOT NULL,
    libelle_statut VARCHAR2(50) NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table REF_CIVILITE : Référentiel des civilités'
CREATE TABLE REF_CIVILITE
(
    code_civilite   NUMBER NOT NULL,
    libelle_civilite VARCHAR2(20) NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table REF_TYP_INT : Référentiel des types d’interactions'
CREATE TABLE REF_TYP_INT
(
    code_interaction  NUMBER NOT NULL,
    libelle_interaction VARCHAR2(50) NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table REF_TYP_DEC : Référentiel des types de décisions'
CREATE TABLE REF_TYP_DEC
(
    code_decision  NUMBER NOT NULL,
    type_decision VARCHAR2(50) NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table REF_TYP_EVENT : Référentiel des types d’événements'
CREATE TABLE REF_TYP_EVENT
(
    code_event  NUMBER NOT NULL,
    libelle_event VARCHAR2(50) NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table ADRESSE : Stocke les informations des adresses des clients'
CREATE TABLE ADRESSE 
(
    id_add      NUMBER	NOT NULL,
    rue_add     VARCHAR2(100),
    ville_add   VARCHAR2(100),
    cp_add      VARCHAR2(10),
    pays_add    VARCHAR2(100)
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table PRODUCTEUR : Stocke les informations sur les producteurs'
CREATE TABLE PRODUCTEUR 
(
    code_intervenant    NUMBER	NOT NULL,
    code_nom    NUMBER	NOT NULL,
    code_reseau    NUMBER	NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table EMETTEUR : Stocke les informations des émetteurs'
CREATE TABLE EMETTEUR 
(
    code_emetteur       NUMBER	NOT NULL,
    origine_emetteur    VARCHAR2(100)
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table PRODUIT : Stocke les informations sur les produits d’assurance (code et libellé)'
CREATE TABLE PRODUIT
(
    code_produit    NUMBER	NOT NULL,
    libelle_produit VARCHAR2(50)
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table CLIENT : Stocke les informations des clients'

CREATE TABLE  CLIENT
(
  num_client 	NUMBER	NOT NULL,
  nom_client	VARCHAR2(50),
  prenom_client	VARCHAR2(50),
  tel_client    VARCHAR2(15),
  mail_client   VARCHAR2(100),
  id_add        NUMBER	NOT NULL,
  code_civilite NUMBER NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table DEMANDE : Stocke les informations sur les demandes'

CREATE TABLE DEMANDE 
(
    num_demande     VARCHAR2(50) NOT NULL,
    date_creation   DATE NOT NULL,
    date_maj        DATE NOT NULL,
    statut_demande  VARCHAR2(50),
    canal_emission  VARCHAR2(50),
    motif_change_statut VARCHAR2(200),
    code_intervenant    NUMBER	NOT NULL,
    code_produit    NUMBER	NOT NULL,
    code_demande VARCHAR2(6) NOT NULL,
    num_client NUMBER NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table INTERACTION : Stocke les interactions entre BNP Paribas Cardif et les clients'

CREATE TABLE INTERACTION 
(
    id_inter      NUMBER NOT NULL,
    date_inter    DATE NOT NULL,
    statut_inter  VARCHAR2(50),
    num_client 	NUMBER	NOT NULL,
    code_interaction  NUMBER NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table DECISION : Stocke les décisions prises pour une demande'

CREATE TABLE DECISION
(
    num_deci 	NUMBER	NOT NULL,
    date_deci    DATE NOT NULL,
    statut_deci  VARCHAR2(50),
    indic_conf  VARCHAR2(20),
    deci_libelle    VARCHAR2(20),
    num_demande      VARCHAR2(50) NOT NULL,
   code_decision NUMBER NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table EVENEMENT : Stocke les événements survenus pendant le cycle de vie d’une demande'

CREATE TABLE EVENEMENT
(
    id_event    NUMBER	NOT NULL,
    date_event DATE NOT NULL,
    com_event VARCHAR2(500),
    num_demande      VARCHAR2(50) NOT NULL,
    code_event   NUMBER NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table EMETTRE : Associe les émetteurs aux demandes qu’ils ont émis'
CREATE TABLE EMETTRE
(
    code_emetteur       NUMBER	NOT NULL,
    num_demande     VARCHAR2(50) NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '>> Table CHANGEMENT_STATUT : Historise les changements de statut d’une demande'

CREATE TABLE CHANGEMENT_STATUT 
(
    id_change   NUMBER	NOT NULL,
    date_debut_change    DATE NOT NULL,
    date_fin_change    DATE NOT NULL,
    num_demande      VARCHAR2(50) NOT NULL,
    code_statut NUMBER NOT NULL
) TABLESPACE asi_cka_tbs_table;

PROMPT '------ FIN DE LA CREATION DES TABLES ------'


PROMPT '>> CREATION DES CONTRAINTES PK'

ALTER TABLE REF_TYP_DEM ADD CONSTRAINT ref_typ_dem_pk PRIMARY KEY (code_demande) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE REF_STATUT ADD CONSTRAINT ref_statut_pk PRIMARY KEY (code_statut) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE REF_CIVILITE ADD CONSTRAINT ref_civilite_pk PRIMARY KEY (code_civilite) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE REF_TYP_INT ADD CONSTRAINT ref_typ_int_pk PRIMARY KEY (code_interaction) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE REF_TYP_DEC ADD CONSTRAINT ref_typ_dec_pk PRIMARY KEY (code_decision) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE REF_TYP_EVENT ADD CONSTRAINT ref_typ_event_pk PRIMARY KEY (code_event) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE ADRESSE ADD CONSTRAINT adresse_pk PRIMARY KEY (id_add) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE PRODUCTEUR ADD CONSTRAINT producteur_pk PRIMARY KEY (code_intervenant) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE EMETTEUR ADD CONSTRAINT emetteur_pk PRIMARY KEY (code_emetteur) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE PRODUIT ADD CONSTRAINT produit_pk PRIMARY KEY (code_produit) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE CLIENT ADD CONSTRAINT client_pk PRIMARY KEY (num_client) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE DEMANDE ADD CONSTRAINT demande_pk PRIMARY KEY (num_demande) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE INTERACTION ADD CONSTRAINT interaction_pk PRIMARY KEY (id_inter) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE DECISION ADD CONSTRAINT decision_pk PRIMARY KEY (num_deci) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE EVENEMENT ADD CONSTRAINT evenement_pk PRIMARY KEY (id_event) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE EMETTRE ADD CONSTRAINT emettre_pk PRIMARY KEY (code_emetteur, num_demande) USING INDEX TABLESPACE asi_cka_tbs_index;
ALTER TABLE CHANGEMENT_STATUT ADD CONSTRAINT changement_statut_pk PRIMARY KEY (id_change) USING INDEX TABLESPACE asi_cka_tbs_index;

 

PROMPT '>> CREATION DE LA SEQUENCE POUR DECISION'
CREATE SEQUENCE num_deci
START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999 ;



PROMPT '>> CREATION DE LA SEQUENCE POUR EVENEMENT'
CREATE SEQUENCE id_event
START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999 ; 



PROMPT '>> CREATION DES CONTRAINTES FK'

ALTER TABLE CLIENT ADD CONSTRAINT client_adresse_fk FOREIGN KEY (id_add) REFERENCES ADRESSE(id_add);
ALTER TABLE CLIENT ADD CONSTRAINT client_civilite_fk FOREIGN KEY (code_civilite) REFERENCES REF_CIVILITE(code_civilite);
ALTER TABLE DEMANDE ADD CONSTRAINT demande_producteur_fk FOREIGN KEY (code_intervenant) REFERENCES PRODUCTEUR(code_intervenant);
ALTER TABLE DEMANDE ADD CONSTRAINT demande_type_dem_fk FOREIGN KEY (code_demande) REFERENCES REF_TYP_DEM(code_demande);
ALTER TABLE DEMANDE ADD CONSTRAINT demande_produit_fk FOREIGN KEY (code_produit) REFERENCES PRODUIT(code_produit);
ALTER TABLE DEMANDE ADD CONSTRAINT demande_client_fk FOREIGN KEY (num_client) REFERENCES CLIENT(num_client);
ALTER TABLE INTERACTION ADD CONSTRAINT interaction_client_fk FOREIGN KEY (num_client) REFERENCES CLIENT(num_client);
ALTER TABLE INTERACTION ADD CONSTRAINT interaction_type_int_fk FOREIGN KEY (code_interaction) REFERENCES REF_TYP_INT(code_interaction);
ALTER TABLE DECISION ADD CONSTRAINT decision_demande_fk FOREIGN KEY (num_demande) REFERENCES DEMANDE(num_demande);
ALTER TABLE DECISION ADD CONSTRAINT decision_type_dec_fk FOREIGN KEY (code_decision) REFERENCES REF_TYP_DEC(code_decision);
ALTER TABLE EVENEMENT ADD CONSTRAINT evenement_demande_fk FOREIGN KEY (num_demande) REFERENCES DEMANDE(num_demande);
ALTER TABLE EVENEMENT ADD CONSTRAINT evenement_type_event_fk FOREIGN KEY (code_event) REFERENCES REF_TYP_EVENT(code_event);
ALTER TABLE EMETTRE ADD CONSTRAINT emettre_emetteur_fk FOREIGN KEY (code_emetteur) REFERENCES EMETTEUR(code_emetteur);
ALTER TABLE EMETTRE ADD CONSTRAINT emettre_demande_fk FOREIGN KEY (num_demande) REFERENCES DEMANDE(num_demande);
ALTER TABLE CHANGEMENT_STATUT ADD CONSTRAINT change_statut_demande_fk FOREIGN KEY (num_demande) REFERENCES DEMANDE(num_demande);
ALTER TABLE CHANGEMENT_STATUT ADD CONSTRAINT change_statut_ref_statut_fk FOREIGN KEY (code_statut) REFERENCES REF_STATUT(code_statut);

PROMPT '------ SCRIPT TERMINE ------'

DISCONNECT

SPOOL OFF