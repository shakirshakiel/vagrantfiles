wget https://download.docker.com/linux/static/stable/x86_64/docker-19.03.1.tgz
tar xzvf docker-19.03.1.tgz
cp docker/* /usr/bin

chmod 0755 /usr/bin/ctr
chmod 0755 /usr/bin/runc
chmod 0755 /usr/bin/dockerd
chmod 0755 /usr/bin/docker
chmod 0755 /usr/bin/containerd
chmod 0755 /usr/bin/containerd-shim
chmod 0755 /usr/bin/docker-init
chmod 0755 /usr/bin/docker-proxy

# Add vagrant user to docker group
groupadd docker
usermod -aG docker vagrant

# Copy docker service files
# https://github.com/moby/moby/tree/master/contrib/init/systemd

cat >> /etc/systemd/system/docker.service <<'EOF'
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target docker.socket firewalld.service
Wants=network-online.target
Requires=docker.socket

[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/bin/dockerd -H fd://
ExecReload=/bin/kill -s HUP $MAINPID
LimitNOFILE=1048576
# Having non-zero Limit*s causes performance problems due to accounting overhead
# in the kernel. We recommend using cgroups to do container-local accounting.
LimitNPROC=infinity
LimitCORE=infinity
# Uncomment TasksMax if your systemd version supports it.
# Only systemd 226 and above support this version.
#TasksMax=infinity
TimeoutStartSec=0
# set delegate yes so that systemd does not reset the cgroups of docker containers
Delegate=yes
# kill only the docker process, not all processes in the cgroup
KillMode=process
# restart the docker process if it exits prematurely
Restart=on-failure
StartLimitBurst=3
StartLimitInterval=60s

[Install]
WantedBy=multi-user.target
EOF

cat >> /etc/systemd/system/docker.socket << 'EOF'
[Unit]
Description=Docker Socket for the API
PartOf=docker.service

[Socket]
# If /var/run is not implemented as a symlink to /run, you may need to
# specify ListenStream=/var/run/docker.sock instead.
ListenStream=/run/docker.sock
SocketMode=0660
SocketUser=root
SocketGroup=docker

[Install]
WantedBy=sockets.target
EOF

# Set SELinux in permissive mode (effectively disabling it)
setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

# Start docker
systemctl daemon-reload
systemctl enable docker
systemctl start docker

# Cleanup
rm -rf docker-19.03.1.tgz
rm -rf docker