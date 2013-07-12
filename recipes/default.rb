#
# Cookbook Name:: postgresql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "apt"
include_recipe "postgresql::server"
include_recipe "postgresql::development"
