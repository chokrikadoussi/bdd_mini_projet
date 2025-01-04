SPOOL "C:\temp\pise\SISSOKHO_KADOUSSI_Create_Schema.log"

PROMPT '>> Nettoyage ecran'
host cls

PROMPT '>> Connexion compte System en tant que DBA'
connect System/Pise2024

PROMPT '>> Suppression du compte asi_cka existant'
DROP USER asi_cka CASCADE ;

PROMPT '>> Creation Schema asi_cka'
CREATE USER asi_cka IDENTIFIED BY asi_cka ;

PROMPT '>> Accord des privileges'
GRANT connect TO asi_cka ;
GRANT create table TO asi_cka ;
GRANT create view TO asi_cka ;
GRANT create any index TO asi_cka ;
GRANT create synonym TO asi_cka ;
GRANT create sequence TO asi_cka ;

PROMPT '>> Creation tbs Table'
CREATE TABLESPACE asi_cka_tbs_table 
    DATAFILE 'C:/Apps/oracle/oradata/PISE/asi_cka_tbs_table.dbf' SIZE 128 M 
    SEGMENT SPACE MANAGEMENT AUTO ;

PROMPT '>> Creation tbs Index'
CREATE TABLESPACE asi_cka_tbs_index 
    DATAFILE 'C:/Apps/oracle/oradata/PISE/asi_cka_tbs_index.dbf' SIZE 128 M
    SEGMENT SPACE MANAGEMENT AUTO ;

PROMPT '>> Affectation tbs par défaut'
ALTER USER asi_cka default TABLESPACE asi_cka_tbs_table ;
ALTER USER asi_cka QUOTA UNLIMITED ON asi_cka_tbs_table ;
ALTER USER asi_cka QUOTA UNLIMITED ON asi_cka_tbs_index ;

DISCONNECT

SPOOL OFF