#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "docker-io" do
  options "--enablerepo=epel"
  action :install
end

bash "dockerup-coupy" do
  only_if "find /vagrant/docker/coupy/Dockerfile"
  code <<-EOL
    docker build -t lucky/coupy /vagrant/docker/coupy
    docker run -p 49001:22 -d lucky/coupy
  EOL
end