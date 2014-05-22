wget http://mirrors.cnnic.cn/apache/zookeeper/stable/zookeeper-3.4.6.tar.gz && tar -xzvf zookeeper-3.4.6.tar.gz
cd zookeeper-3.4.6/conf
cp zoo_sample.cfg zoo.cfg
cd ../bin/
./zkServer.sh start


