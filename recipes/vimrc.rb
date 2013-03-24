template "#{WS_HOME}/.vimrc" do
  source "vimrc.erb"
  owner WS_USER
  action :create_if_missing
end
