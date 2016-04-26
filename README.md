tomcat-liatrio Cookbook
========================
A wrapper cookbook that installs and configures tomcat to be used with other *-liatrio cookbooks to form a pipeline.

* The tomcat user is given an SSH public key from jenkins-liatrio cookbook to allow deploying the petclinic application via SCP after successful build.

Requirements
------------
Ensure the ChefDK is installed from https://downloads.chef.io/chef-dk/

Ensure the vagrant-berkshelf plugin is installed: `vagrant plugin install vagrant-berkshelf`

Usage
-----
#### tomcat-liatrio::default
`vagrant up`

Browse to http://localhost:180/

or

Just include `tomcat-liatrio` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[tomcat-liatrio]"
  ]
}
```

Attributes
----------
default[:tomcat_liatrio][:version]  = '8.0.32'
default[:tomcat_liatrio][:tarball_base_path]  = 'http://archive.apache.org/dist/tomcat/'
default[:tomcat_liatrio][:checksum_base_path]  = 'http://archive.apache.org/dist/tomcat/'
default[:tomcat_liatrio][:connector_port]  = '8080'
default[:tomcat_liatrio][:ajp_port]  = '8009'

License and Authors
-------------------
Authors: drew@liatrio.com
