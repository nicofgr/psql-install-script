#createuser -h localhost -U postgres -d -S -P -e userdb
psql postgresql://postgres:postgres@localhost << EOF
    CREATE ROLE userdb WITH PASSWORD 'userdb' NOSUPERUSER CREATEDB NOCREATEROLE INHERIT LOGIN NOREPLICATION NOBYPASSRLS;
EOF

psql postgresql://postgres:postgres@localhost << EOF
    CREATE DATABASE hr OWNER userdb
    CREATE DATABASE oe OWNER userdb
EOF

psql postgresql://userdb:userdb@localhost/hr << EOF
    \i hr-data/HR_DDL_PostgreSQL.sql
    \i hr-data/HR_DML_PostgreSQL.sql
    \d 
    \c oe
    \i oe-data/OE_DDL_PostgreSQL.sql
    \i oe-data/OE_DML_PostgreSQL.sql
    \d
EOF

#psql -h localhost -U postgres -d oe -f OE_DDL_PostgreSQL.sql

