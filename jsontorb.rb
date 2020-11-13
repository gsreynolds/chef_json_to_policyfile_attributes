require 'json'

# Take a role or environment JSON file and get Ruby attributes back for a Policyfile
json_file = File.expand_path(ARGV[0])
json = JSON.parse(File.read(json_file))

def attr_print(precedence, chef_type, name, key, values)
  attr_string = precedence
  attr_string += "['#{name}']" if chef_type == 'environment'
  key.each do |k|
    attr_string += "['#{k}']"
  end
  attr_string += ' = '
  attr_string += if values.is_a? String
                   "'#{values}'"
                 else
                   "#{values}"
                 end
  puts attr_string
end

def recurse_attr_print(precedence, chef_type, name, key, values)
  key = Array(key)
  if values.is_a?(Hash)
    # recurse another level
    values.each do |k, v|
      recurse_attr_print(precedence, chef_type, name, key + [k], v)
    end
  else
    # no more levels
    attr_print(precedence, chef_type, name, key, values)
  end
end

puts "\n# default attributes from #{json['name']} #{json['chef_type']}" unless json['default_attributes'].empty?
json['default_attributes'].each do |key, values|
  recurse_attr_print('default', json['chef_type'], json['name'], key, values)
end

puts "\n# override attributes from #{json['name']} #{json['chef_type']}" unless json['override_attributes'].empty?
json['override_attributes'].each do |key, values|
  recurse_attr_print('override', json['chef_type'], json['name'], key, values)
end


