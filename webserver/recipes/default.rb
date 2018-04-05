#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

service ‘apache’ do
    service_name ‘httpd’
    action [:enable, :start]
End

file ‘/etc/httpd/vhost.conf’ do
    content ‘fake vhost file’
    notifies :restart, ‘service[httpd]’
end

file ‘/var/www/html/index.html’ do
  content ‘Hello World’
  mode ‘0755’
  owner ‘root’
  group ‘apache’
end
