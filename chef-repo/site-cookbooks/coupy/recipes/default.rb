#
# Cookbook Name:: coupy
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node['apache']['appenv'] == 'cpydev'
  
  link "/var/www/coupy" do
    to "/home/mediu3g/coupy"
  end
  
else

  link "/var/www/coupy" do
    to "/vagrant/coupy"
  end
  
end



# ap_console.logダミーファイル
cookbook_file "/var/log/ap/ap_console.log" do
  owner "apache"
  group "apache"
  mode 00755
end