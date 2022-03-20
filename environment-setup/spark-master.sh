### Group 17 - group project #
### Setup commands for Spark Masternode
### These commands are built upon the default settings of SNIC cloud's ubuntu 20.04 image

## update all packages to latest
sudo apt update

## add hostname master to hostname file
echo "master' >> ~/hostname
## add the ip address of master and worker to the hosts file
echo "master  master's ip address" >> /etc/hosts
echo "worker1  worker1's ip  address" >> /etc/hosts
# install necessary software and packages
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install openjdk-11-jdk
sudo apt-get install scala
sudo apt-get install openssh-server openssh-client
## generate ssh key for the master you should add the public key to authorized_keys in workers
ssh-keygen -t rsa -P ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
# install spark 
wget https://archive.apache.org/dist/spark/spark-3.0.3/spark-3.0.3-bin-hadoop2.7.tgz
tar xvf spark-3.0.3-bind-hadoop2.7.tgz
sudo mv spark-3.0.3-bin-hadoop2.7 /usr/local/spark

# add #JAVA-HOME# to bashrc 
source ~/.bashrc
cp /usr/local/spark/conf/spark-env.sh.template /usr/local/spark/conf/spark-env.sh 
# set the parameters for spark
echo "export SPARK_MASTER_HOST='<MASTER-IP>'export JAVA_HOME=<Path_of_JAVA_installation>" >> /usr/local/spark/conf/spark-env.sh
echo "master" >> /usr/local/spark/conf/slaves
echo "worker1" >> /usr/local/spark/conf/slaves
/usr/local/spark./sbin/start-all.sh
