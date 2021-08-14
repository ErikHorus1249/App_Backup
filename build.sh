sudo apt install -y git zsh vim curl gnome-tweaks gnome-session \
gnome-shell-extensions python3-venv variety docker.io



curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo

sudo apt-get update -y 
sudo apt -y install ibus-bamboo spotify-client
ibus restart

env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

sudo usermod -aG docker $USER
reboot

