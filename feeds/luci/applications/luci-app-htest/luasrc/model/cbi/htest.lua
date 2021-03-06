-- humble's test application
-- Copyright (C) 2017 Humble <humble_zh@163.com>
-- 2017/04/19	Humble	FirstRelease

require("uci")

-- We want to edit the uci config file /etc/config/htest
m = Map("htest", translate("Htest"), translate("The short description of Htest application."))
x = uci.cursor()

-- Especially the "general" section
s = m:section(NamedSection, "general", "htest", translate("Htest Configuration")) 

s:tab("general", translate("General Setup"))
s:tab("advanced", translate("Advanced Settings"))

-------- table general --------
en = s:taboption("general", Flag, "enable", translate("Enable"))
en.datatype = "bool"

la = s:taboption("general", Value , "local_addr", translate("Local Addr"))
la.datatype = "host"

lp = s:taboption("general", Value , "local_port", translate("Local Port"))
lp.datatype = "port"

ra = s:taboption("general", Value , "remote_addr", translate("Remote Addr"))
ra.datatype = "host"

rp = s:taboption("general", Value , "remote_port", translate("Remote Port"))
rp.datatype = "port"

pp = s:taboption("general", ListValue, "proxy_type", translate("Proxy Type"))
pp:value("shadowsocks",translate("Shadowsocks"))
pp:value("socks5",translate("Socks5"))
pp:value("direct",translate("Forword2VPN"))
pp:value("campus_router",translate("Campus router"))

usr = s:taboption("general", Value , "usr", translate("Username"))
usr.datatype = "rangelength(5,15)"

pwd = s:taboption("general", Value , "pwd", translate("Password"))
pwd.password = "true"
pwd.datatype = "or(wpakey,rangelength(5,15))"

-------- table advanced --------
en1 = s:taboption("advanced", Flag, "enable1", translate("Enable1"))

return m
