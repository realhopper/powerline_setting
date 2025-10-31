#!/bin/bash

echo "===== Powerline Setting ====="
echo "===== Powerline Install ====="
sudo apt install -y powerline powerline-gitstatus

if [ -d ~/.config/powerline ]; then
	echo "===== 이미 설정 파일 디렉토리가 존재합니다 ====="
	echo "===== Powerline restart & source .bashrc ====="
	powerline-daemon --replace
	source ~/.bashrc
	echo "===== 설정이 제대로 적용되지 않는다면 ====="
	echo "===== ~/.config/powerline 디렉토리와 ====="
	echo "===== ~/.bashrc 파일 뒤쪽을 확인해 보세요 ====="
	echo "===== Powerline Setting Finish ====="
	exit 0
else
	echo "===== 설정 파일을 복사합니다 ====="
	cp -ar ./powerline/ ~/.config/
fi

echo "===== bashrc 파일에 내용을 추가합니다 ====="
cat << EOF >> ~/.bashrc
# Powerline Shell Setting
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source /usr/share/powerline/bindings/bash/powerline.sh
fi
EOF


echo "===== Powerline restart & source .bashrc ====="
powerline-daemon --replace
source ~/.bashrc

echo "===== Powerline Setting Finish ====="
