import requests
import sys
from bs4 import BeautifulSoup
import socket

post_addr="https://u.njtech.edu.cn/cas/login?service=https%3A%2F%2Fu.njtech.edu.cn%2Foauth2%2Fauthorize%3Fclient_id%3DOe7wtp9CAMW0FVygUasZ%26response_type%3Dcode%26state%3Dnjtech"
get_addr="https://u.njtech.edu.cn/cas/login?service=https://u.njtech.edu.cn/oauth2/authorize?client_id=Oe7wtp9CAMW0FVygUasZ&response_type=code&state=njtech"

response_gw = requests.get(get_addr)
response_cookie = response_gw.cookies
soup = BeautifulSoup(response_gw.content,"html.parser")
lt0 = soup.find('input',attrs={'name':'lt'})['value']
execution0 = soup.find('input',attrs={'name':'execution'})['value']

post_header={
    'Accept': '*/*',
    'Accept-Language': 'zh-cn',
    'Connection': 'keep-alive',
    'Content-Type': 'application/x-www-form-urlencoded',
    'User-Agent': 'User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko',
}

post_data={
    'username': '',#学号
    'password': '',#密码
    'channelshow': '中国移动',#中国移动，中国电信
    'channel': '@cmcc',#@cmcc,@telecom
    'lt': lt0,
    'execution': execution0,
    '_eventId': 'submit',
    'login': '登录',
}

requests.post(post_addr, data=post_data, headers=post_header, cookies=response_cookie)
