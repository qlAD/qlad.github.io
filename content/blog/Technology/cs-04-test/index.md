---
title: "Linux 笔试 50 题"
authors: ["qlAD", "ChatGPT"]
categories: ["技术"]
tags: ["计算机专业", "题库", "Linux"]
slug: "cs_04_test"
summary: "本文是一套 Linux 笔试 50 题，主要考察候选人对 Linux 操作系统的基本使用技能。"
# series: ["CS"]
# series_weight: 1
# seriesNavigation: true
draft: false
date: 2024-09-09T09:15:26+08:00
---

**1. Linux 操作系统使用下面哪个按键补齐当前正在输入的指令（  ）
A. CTRL
B. CTRL+ALT
C. TAB
D. CTRL+TAB**

**2. Linux 操作系统使用下面哪个命令查看本机的IP地址（  ）
A. ifconfig
B. ipconfig
C. netstat
D. ss**

**3. Linux 命令的基本语法是（  ）
A. 命令 参数 选项
B. 命令 选项 参数
C. 选项 命令 参数
D. 选项 参数 命令**

**4. 以下哪项是存放 Linux 系统用户的应用程序与指令的路径（  ）
A. /usr/log
B. /usr/bin
C. /var
D. /etc**

**5. 以下哪项是存放 Linux 系统日志的路径（  ）
A. /tmp/log
B. /var/log
C. /usr/log
D. /etc/log**

**6. Linux 系统使用哪个命令剪切文件（  ）
A. Ctrl+X
B. Ctrl+C
C. mv
D. cp**

**7. Linux 系统使用哪个命令切换工作路径（  ）
A. cd
B. dir
C. is
D. mv**

**8. 以下哪项是绝对路径表示（  ）
A. var/log
B. /etc
C. var/
D. etc**

**9. 在 Linux 系统中，rw-r--r-- 权限用数字表示是（  ）
A. 755
B. 655
C. 644
D. 744**

**10. Linux 系统使用哪个命令更改文件权限（  ）
A. chmod
B. chm
C. chown
D. cho**

**11. Linux 系统使用哪个命令更改文件所有者（  ）
A. chmod
B. chm
C. chown
D. cho**

**12. Linux系统使用哪个命令从最后一行开始向前显示文件（  ）
A. Cat
B. tac
C. less
D. more**

**13. Linux 系统使用 cat 命令时，使用哪个选项显示行号（  ）
A. N
B. B
C. b
D. n**

**14. Linux 系统使用哪个命令可以动态查看到文件的实时更新（  ）
A. tail -f
B. tail -n
C. cat -n
D. cat -f**

**15. /etc/passwd 文件中第一列表示（  ）
A. 用户名
B. 用户ID
C. 密码
D. 组ID**

**16. /etc/passwd 中第几列表示用户登录的 shell（  ）
A. 5
B. 6
C. 7
D. 8**

**17. Linux 操作系统中，将用户添加的组的命令是（  ）
A. useradd
B. groupadd
C. usermod
D. useraddgroup**

**18. Linux 操作系统中，使用哪个命令更改用户的主要组（  ）
A. usermod -a
B. usermod -g
C. usermod -A
D. usermod -G**

**19. Linux 操作系统中，当我们输入sudo 以提升权限时，系统会要求我们输入（  ）
A. root 的登录密码
B. 当前用户的登录密码
C. 一个独立的权限提升密码
D. 不需要输入密码，直接输入 y 表示确认**

**20. 以下哪个命令用于诊断到目标主机的连通性（  ）
A. ping
B. ss
C. netstat
D. ipconfig**

**21. Linux 在命令后面加上什么符号，会将命令放在后台运行（  ）
A. !
B. $
C. &
D. #**

**22. 下面哪个命令以用户角度查看进程使用资源（  ）
A. ps -u
B. ps -a
C. ps u
D. ps a**

**23. Linux 在终止进程时，使用哪个命令可以直接加上进程名来终止进程？（  ）
A. Killall
B. kill
C. kill -name
D. kill pname**

**24. systemctl enabled iptables 命令的含义是（  ）
A. 启动 iptables 服务器
B. 将 iptables 服务设为开机自动启动
C. 查看当前 iptabesl 服务的状态
D. 开启 iptables 服务的日志记录功能**

**25. Linux 的主要特性包含（  ）【多选】
A. 完全免费
B. 多任务
C. 一切皆文件
D. 支持多平台**

**26. Linux 的发行版本有（  ）【多选】
A. aix
B. centos
C. ubuntu
D. redhat**

**27. 以下哪些是 /etc/shadow 文件中表示的含义（  ）【多选】
A. 用户账户已禁用的天数
B. 用户口令最长使用天数
C. 用户上次修改口令日期
D. 用户上次的口令明文**

**28. Linux 中的 top 命令默认会显示下面哪些（ ）【多选】
A. 系统运行时间
B. 系统过去 1 分钟的平均负载
C. 物理内存使用
D. 系统线程数量**

**29. Linux 操作系统在登录时，输入密码，系统以 * 显示密码长度。（  ）
A. 正确
B. 错误**

**30. Linux 命令行结尾的提示符#表示，当前登录的用户是普通用户。（  ）
A. 正确
B. 错误**

**31. / 是 Linux 所有路径的开始，简称 Linux 的根目录（  ）
A. 正确
B. 错误**

**32. 若当前目录为 /home,命令 ls –l 将显示 home 目录下的（   ）。
A. 所有文件
B. 所有隐含文件
C. 所有非隐含文件
D. 文件的具体信息**

**33. RED HAT LINUX 9 默认使用的文件系统类型为（    ）
A. ext2
B. ext3
C. FAT
D. swap**

**34. 在 LINUX 中，要查看文件内容，可使用（    ）命令。
A. more
B. cd
C. login
D. logout**

**35. 以下命令中，可以将用户身份临时改变为 root 的是（    ）。
A. SU
B. su
C. login
D. logout**

**36. 若要将当前目录中的 myfile.txt 文件压缩成 myfile.txt.tar.gz，则实现的命令为（    ）。
A. tar –cvf myfile.txt myfile.txt.tar.gz D.
B. tar –zcvf myfile.txt myfile.txt.tar.gz
C. tar –zcvf myfile.txt.tar.gz myfile.txt
D. tar –cvf myfile.txt.tar.gz myfile.txt**

**37. usermod 命令无法实现的操作是（    ）
A. 账户重命名
B. 删除指定的账户和对应的主目录
C. 加锁与解锁用户账户
D. 对用户密码进行加锁或解锁**

**38. 要使得名为 fido 的文件具有如下权限 -r-xr-x—x 的命令________**

**39. 在 /root 文件夹下查找后缀为 .cpp 的文件 ________**

**40. 关闭 Linux 系统（不重新启动）可使用（   ）命令。
A. ctrl+alt+del
B. halt
C. shutdown -r
D. reboot**

**41. 显示已经挂装的文件系统磁盘 inode 使用状况的命令是(     ) 
A. df –i
B. su –I
C. du –I
D. free –i**

**42. 将前一个命令的标准输出作为后一个命令的标准输入，称之为 ________**

**43. 在使用了 shadow 口令的系统中，/etc/passwd 和 /etc/shadow 两个文件的权限正确的是：
A. -rw-r----- , -r--------
B. -rw-r--r-- , -r--r--r--
C. -rw-r--r-- , -r--------
D. -rw-r--rw- , -r-----r--**

**44. 有一个备份程序 mybackup，需要在周一至周五下午 1 点和晚上 8 点各运行一次，下面哪条 crontab 的项可以完成这项工作？
A. 0 13,20 * * 1,5 mybackup
B. 0 13,20 * * 1,2,3,4,5 mybackup
C. * 13,20 * * 1,2,3,4,5 mybackup
D. 0 13,20 1,5 * * mybackup**

**45. 如何从当前系统中卸载一个已装载的文件系统
A. umount
B. dismount
C. mount -u
D. 从 /etc/fstab 中删除这个文件系统项**

**46. 运行一个脚本，用户不需要什么样的权限？
A. read
B. write
C. execute
D. browse on the directory**

**47. 如何快速切换到用户 John 的主目录下？
A. cd @John
B. cd #John
C. cd &John
D. cd ~John**

**48. 使用什么命令可以查看 Linux 的启动信息？
A. mesg -d
B. dmesg
C. cat /etc/mesg
D. cat /var/mesg**

**49. 如何装载 (mount) 上在 /etc/fstab 文件中定义的所有文件系统
A. mount -a
B. mount /mnt/\*
C. mount
D. mount /etc/fstab**

**50. 使用 ln 命令将生成了一个指向文件 old 的符号链接 new，如果你将文件 old 删除，是否还能够访问文件中的数据？
A. 不可能再访问
B. 仍然可以访问
C. 能否访问取决于文件的所有者
D. 能否访问取决于文件的权限**

