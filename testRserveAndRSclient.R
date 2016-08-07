####################################################################################################
# 启动RServer,支持远程:
# > cmd
# > d:\R\R-3.2.5\library\Rserve\libs\x64\Rserve.exe --no-save --slave --RS-enable-remote  --RS-port 6311


#自动重启
#  
#参考：
#  
#  windows上的自动重启工具： NSSM - the Non-Sucking Service Manager
#  http://nssm.cc/usage
#  
#  r - How to make an upstart service to Rserve? - Stack Overflow
#  http://stackoverflow.com/questions/32485131/how-to-make-an-upstart-service-to-rserve#
#  
#  R: Functions to talk to an Rserve instance (new version)
#  https://rforge.net/doc/packages/RSclient/RCC.html
#  
#参考：
#
#  #Rserve.exe使用帮助: 
#  # $ d:\R\R-3.2.5\library\Rserve\libs\x64\Rserve.exe --help
#  # Usage: R CMD Rserve [<options>]
#  # 
#  # Options: --help  this help screen
#  #  --version  prints Rserve version (also passed to R)
#  #  --RS-port <port>  listen on the specified TCP port
#  #  --RS-socket <socket>  use specified local (unix) socket instead of TCP/IP.
#  #  --RS-workdir <path>  use specified working directory root for connections.
#  #  --RS-encoding <enc>  set default server string encoding to <enc>.
#  #  --RS-conf <file>  load additional config file.
#  #  --RS-settings  dumps current settings of the Rserve
#  #  --RS-source <file>  source the specified file on startup.
#  #  --RS-enable-control  enable control commands
#  #  --RS-enable-remote  enable remote connections


参考：

# 查看当前机器6311端口是否开启：
   # netstat -an|findstr /sino 6311

# 查看某机器6311端口是否可访问：

  #  windows:
  #  powshell > 
    #  Test-NetConnection -Port 800 -ComputerName localhost -InformationLevel Detailed
  
  #  启用telnet命令：
    #  Click Start > Control Panel, Programs, and then Turn Windows Features(windows 功能) on or off. In the list, scroll down and select Telnet Client(Telnet 客户端) and click OK
  #  telnet localhost 6311 

  #  下载微软工具PortQry
    # portqry -n 11.22.33.44 -p tcp -e 80
  
  #  linux:
    #  telnet localhost:6311 

####################################################################################################

# install.packages("C:/Users/liango/Desktop/111/RSclient_0.7-2.zip", repos = NULL, type = "win.binary")
library(RSclient);
c=RS.connect();
RS.eval(c, getwd())
RS.close(c)

c=RS.connect(host="localhost"); #ok
RS.eval(c, getwd())
RS.close(c)

c = RS.connect(host = "localhost", port = 6311L); #ok
RS.eval(c, getwd());
RS.close(c)

c=RS.connect(host = "192.168.3.4", port = 6311L); #ok
RS.eval(c, getwd())
RS.close(c)

c = RS.connect(host = "Lenovo-PC", port = 6311L); #ok
RS.eval(c, getwd());
RS.close(c)
quit()
