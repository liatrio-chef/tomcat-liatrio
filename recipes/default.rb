#
# Cookbook Name:: tomcat-liatrio
# Recipe:: default
#
#

include_recipe "java"
include_recipe "tomcat"

tomcat_install 'petclinic' do
  version "#{node[:tomcat_liatrio][:version]}"
  tarball_base_path "#{node[:tomcat_liatrio][:tarball_base_path]}"
  checksum_base_path "#{node[:tomcat_liatrio][:checksum_base_path]}"
  exclude_examples false
  exclude_docs false
end

template 'server.xml' do
  #path   "#{node[:nginx][:dir]}/conf/server.xml"
  path   "/opt/tomcat_petclinic/conf/server.xml"
  source "server.xml.erb"
  owner  'tomcat_petclinic'
  group  'tomcat_petclinic'
  mode   '0600'
end

tomcat_service 'petclinic' do
  action [ :enable, :start ]
end

directory '/home/tomcat_petclinic/.ssh' do
  recursive true
end

file '/home/tomcat_petclinic/.ssh/authorized_keys' do
  content 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCz2EV4WLtpFgxCP/jsP5ydU6NFtDZFuJupNDnc0r6RXgUQuu0kVLbZous/Gd0fxBR05DiyqwU0ixx6AOYfn0/od5jYOb6+6f3j9O4RwSc/gUBd5mOLm/6pKkLDiyxnZyiUGRJCP2NUEIYd3+6+8oCI2aGNS6M8E8rLU3e4f3Vj5CZswGhm1j1A9uY/Cpj0/6TNsnpHJ9VFqDXuV95q3r89MMQ1ekoT6+MgDuxmbWh7NqVffwssoTaxXC8qn0jtsT2JblGJ0y/fSj1Npe7WPgFQqeLGXff+vJynh9bRIAWGJnKE56q+xSsnlsLHqV0HPJwkvRfVrP/ecaT/PtU+nnxT'
  mode '0600'
  owner 'tomcat_petclinic'
  group 'tomcat_petclinic'
end
