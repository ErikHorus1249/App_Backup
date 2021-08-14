sudo apt install -y git zsh vim curl gnome-tweaks gnome-session \
gnome-shell-extensions python3-venv variety docker.io

gsettings set org.gnome.mutter center-new-windows true
gsettings set org.gnome.desktop.interface clock-show-seconds true

# AnyDesk 
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
# Spotify 
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# Bamboo unikey 
sudo add-apt-repository -y ppa:bamboo-engine/ibus-bamboo

sudo apt-get update -y 
sudo apt -y install ibus-bamboo spotify-client anydesk
ibus restart
env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"


# VS code 
wget -O ~/Downloads/app.vscode.deb  "https://www.dropbox.com/s/q9xigfdiryqjbav/code_1.59.0-1628120042_amd64.deb?dl=1"
sudo dpkg -i ~/Downloads/app.vscode.deb
rm ~/Downloads/app.vscode.deb
# Zoom 
wget -O ~/Downloads/app.zoom.deb https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i ~/Downloads/app.zoom.deb 
rm ~/Downloads/app.zoom.deb
sudo apt -y  --fix-broken install

sudo usermod -aG docker $USER
reboot

