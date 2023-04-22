#!/bin/bash
operation=$1
repo=https://github.com/prb71/bitcot.git


create () {
cd /home/ec2-user
rm -rf ./bitcot
git clone $repo
cd ./bitcot
sudo docker-compose build --no-cache && sudo docker-compose up -d 
}

destroy () {
cd /home/ec2-user/bitcot
echo "docker compose is destroying"
sudo docker-compose down
echo "Removing images from local system"
docker rmi -f $(docker images -aq)
}

case ${operation} in
  create) create ;;
    destroy) destroy ;;
       *) echo "Unknown action ${operation}" ;;
esac
