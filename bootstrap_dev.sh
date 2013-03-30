#!/bin/bash

pushd `pwd`
if rvm --version 2>/dev/null; then
  gem install soloist
else
  sudo gem install soloist
fi

mkdir -p ~/cookbooks_dev; cd ~/cookbooks_dev

cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- pivotal_workstation::rvm
- pivotal_workstation::gem_setup
- pivotal_workstation::node_js
EOF

if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/sambao21/pivotal_workstation.git
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
