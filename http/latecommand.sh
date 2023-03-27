#!/bin/bash
mkdir -p --mode=0700 /home/vagrant/.ssh && curl -Lo /home/vagrant/.ssh/authorized_keys "http://192.168.56.1:2015/vagrant-key.pub" && chmod 0600 /home/vagrant/.ssh/authorized_keys && chown -R vagrant:vagrant /home/vagrant/.ssh
mkdir -p --mode=0700 /root/.ssh && curl -Lo /root/.ssh/authorized_keys "http://192.168.56.1:2015/vagrant-key.pub" && chmod 0600 /root/.ssh/authorized_keys && chown -R root:root /root/.ssh
sed -i "s/^#PermitRootLogin.*\$/PermitRootLogin prohibit-password/g" /etc/ssh/sshd_config
sed -i "s/^#PasswordAuthentication.*\$/PasswordAuthentication yes/g" /etc/ssh/sshd_config

echo "deb https://dl.astralinux.ru/astra/frozen/1.7_x86-64/1.7.3/repository-base/ 1.7_x86-64 main contrib non-free" > /etc/apt/sources.list
echo "deb https://dl.astralinux.ru/astra/frozen/1.7_x86-64/1.7.3/repository-extended/ 1.7_x86-64 main contrib non-free" >> /etc/apt/sources.list
echo "deb https://dl.astralinux.ru/aldpro/stable/repository-main/ 1.3.0 main" >> /etc/apt/sources.list
echo "deb https://dl.astralinux.ru/aldpro/stable/repository-extended/ generic main" >> /etc/apt/sources.list

sudo apt update

echo "Package: *" > /etc/apt/preferences.d/aldpro
echo "Pin: release n=generic" >> /etc/apt/preferences.d/aldpro
echo "Pin-Priority: 900" >> /etc/apt/preferences.d/aldpro

sudo apt upgrade -y

systemctl enable ssh
echo vagrant | sudo -S shutdown -P now
