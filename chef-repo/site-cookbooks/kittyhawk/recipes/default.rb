#
# Cookbook Name:: kittyhawk
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

link "/var/www/tokuten.auone.jp" do
  to "/vagrant/kittyhawk/tokuten.auone.jp"
end

directory "/var/runtime" do
  mode 00777
  user "apache"
  group "apache"
  action :create
end

# ap.logダミーファイル
cookbook_file "/var/log/ap/ap.log" do
  owner "apache"
  group "apache"
  mode 00755
end

# PRIME coupon-detail.logダミーファイル
cookbook_file "/var/log/ap/coupon-detail.log" do
  owner "apache"
  group "apache"
  mode 00755
end

# デプロイツール(capistrano)検証用
if node['base']['cap'] == "1"
  
  link "/var/www/tokuten.auone.jp" do
    action :delete
  end
  
end
