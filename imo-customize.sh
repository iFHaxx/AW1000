#!/bin/bash

# Remove default root password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' immortalwrt/package/lean/default-settings/files/zzz-default-settings

# Set default theme to Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' immortalwrt/package/lean/default-settings/files/zzz-default-settings

# Set default language to English (en)
sed -i '/config language/d' immortalwrt/package/lean/default-settings/files/zzz-default-settings
echo 'uci set luci.main.lang=en' >> immortalwrt/package/lean/default-settings/files/zzz-default-settings
echo 'uci commit luci' >> immortalwrt/package/lean/default-settings/files/zzz-default-settings

# Remove Chinese language files
find immortalwrt/package -type f -name *zh_Hans* -delete
find immortalwrt/feeds -type f -name *zh_Hans* -delete
find immortalwrt/package -type f -name *zh-cn* -delete
find immortalwrt/feeds -type f -name *zh-cn* -delete

# Set default and permanent TTL to 64
echo 'net.ipv4.ip_default_ttl=64' >> immortalwrt/package/base-files/files/etc/sysctl.conf

# Change default SSID to "DCWRT"
sed -i "s/option ssid.*/option ssid 'DCWRT'/" immortalwrt/package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Change DISTRIB_DESCRIPTION to DCWRT
sed -i 's/DISTRIB_DESCRIPTION="LEDE"/DISTRIB_DESCRIPTION="DCWRT"/' immortalwrt/package/base-files/files/etc/immortalwrt_release

# Change system hostname to DCWRT
sed -i 's/hostname=.*/hostname=DCWRT/' immortalwrt/package/base-files/files/bin/config_generate
