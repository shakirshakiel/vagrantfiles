yum update -y
yum install -y java-1.8.0-openjdk.x86_64
wget http://apachemirror.wuchna.com/zookeeper/zookeeper-3.6.1/apache-zookeeper-3.6.1-bin.tar.gz
tar xzvf apache-zookeeper-3.6.1-bin.tar.gz

# Cleanup
rm -rf apache-zookeeper-3.6.1-bin.tar.gz
