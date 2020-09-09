# List of Vagrant files

A list of vagrant files and boxes for every day use.

#### Centos Vagrant files

| Vagrant file | Vagrant Cloud | 
| ------ | ------ | 
|[diskimage-builder](https://github.com/shakirshakiel/vagrantfiles/blob/master/centos/diskimage-builder/Vagrantfile)| [shakirshakiel/centos_disk_image_builder](https://app.vagrantup.com/shakirshakiel/boxes/centos_disk_image_builder)|
|[guest-additions](https://github.com/shakirshakiel/vagrantfiles/blob/master/centos/guest-additions/Vagrantfile)|[shakirshakiel/centos_guest_additions](https://app.vagrantup.com/shakirshakiel/boxes/centos_guest_additions)|
|[rpm-build](https://github.com/shakirshakiel/vagrantfiles/blob/master/centos/rpm-build/Vagrantfile)|[shakirshakiel/centos_rpm_build](https://app.vagrantup.com/shakirshakiel/boxes/centos_rpm_build)|
|[terraform](https://github.com/shakirshakiel/vagrantfiles/blob/master/centos/terraform/Vagrantfile)|[shakirshakiel/centos_terraform](https://app.vagrantup.com/shakirshakiel/boxes/centos_terraform)|
|[gcc](https://github.com/shakirshakiel/vagrantfiles/blob/master/centos/gcc/Vagrantfile)|[shakirshakiel/centos_gcc](https://app.vagrantup.com/shakirshakiel/boxes/centos_gcc)|
|[docker](https://github.com/shakirshakiel/vagrantfiles/blob/master/centos/docker/Vagrantfile)|[shakirshakiel/centos_docker](https://app.vagrantup.com/shakirshakiel/boxes/centos_docker)|
|[kubernetes](https://github.com/shakirshakiel/vagrantfiles/blob/master/centos/kubernetes/Vagrantfile)|[shakirshakiel/centos_kubernetes](https://app.vagrantup.com/shakirshakiel/boxes/centos_kubernetes)|
|[gocd](https://github.com/shakirshakiel/vagrantfiles/blob/master/centos/gocd/Vagrantfile)|[shakirshakiel/centos_gocd](https://app.vagrantup.com/shakirshakiel/boxes/centos_gocd)|
|[zookeeper](https://github.com/shakirshakiel/vagrantfiles/blob/master/centos/zookeeper/Vagrantfile)|[shakirshakiel/centos_zookeeper](https://app.vagrantup.com/shakirshakiel/boxes/centos_zookeeper)|
|[etcd](https://github.com/shakirshakiel/vagrantfiles/blob/master/centos/etcd/Vagrantfile)|[shakirshakiel/centos_etcd](https://app.vagrantup.com/shakirshakiel/boxes/centos_etcd)|
|[devtools](https://github.com/shakirshakiel/vagrantfiles/blob/master/centos/devtools/Vagrantfile)|[shakirshakiel/centos_devtools](https://app.vagrantup.com/shakirshakiel/boxes/centos_devtools)|


#### Upload to vagrant cloud

- Create an authentication token
- Copy the authentication token to a file called `token`
- Run `./release.sh <path-to-package>`
    - Eg: `./release.sh ./centos/guest-additions`
- Before publishing there will be a prompt like below. Enter 'y'

```
You are about to publish a box on Vagrant Cloud with the following options:
....
Do you wish to continue? [y/N]
```

- Check in vagrant cloud. The box should have been created.