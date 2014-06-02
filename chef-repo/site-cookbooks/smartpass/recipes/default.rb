#
# Cookbook Name:: smartpass
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

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