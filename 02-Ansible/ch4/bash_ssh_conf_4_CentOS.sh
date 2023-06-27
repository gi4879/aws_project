#! /usr/bin/env bash

now=$(date +"%m_%d_%Y") #현재 시각을 기록
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_$now.backup # sshd 설정을 백업
sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd # ssh 데몬을 다시 시작

