#!/bin/bash

#приступаем
echo "Версия ядра"
uname -r
echo "Прописываю репу для новых ядер"
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
sudo yum install -y https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
echo "Устанавливаю новое ядро"
sudo yum -v repolist
sudo yum --enablerepo elrepo-kernel install kernel-ml -y
echo "Генерирую новый конфиг загрузчика"
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
echo "Сохраняю конфиг загрузчика"
sudo grub2-set-default 0
echo "Пойду в ребут схожу"
