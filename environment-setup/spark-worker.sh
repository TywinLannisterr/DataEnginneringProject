### Group 17 - group project #
### Setup commands for Spark worker nodes
### These commands are built upon the default settings of SNIC cloud's ubuntu 2$

## update all packages to latest
sudo apt update

## add hostname worker to hostname file
echo "worker01" >> ~/hostname
##add the ip address of master abd worker to the hosts file
echo "master  master's ip address" >> /etc/hosts
echo "worker1  worker1's ip  address" >> /etc/hosts

## install necessary software and packages

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install openjdk-11-jdk
sudo apt-get install scala

## install spark

wget https://archive.apache.org/dist/spark/spark-3.0.3/spark-3.0.3-bin-hadoop2.$
tar xvf spark-3.0.3-bind-hadoop2.7.tgz
sudo mv spark-3.0.3-bin-hadoop2.7 /usr/local/spark

## add JAVA-HOME to bashrc
source ~/.bashrc
