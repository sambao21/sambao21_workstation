include_recipe 'pivotal_workstation::node_js'

node["global_npm_packages"].each do |package|
  execute "npm -g install #{package}" do
    command "npm -g install #{package}"
    user WS_USER
  end
end
