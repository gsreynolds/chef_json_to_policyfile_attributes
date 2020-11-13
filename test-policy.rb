# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'test-policy'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'chef-client::default', 'audit::default'

# default attributes from example1 role
default['corp']['packages'] = ["httpd"]
default['apache']['something']['release'] = '23.el7'
default['2']['test'] = 'test'
default['topleveltest'] = 'test'

# default attributes from example1 environment
default['example1']['corp']['packages'] = ["httpd"]
default['example1']['apache']['something']['release'] = '23.el7'
default['example1']['2']['test'] = 'test'
default['example1']['topleveltest'] = 'test'

# override attributes from example1 environment
override['example1']['a']['ABC']['env_name'] = 'DEV'
override['example1']['a']['ABC']['database']['server'] = 'a'
override['example1']['a']['ABC']['database']['name'] = 'qa'
override['example1']['a']['ABC']['database']['user'] = 'qa'
override['example1']['a']['ABC']['database']['sid'] = '123'
override['example1']['a']['ABC']['database']['port'] = '1000'
override['example1']['a']['webserver']['conn']['pool_size'] = '10'
override['example1']['a']['webserver']['something']['somethingmore']['test'] = [1000, 2000]
override['example1']['a']['server']['uri'] = 'example.com'
override['example1']['a']['s3']['remote_path'] = '/path/'
override['example1']['a']['tar.gz_file'] = '123.tar.gz'
override['example1']['a']['email']['onError']['business'] = '123@example.com'
override['example1']['a']['email']['onError']['nonbusiness'] = '123@examle.com'
override['example1']['a']['taskscheduler']['instance'] = ["123"]
override['example1']['b']['ABC']['env_name'] = 'DEV'
override['example1']['b']['ABC']['database']['server'] = 'a'
override['example1']['b']['ABC']['database']['name'] = 'qa'
override['example1']['b']['ABC']['database']['user'] = 'qa'
override['example1']['b']['ABC']['database']['sid'] = '123'
override['example1']['b']['ABC']['database']['port'] = '1000'
override['example1']['b']['webserver']['conn']['pool_size'] = '10'
override['example1']['b']['webserver']['something']['somethingmore']['test'] = [1000, 2000]
override['example1']['b']['server']['uri'] = 'example.com'
override['example1']['b']['s3']['remote_path'] = '/path/'
override['example1']['b']['tar.gz_file'] = '123.tar.gz'
override['example1']['b']['email']['onError']['business'] = '123@example.com'
override['example1']['b']['email']['onError']['nonbusiness'] = '123@examle.com'
override['example1']['b']['taskscheduler']['instance'] = ["123"]
