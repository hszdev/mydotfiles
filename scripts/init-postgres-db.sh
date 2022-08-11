#!/bin/bash
sudo chown -R postgres:postgres /var/lib/postgres/
sudo chown -R 755 /var/lib/postgres/
sudo su - postgres -c "initdb -d '/var/lib/postgres/data/'"
sudo su - postgres -c "createuser $USER -W"

