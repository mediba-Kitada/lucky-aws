#
# Cookbook Name:: smartpass
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'database::mysql'

link "/var/www/pass.auone.jp" do
  to "/vagrant/smartpass/pass.auone.jp"
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

# 接続情報
mysql_connection_info = {
  :host => "localhost",
  :username => "root",
}

# BDB.pass
mysql_database "pass" do
  connection mysql_connection_info
  action :create
end

mysql_database_user "cake_view" do
  connection mysql_connection_info
  password "cake_view"
  database_name "pass"
  privileges [:all]
  action [:create, :grant]
end

# async.pass
mysql_database "pass_async" do
  connection mysql_connection_info
  action :create
end

mysql_database_user "sirius_select" do
  connection mysql_connection_info
  password "select"
  database_name "pass_async"
  privileges [:all]
  action [:create, :grant]
end