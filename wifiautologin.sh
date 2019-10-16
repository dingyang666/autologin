#!/bin/bash
# 作者：杨凯（巨佬） 卢漫可（菜鸡）
# 联系方式：mankelu5@gmail.com（邮箱）
# 使用需要修改下面的username和password，另外会生成两个临时文件，请确保你有文件夹写权限

username="这里输入账号"
password="这里输入密码"
[ $(ping -c 3 -i 1 8.8.8.8| grep -c ttl)  -eq 0 ]
then
    curl 'https://u.njtech.edu.cn/cas/login?service=https://u.njtech.edu.cn/oauth2/authorize?client_id=Oe7wtp9CAMW0FVygUasZ&response_type=code&state=njtech' -c "cookie" -H 'Accept: */*' -H 'Accept-Language: zh-cn' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' > tmp
    LT=$(grep "\"lt\"" tmp | head -n 1 | awk -F \" '{print $6}')
    EXEC=$(grep "name=\"execution\"" tmp |head -n 1 | awk -F \" '{print $ 6}')
    INSERTCOOKIE=$(grep "insert_cookie" cookie|awk '{print $7}')
    JSESSIONID=$(grep "JSESSIONID" cookie |awk '{print$7}')
    DATA="username="$username"&password="$password"&channelshow=%E4%B8%AD%E5%9B%BD%E7%A7%BB%E5%8A%A8&channel=%40cmcc&lt="$LT"&execution="$EXEC"&_eventId=submit&login=%E7%99%BB%E5%BD%95"
    DATA2="Cookie: JSESSIONID="$JSESSIONID"; insert_cookie="$INSERTCOOKIE
    curl 'https://u.njtech.edu.cn/cas/login?service=https%3A%2F%2Fu.njtech.edu.cn%2Foauth2%2Fauthorize%3Fclient_id%3DOe7wtp9CAMW0FVygUasZ%26response_type%3Dcode%26state%3Dnjtech' -H 'Accept: */*' -H 'Accept-Language: zh-cn' -H 'User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H "$DATA2"  --data "$DATA" --compressed ;
fi
