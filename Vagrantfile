# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'liatrio/centos7chefjava'

  config.vm.network 'forwarded_port', guest: 8082, host: 18_082

  config.vm.provider 'virtualbox' do |v|
    v.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    v.customize ['modifyvm', :id, '--cpus', 1]
    v.customize ['modifyvm', :id, '--memory', '1024']
    # v.customize ["modifyvm", :id, "--name", "tomcat-liatrio"]
  end

  config.berkshelf.enabled = true

  config.vm.provision 'chef_solo' do |chef|
    chef.add_recipe 'tomcat-liatrio'
    chef.json = {
      'java' => {
        'jdk_version' => '8'
      },
      'tomcat_liatrio' => {
        # "version" => "8.0.33",
        # "tarball_base_path" => "http://192.168.1.125/",
        # "checksum_base_path" => "http://192.168.1.125/",
        'connector_port' => '8082',
        'ajp_port' => '8010'
      }
    }
  end

  config.vm.provision 'shell', inline: 'firewall-cmd --permanent --add-port=8082/tcp && firewall-cmd --reload'
end
