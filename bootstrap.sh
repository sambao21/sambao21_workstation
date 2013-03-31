#!/bin/bash

pushd `pwd`
if rvm --version 2>/dev/null; then
  rvm use 1.9.3
  gem install soloist
else
  sudo gem install soloist
fi

mkdir -p ~/cookbooks; cd ~/cookbooks

cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::homebrew
- pivotal_workstation::git
- sambao21_workstation::gitignore_global
- sambao21_workstation::gitconfig
- pivotal_workstation::oh_my_zsh
- pivotal_workstation::node_js
- pivotal_workstation::ack
- sambao21_workstation::vimrc
- sambao21_workstation::sublime_text
- sambao21_workstation::iterm2
- sambao21_workstation::google_drive
- sambao21_workstation::spotify
- sambao21_workstation::google_voice_and_video
- pivotal_workstation::firefox
- pivotal_workstation::chrome
- pivotal_workstation::bettertouchtool
- pivotal_workstation::dropbox
- pivotal_workstation::evernote
- pivotal_workstation::sourcetree
- sambao21_workstation::dock_preferences
- sambao21_workstation::active_corners
EOF

if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/pivotal/pivotal_workstation.git
fi

if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi

if [[ -d sambao21_workstation ]]; then
  cd sambao21_workstation && git pull && cd ..
else
  git clone https://github.com/sambao21/sambao21_workstation.git
fi

soloist
popd
