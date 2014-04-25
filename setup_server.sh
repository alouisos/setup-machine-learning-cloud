# you need to execute this command to setup your server 
# wget http://www.bigdatasaga.com/setup_server.sh | chmod 700 setup_server.sh | ./setup_server.sh
# and your server will be automatically setup with nodejs, emacs, screen, mysql, apache_tomcat 


cd $HOME
sudo apt-get install -y git-core
git clone https://github.com/alouisos/setup-machine-learning-cloud.git
./setup/setup.sh