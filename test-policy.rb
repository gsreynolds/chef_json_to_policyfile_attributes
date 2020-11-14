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
default['corp']['packages'] = ['httpd']
default['apache']['something']['release'] = '23.el7'
default['2']['test'] = 'test'
default['topleveltest'] = 'test'

# default attributes from dev environment
default['dev']['corp']['packages'] = ['httpd']

# default attributes from example1 role
default['corp']['packages'] = ['httpd']
default['apache']['something']['release'] = '23.el7'
default['2']['test'] = 'test'
default['topleveltest'] = 'test'

# default attributes from dev environment
default['dev']['corp']['packages'] = ['httpd']

# default attributes from prod environment
default['prod']['corp']['packages'] = %w(httpd somethingelse)
default['prod']['apache']['something']['release'] = '23.el7'
default['prod']['2']['test'] = 'test'
default['prod']['topleveltest'] = 'test'

# override attributes from prod environment
override['prod']['ABC']['env_name'] = 'DEV'
override['prod']['ABC']['database']['server'] = 'a'
override['prod']['ABC']['database']['name'] = 'qa'
override['prod']['ABC']['database']['user'] = 'qa'
override['prod']['ABC']['database']['sid'] = '123'
override['prod']['ABC']['database']['port'] = '1000'
override['prod']['webserver']['conn']['pool_size'] = '10'
override['prod']['webserver']['something']['somethingmore']['test'] = [1000, 2000]
override['prod']['server']['uri'] = 'example.com'
override['prod']['s3']['remote_path'] = '/path/'
override['prod']['tar.gz_file'] = '123.tar.gz'
override['prod']['email']['onError']['business'] = '123@example.com'
override['prod']['email']['onError']['nonbusiness'] = '123@examle.com'
override['prod']['taskscheduler']['instance'] = ['123']
