name 'default'

include_policy 'base', path: './base.lock.json'

run_list 'managed-chef-server::default'
