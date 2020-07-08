yum update -y
cat <<'EOF' > /etc/yum.repos.d/adoptopenjdk.repo
[AdoptOpenJDK]
name=AdoptOpenJDK
baseurl=http://adoptopenjdk.jfrog.io/adoptopenjdk/rpm/centos/$releasever/$basearch
enabled=1
gpgcheck=1
gpgkey=https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public
EOF
yum install -y adoptopenjdk-11-hotspot.x86_64

wget http://apachemirror.wuchna.com/zookeeper/zookeeper-3.6.1/apache-zookeeper-3.6.1-bin.tar.gz
tar xzvf apache-zookeeper-3.6.1-bin.tar.gz
chown -R vagrant:vagrant apache-zookeeper-3.6.1-bin

# Cleanup
rm -rf apache-zookeeper-3.6.1-bin.tar.gz
