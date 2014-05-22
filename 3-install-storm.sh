#!/bin/sh

NAME="apache-storm-0.9.1-incubating.tar.gz"
wget http://mirror.bit.edu.cn/apache/incubator/storm/apache-storm-0.9.1-incubating/$NAME

groupadd storm
useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm

tar -xzvf $NAME -C /usr/share/storm
chown -R storm:storm /usr/share/storm
ln -s /usr/share/storm/bin/storm /usr/bin/storm

mkdir /etc/storm
chown storm:storm /etc/storm

rm /usr/share/storm/conf/storm.yaml
cp storm.yaml /usr/share/storm/conf/
cp cluster.xml /usr/share/storm/logback/
ln -s /usr/share/storm/conf/storm.yaml /etc/storm/storm.yaml 

mkdir /var/log/storm
chown storm:storm /var/log/storm

#sed -i 's/${storm.home}\/logs/\/var\/log\/storm/g' /usr/share/storm/logback/cluster.xml
