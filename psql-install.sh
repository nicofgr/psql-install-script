# Add Postgres repo
apt update
apt install gnupg2 wget -y
apt autoremove -y

#sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg

apt update -y

# Install Postgres
apt install postgresql-16 postgresql-contrib-16
systemctl start postgresql
systemctl enable postgresql
