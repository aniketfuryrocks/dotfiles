gnome-terminal-config-restore:
	dconf load /org/gnome/terminal/ < gnome_terminal_settings_backup.txt

setup-fedora:
	./setup_fedora	
