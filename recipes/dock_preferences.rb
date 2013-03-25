#include_recipe 'pivotal_workstation::dock_preferences'

pivotal_workstation_defaults "set dock to be on left" do
  domain "com.apple.dock"
  key "orientation"
  string node["dock_preferences"]["orientation"]
end

pivotal_workstation_defaults "set dock to autohide" do
  domain "com.apple.dock"
  key "autohide"
  boolean node["dock_preferences"]["autohide"] && node["dock_preferences"]["autohide"] != 'false'
end

pivotal_workstation_defaults "turn on magnification" do
  domain "com.apple.dock"
  key "magnification"
  boolean node["dock_preferences"]["magnification"]
end

pivotal_workstation_defaults "set size" do
  domain "com.apple.dock"
  key "tilesize"
  float node["dock_preferences"]["tilesize"]
end

pivotal_workstation_defaults "set magnification size" do
  domain "com.apple.dock"
  key "largesize"
  float node["dock_preferences"]["largesize"]
end

execute "relaunch dock" do
  command "killall Dock"
end
