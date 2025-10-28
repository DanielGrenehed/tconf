#!/bin/bash
hosts=$(echo $@ | tr " " "\n")
for host in $hosts
do
  echo "0.0.0.0 $host" | sudo tee -a /etc/hosts
done
sudo systemctl restart systemd-hostnamed
