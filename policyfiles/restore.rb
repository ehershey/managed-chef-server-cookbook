name 'default'

include_policy 'base', path: './base.lock.json'

run_list 'managed-chef-server::_chefdk' # added for inclusion of the chefdk for testing

override['mcs']['restore']['file'] = '/backups/chef-server-backup-201811110055.tgz'

override['mcs']['skip_test'] = true
