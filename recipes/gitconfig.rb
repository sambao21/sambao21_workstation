template "#{WS_HOME}/.gitconfig" do
  source "gitconfig.erb"
  owner WS_USER
  action :create_if_missing
end
