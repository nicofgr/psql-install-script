sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/16/main/postgresql.conf
systemctl restart postgresql
ufw allow 5432/tcp

printf 'postgres\npostgres' | passwd postgres

echo "ALTER USER postgres PASSWORD 'postgres';" | sudo -u postgres psql

