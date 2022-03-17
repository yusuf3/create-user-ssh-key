USER="user1"
sudo useradd -m -s /bin/bash $USER
DIR="/home/$USER/.ssh"
sudo mkdir -p $DIR
ssh-keygen -q -t rsa -b 4096 -N '' -f ./$USER.pem <<< $'\ny' >/dev/null 2>&1
wait
sudo cp $USER.pem $DIR/id_rsa
sudo cp $USER.pem.pub $DIR/id_rsa.pub
sudo cp $USER.pem.pub $DIR/authorized_keys
sudo chown -R $USER:$USER $DIR
sudo chmod -R 600 $DIR/*