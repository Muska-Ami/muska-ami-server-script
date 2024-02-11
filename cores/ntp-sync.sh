sudo apt install ntpdate -y
sudo systemctl stop ntpd.service
sudo systemctl stop ntp.service
sudo systemctl stop chronyd.service
ntpdate pool.ntp.org