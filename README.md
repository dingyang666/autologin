# autologin

* 南京工业大学校园网自动登陆脚本，经过大量测试可用。
* 其中sh版可直接在mac，linux（包括安卓手机和路由器）上运行，但不能在windows下直接运行。
* 目前只有基本功能登陆，需要修改里面的账号密码，后续会加入其他功能。
* 默认中国移动，电信请自己修改

# 添加登录启动功能
 
```shell
git clone https://github.com/dingyang666/autologin.git #下载脚本到您到设备

cd autologin

vi wifiautologin.sh #请在这一步手动设置账号密码和运营商

mv wifiautologin.sh /etc/

chmod 755 /etc/wifiautologin.sh

echo 'nohup /etc/wifiautologin.sh &' >> /etc/profile #登陆后自动后台运行
```
