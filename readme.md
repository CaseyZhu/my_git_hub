
**在进行连接前首先必须有一个github账号,可以直接去官网下载就可以，记得登录时有邮箱申请。**
# 一安装git
Ubuntu安装git指令:apt-get install git


查看git版本信息:git version


配置git用户信息:git config --global 
user.name “用户名”

git config --global user.email “邮箱地址”

 # 二开启ssh

安装ssh:apt-get install ssh

查看服务状态:ps -e | grep sshd

红色的sshd表示ssh已经启动.

![sshd](https://img-blog.csdnimg.cn/2019050622412745.png)

# 三.生成ssh key

使用 ls -al ~/.ssh查看ssh key是否存在

![sshk](https://img-blog.csdnimg.cn/20190506224546241.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQzNjk3Njg4,size_16,color_FFFFFF,t_70)

若没有可以执行生成ssh key指令:ssh-keygen -t rsa -C “用户邮箱地址”
中间连续按回车就可以得到上图所示的ssh key


# 四.查看ssh key
进入/root/.ssh目录，查看id_rsa和id_rsa.pub:
如图：
在这里插入图片描述

# 四.复制ssh key
打开id_rsa.pub,复制其中的内容

# 五.添加ssh key
登录github,进入settings,找到SSH and gps keys,将刚复制的内容粘贴上去，title可以任意填写.

# 六.创建一个github仓库
进入github中点击new repository 

选择public, 仓库名字随意

# 关联本地内容

1， git remote add "仓库名称（自己起）" 仓库地址

2，然后添加文件， 

```
git add ** 

git commit -m "comment" 

git push "仓库名称（自己起）" master 

```

这样就可以把本地文件推送到github 的仓库了

