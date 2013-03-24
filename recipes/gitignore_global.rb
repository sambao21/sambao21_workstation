template "#{WS_HOME}/.gitignore_global" do
  source "gitignore_global.erb"
  owner WS_USER
  action :create_if_missing
end
