#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"

cookbook_file "lang.sh" do
  path "/etc/profile.d/lang.sh"
  mode 755
  action :create_if_missing
  notifies :run, "execute[locale fix]"
end

execute "locale fix" do
  command "locale-gen en_US.UTF-8 && dpkg-reconfigure locales"
  action :nothing
end

ENV['LANGUAGE'] = ENV['LANG'] = ENV['LC_ALL'] = "en_US.UTF-8"
include_recipe "postgresql::server"
include_recipe "postgresql::development"
