-- humble's test application
-- Copyright (C) 2017 Humble <humble_zh@163.com>
-- 2017/04/19	Humble	FirstRelease

module("luci.controller.htest", package.seeall)

function index()
	--[[ 保存配置信息的文件/etc/config/htest ]]--
	if not nixio.fs.access("/etc/config/htest") then
		--[[ 文件不存在，直接退出 ]]--
		return
	end

	--entry(path, target, title=nil, order=nil)
	entry({"admin", "humble"},
		alias("admin", "humble", "htest"),
		_("Humble"), 70).dependent = false

	entry({"admin", "humble", "htest"},
		cbi("htest"),
		_("Htest"), 10).leaf = true
end
