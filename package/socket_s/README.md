# socket_s

```Bash
humble@humble-pc:~/lede$ ./scripts/feeds install -a
humble@humble-pc:~/lede$ make menuconfig 
	Utilities  --->
		<M> socket_s
humble@humble-pc:~/lede$ make package/socket_s/compile V=99
humble@humble-pc:~/lede$ 
humble@humble-pc:~/lede$ find bin/ -name socket_s*
bin/packages/mips_24kc/base/socket_s_1.0.0-1_mips_24kc.ipk
humble@humble-pc:~/lede$ scp bin/packages/mips_24kc/base/socket_s_1.0.0-1_mips_24kc.ipk root@192.168.1.1:/tmp
root@192.168.1.1's password: 
socket_s_1.0.0-1_mips_24kc.ipk                100% 2459     2.4KB/s   00:00
humble@humble-pc:~/lede$ 
humble@humble-pc:~/lede$ ssh -l root 192.168.1.1
root@192.168.1.1's password: 


BusyBox v1.25.1 () built-in shell (ash)

     _________
    /        /\      _    ___ ___  ___
   /  LE    /  \    | |  | __|   \| __|
  /    DE  /    \   | |__| _|| |) | _|
 /________/  LE  \  |____|___|___/|___|                      lede-project.org
 \        \   DE /
  \    LE  \    /  -----------------------------------------------------------
   \  DE    \  /    Reboot (17.01-SNAPSHOT, r3316-7eb58cf)
    \________\/    -----------------------------------------------------------

root@LEDE:~# opkg install /tmp/socket_s_1.0.0-1_mips_24kc.ipk 
Installing socket_s (1.0.0-1) to root...
Configuring socket_s.
root@LEDE:~# which socket_s
/bin/socket_s
root@LEDE:~# socket_s 
======waiting for client's request======
```

socket_c文件是客户端程序,打开新的shell终端
```Bash
humble@humble-pc:~$ cd lede/package/socket_s/
humble@humble-pc:~/lede/package/socket_s$ ls
Makefile  README.md  socket_c.c  src
humble@humble-pc:~/lede/package/socket_s$ gcc -Wall -o socket_c socket_c.c 
humble@humble-pc:~/lede/package/socket_s$ ./socket_c
usage: ./client <ipaddress>
humble@humble-pc:~/lede/package/socket_s$ ./socket_c 192.168.1.1
send msg to server: 
Hello World
Received : Hello,you are connected!
 humble@humble-pc:~/lede/package/socket_s$ 
```

在路由器服务端可以看到以下信息
```Bash
recv msg from client: Hello World
```
