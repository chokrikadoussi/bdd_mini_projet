SPOOL "C:\temp\log\SISSOKHO_KADOUSSI_Desinstall.log"

PROMPT '>> Nettoyage ecran'
host cls

PROMPT '>> SUPPRESSION DU MODELE PHYSIQUE DE DONNEES'


PROMPT '>> Connection en tant que asi_cka' 
connect asi_cka/asi_cka


PROMPT '>> Suppression des contraintes FK'

ALTER TABLE EMETTRE DROP CONSTRAINT emettre_demande_fk;
ALTER TABLE EMETTRE DROP CONSTRAINT emettre_emetteur_fk;
ALTER TABLE DEMANDE DROP CONSTRAINT demande_produit_fk;
ALTER TABLE DEMANDE DROP CONSTRAINT demande_producteur_fk;
ALTER TABLE INTERACTION DROP CONSTRAINT interaction_client_fk;
ALTER TABLE DECISION DROP CONSTRAINT decision_demande_fk;
ALTER TABLE EVENEMENT DROP CONSTRAINT evenement_demande_fk;
ALTER TABLE CHANGEMENT_STATUT DROP CONSTRAINT change_statut_demande_fk;
ALTER TABLE CLIENT DROP CONSTRAINT client_adresse_fk;
ALTER TABLE CLIENT DROP CONSTRAINT client_civilite_fk;
ALTER TABLE DEMANDE DROP CONSTRAINT demande_type_dem_fk;
ALTER TABLE INTERACTION DROP CONSTRAINT interaction_type_int_fk;
ALTER TABLE DECISION DROP CONSTRAINT decision_type_dec_fk;
ALTER TABLE EVENEMENT DROP CONSTRAINT evenement_type_event_fk;
ALTER TABLE CHANGEMENT_STATUT DROP CONSTRAINT change_statut_ref_statut_fk;

PROMPT '>> Fin de la suppression des contraintes FK'


PROMPT '>> Suppression des clés primaires'

ALTER TABLE ADRESSE DROP PRIMARY KEY CASCADE;
ALTER TABLE PRODUCTEUR DROP PRIMARY KEY CASCADE;
ALTER TABLE EMETTEUR DROP PRIMARY KEY CASCADE;
ALTER TABLE CLIENT DROP PRIMARY KEY CASCADE;
ALTER TABLE DEMANDE DROP PRIMARY KEY CASCADE;
ALTER TABLE INTERACTION DROP PRIMARY KEY CASCADE;
ALTER TABLE PRODUIT DROP PRIMARY KEY CASCADE;
ALTER TABLE DECISION DROP PRIMARY KEY CASCADE;
ALTER TABLE EVENEMENT DROP PRIMARY KEY CASCADE;
ALTER TABLE CHANGEMENT_STATUT DROP PRIMARY KEY CASCADE;
ALTER TABLE REF_TYP_DEM DROP PRIMARY KEY CASCADE;
ALTER TABLE REF_STATUT DROP PRIMARY KEY CASCADE;
ALTER TABLE REF_CIVILITE DROP PRIMARY KEY CASCADE;
ALTER TABLE REF_TYP_INT DROP PRIMARY KEY CASCADE;
ALTER TABLE REF_TYP_DEC DROP PRIMARY KEY CASCADE;
ALTER TABLE REF_TYP_EVENT DROP PRIMARY KEY CASCADE;

PROMPT '>> Fin de la suppression des clés primaires'

PROMPT '>> Suppression des tables'

PROMPT '>> Suppression des tables enfants'
DROP TABLE EMETTRE PURGE;
DROP TABLE INTERACTION PURGE;
DROP TABLE DECISION PURGE;
DROP TABLE EVENEMENT PURGE;
DROP TABLE CHANGEMENT_STATUT PURGE;

PROMPT '>> Suppression des tables parents'
DROP TABLE DEMANDE PURGE;
DROP TABLE PRODUIT PURGE;
DROP TABLE CLIENT PURGE;
DROP TABLE ADRESSE PURGE;
DROP TABLE PRODUCTEUR PURGE; 
DROP TABLE EMETTEUR PURGE;
DROP TABLE REF_TYP_DEM PURGE;
DROP TABLE REF_STATUT PURGE;
DROP TABLE REF_CIVILITE PURGE;
DROP TABLE REF_TYP_INT PURGE;
DROP TABLE REF_TYP_DEC PURGE;
DROP TABLE REF_TYP_EVENT PURGE;

PROMPT '>> Suppression terminée'

PROMPT '>> Connection en tant que system' 

CONNECT System/pise2024 

PROMPT '>> Suppression du compte asi_cka existant'
DROP USER asi_cka CASCADE ;

PROMPT '>> Suppression des tablespaces'
DROP TABLESPACE asi_cka_tbs_table INCLUDING CONTENTS AND DATAFILES ;
DROP TABLESPACE asi_cka_tbs_index INCLUDING CONTENTS AND DATAFILES ;

DISCONNECT

SPOOL OFF
