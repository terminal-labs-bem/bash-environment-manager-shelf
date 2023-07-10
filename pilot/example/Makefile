APPNAME="bridgepilot"
SUDOUSERNAME=$(SUDO_USER)
CONFIGURATION="default"
TYPE="python"
PYTHONVERSION="3.11"
HOSTTYPE="default"
INTERNALUSER=$(SUDO_USER)
PLATFORM=".tlcache"
PLUGIN="rambo"
EXTRA="none"

help:
	@echo "usage: make [command]"

define kickoff
	@sudo bash .tmp/bem/plugins/rambo/assemble.sh $(APPNAME) $(SUDOUSERNAME) $(CONFIGURATION) $(TYPE) $(PYTHONVERSION) $(HOSTTYPE) $(INTERNALUSER) $(PLATFORM) $(PLUGIN) $(EXTRA)
endef

download_bash_environment_manager:
	@if test ! -d ".tmp";then \
		sudo su -m $(SUDO_USER) -c "mkdir -p .tmp"; \
		sudo su -m $(SUDO_USER) -c "mkdir -p .tmp/prep"; \
		sudo su -m $(SUDO_USER) -c "mkdir -p .tmp/bem"; \
# 		sudo su -m $(SUDO_USER) -c "cd .tmp/prep; wget -O bash-system-shelf.zip https://github.com/terminal-labs/bash-system-shelf/archive/refs/heads/master.zip"; \
#  		sudo su -m $(SUDO_USER) -c "cd .tmp/prep; wget -O bash-launcher-manager.zip https://github.com/terminal-labs/bash-launcher-manager/archive/refs/heads/master.zip"; \
#  		sudo su -m $(SUDO_USER) -c "cd .tmp/prep; unzip -n bash-system-shelf.zip"; \
#  		sudo su -m $(SUDO_USER) -c "cd .tmp/prep; unzip -n bash-launcher-manager.zip"; \
#  		sudo su -m $(SUDO_USER) -c "cp -r .tmp/prep/bash-system-shelf-master/* .tmp/bem"; \
#  		sudo su -m $(SUDO_USER) -c "cp -r .tmp/prep/bash-launcher-manager-master/* .tmp/bem"; \
		#sudo su -m $(SUDO_USER) -c "cp -r /home/user/.tlcache/assets/bem/ .tmp"; \
	fi

conda: CONFIGURATION="default"
conda: HOSTTYPE="host"
conda: INTERNALUSER=$(SUDO_USER)
conda: download_bash_environment_manager
	$(call kickoff)

vagrant.conda: CONFIGURATION="default"
vagrant.conda: HOSTTYPE="vagrant"
vagrant.conda: INTERNALUSER="vagrant"
vagrant.conda: download_bash_environment_manager
	@if test ! -f "Vagrantfile";then \
		wget https://raw.githubusercontent.com/terminal-labs/bash-environment-shelf/master/vagrantfiles/Vagrantfile; \
		chown $(SUDO_USER) Vagrantfile; \
	fi
	$(call kickoff)
