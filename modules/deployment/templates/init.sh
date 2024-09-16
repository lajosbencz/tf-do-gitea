#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

# swap space
if [ ! -f /var/swap ]; then
  fallocate -l ${swap_size} /var/swap
  chmod 600 /var/swap
  mkswap /var/swap
  swapon /var/swap
  echo '/var/swap none swap sw 0 0' | tee -a /etc/fstab
  for sc in "vm.swappiness=10" "vm.vfs_cache_pressure=50"
  do
      sysctl $sc
      echo "$sc" | tee -a /etc/sysctl.conf
  done
fi

# update packages
apt-get update && apt-get upgrade -y
apt-get install -y ufw

# firewall settings
ufw -f reset
ufw default deny
ufw allow ${gitea_ssh_port}/tcp
ufw allow ${ssh_port}/tcp
ufw allow 80/tcp
ufw allow 443/tcp
ufw -f enable

# change sshd port
sed -i "s/#Port 22/Port ${ssh_port}/" /etc/ssh/sshd_config
systemctl restart ssh

# mount volume
if [ ! -d /opt/gitea ]; then
  mkfs.ext4 -F ${disk_by_id}
  mkdir -p /opt/gitea/
  mount ${disk_by_id} /opt/gitea
fi
cd /opt/gitea

# create gitea config
if [ -f /tmp/gitea.ini ]; then
  mkdir data config cert db
  mv /tmp/gitea.ini config/app.ini
  chown ${uid}:${gid} -R data config
fi

# create docker compose config
if [ -f /tmp/docker-compose.yaml ]; then
  mv /tmp/docker-compose.yaml ./
fi

# start gitea
docker compose up -d gitea

# create initial admin
set +e
while ! docker compose exec gitea nc -z localhost 3000; do   
  sleep 1
done
docker compose exec gitea gitea admin user create --admin --username "${admin_user}" --password "${admin_password}" --email "${admin_email}"
set -e

# save runner token
echo "$(docker compose exec gitea gitea actions generate-runner-token)" > runner/token.txt

# start all services
docker compose up -d
