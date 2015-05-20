#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#Enable an Apache Virtualhost
package 'httpd' do
	action :install
	notifies :restart, "service[httpd]"
end

cookbook_file "/var/www/error/noindex.html" do
  mode '0644'
end

service 'httpd' do
	supports :status => true, :restart => true, :reload => true
	action [ :start, :enable ]
end


