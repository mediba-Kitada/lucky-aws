#
# Cookbook Name:: cdn-img
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node['apache']['appenv'] == 'cpydev'

  link "/var/www/cdn" do
    to "/home/mediu3g/kittyhawk/cdn"
  end
    
else
  
  link "/var/www/cdn" do
    to "/vagrant/kittyhawk/cdn"
  end

end