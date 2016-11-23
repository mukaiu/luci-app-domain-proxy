PKG_NAME:=luci-app-ipset-list
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Yu Xiang <mukaiu@live.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

define Package/luci-app-ipset-list
    SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=Domain Proxy for shadowsocks
endef

define Package/luci-app-ipset-list/description
	Domain Proxy for shadowsocks.
endef

define Package/luci-app-ipset-list/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./files/luci/controller/*.lua $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/domain-ipset
	$(INSTALL_DATA) ./files/luci/model/cbi/domain-ipset/*.lua $(1)/usr/lib/lua/luci/model/cbi/domain-ipset/
endef