echo -e "${CLR_BLUE}Installing 1Panel...${CLR_GRAY}"
curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o /opt/ma_ss/temps/quick_start.sh
cd /opt/ma_ss/temps/ || exit
echo -e "${CLR_WHITE}"
bash /opt/ma_ss/temps/quick_start.sh
cd ~/
# 清理1Panel安装文件
echo -e "${CLR_GREEN}Installed. ${CLR_PURPLE}Cleanup 1Panel cache...${CLR_GRAY}"
rm -rf /opt/ma_ss/temps/quick_start.sh
rm -rf /opt/ma_ss/temps/1panel*
echo "Cleanup success!"
echo "Setup 1Panel rules"
# 设置1Panel规则
1pctl reset entrance
echo -e "${CLR_GREEN}Done.${CLR_GRAY}"