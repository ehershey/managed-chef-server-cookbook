# # encoding: utf-8

# Inspec test for recipe managed-chef-server::legacy

# check output of knife commands

describe command('knife environment list -c /etc/opscode/managed/chef_managed_org/config.rb') do
  its ('stdout') { should match /^_default$/ }
  its ('stdout') { should match /^essex$/ }
  its ('stdout') { should match /^lab$/ }
  its ('stdout') { should match /^vagrant$/ }
  its ('stdout') { should_not match /^lab-admin$/ }
end

describe command('knife role list -c /etc/opscode/managed/chef_managed_org/config.rb') do
  its ('stdout') { should match /^base$/ }
  its ('stdout') { should match /^lab-admin$/ }
  its ('stdout') { should match /^lab-base$/ }
  its ('stdout') { should_not match /^lab-environment$/ }
end

describe command('knife cookbook list -c /etc/opscode/managed/chef_managed_org/config.rb') do
  its ('stdout') { should match /^apt           7.1.1$/ }
  its ('stdout') { should match /^chef-client   11.0.3$/ }
  its ('stdout') { should match /^cron          6.2.1$/ }
  its ('stdout') { should match /^iptables      4.3.4$/ }
  its ('stdout') { should match /^logrotate     2.2.0$/ }
  its ('stdout') { should match /^mattray       0.8.0$/ }
  its ('stdout') { should match /^ntp           3.6.0/ }
  its ('stdout') { should match /^openssh       2.7.0$/ }
  its ('stdout') { should match /^sudo          5.4.0/ }
end

describe command('knife cookbook show ntp -c /etc/opscode/managed/chef_managed_org/config.rb') do
  its ('stdout') { should match /^ntp.*3.6.0/ }
end

describe command('knife cookbook show sudo -c /etc/opscode/managed/chef_managed_org/config.rb') do
  its ('stdout') { should match /^sudo.*5.4.0$/ }
end
