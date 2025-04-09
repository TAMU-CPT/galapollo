#!/bin/sh
cat > /usr/local/apache2/conf/httpd.conf.append << EOF
LogLevel debug
LoadModule proxy_module modules/mod_proxy.so
LoadModule proxy_http_module modules/mod_proxy_http.so
LoadModule proxy_wstunnel_module modules/mod_proxy_wstunnel.so
ProxyPass "/config.json" "http://apollo-server:3999/jbrowse/config.json"
ProxyPassReverse "/config.json" "http://apollo-server:3999/jbrowse/config.json"
ProxyPassMatch "^/apollo/(.*)$" "http://apollo-server:3999/\$1" upgrade=websocket connectiontimeout=3600 timeout=3600
ProxyPassReverse "/apollo/" "http://apollo-server:3999/"
EOF