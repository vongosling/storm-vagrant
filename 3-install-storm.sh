TAR_NAME="apache-storm-0.9.1-incubating.tar.gz"
NAME="apache-storm-0.9.1-incubating"
wget http://mirror.bit.edu.cn/apache/incubator/storm/apache-storm-0.9.1-incubating/$TAR_NAME

sudo groupadd storm
sudo useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm

sudo mkdir /usr/share/storm
tar -xzvf $TAR_NAME -C /usr/share/storm
sudo chown -R storm:storm /usr/share/storm
ln -s /usr/share/storm/$NAME/bin/storm /usr/bin/storm

sudo mkdir /etc/storm
sudo chown storm:storm /etc/storm

mv /usr/share/storm/$NAME/conf/storm.yaml /usr/share/storm/$NAME/conf/storm_bck.yaml
cp storm.yaml /usr/share/storm/$NAME/conf/
cp cluster.xml /usr/share/storm/$NAME/logback/
ln -s /usr/share/storm/$NAME/conf/storm.yaml /etc/storm/storm.yaml 

sudo mkdir /var/log/storm
sudo chown storm:storm /var/log/storm


#sed-i 's/${storm.home}\/logs/\/var\/log\/storm/g' /usr/share/storm/logback/cluster.xml
