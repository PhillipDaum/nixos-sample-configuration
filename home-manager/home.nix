# Edit this for your specific user apps and home manger stuff!
{ config, pkgs, ... }:

{
# Define a user account. you can set a password with ‘passwd’.
users.users.your-name = {
	isNormalUser = true;
	description = "your-name";
	extraGroups = [ "networkmanager" "wheel" ];
	packages = with pkgs; [
	firefox
    steam
	vscodium-fhs
	google-chrome
	gedit
	calibre
	slack
	discord
	gnome.cheese
	gnomeExtensions.fuzzy-clock-2
	gnomeExtensions.vitals
	gnomeExtensions.dock-from-dash
	];
};

# Home Manager stuff
home-manager.users.your-name = {
	home.stateVersion = "24.05";
	# Desktop stuff	
	gtk = {
	enable = true;
	iconTheme = {
		name = "BeautyLine";
		package = pkgs.beauty-line-icon-theme;
	 };
		# Most apps show up with dark styling, but not all. 
		gtk3.extraConfig = {
			Settings = ''
			gtk-application-prefer-dark-theme=1
			'';
		};
		gtk4.extraConfig = {
			Settings = ''
			gtk-application-prefer-dark-theme=1
			'';
		};	
	};
	dconf.settings = {
		"org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
		};
		"org/gnome/desktop/wm/preferences" = {
			button-layout = ":minimize,maximize,close";
		};
		"org/gnome/shell" = {
    		favorite-apps = [
      			"org.gnome.Geary.desktop"
      			"org.gnome.Calendar.desktop"
      			"org.gnome.Nautilus.desktop"
      			"firefox.desktop"
      			"codium.desktop"
                #Console dosn't have beutyline icon 
      			"org.gnome.Console.desktop"
			    "org.gnome.Todo.desktop"
			    "steam.desktop"
      			"gedit.desktop"
			    "slack.desktop"
			    "discord.desktop"
      		];
			disable-user-extensions = false;
			# `gnome-extensions list` for a list
			enabled-extensions = [
				"Vitals@CoreCoding.com"
				"fuzzy-clock@keepawayfromfire.co.uk"
				"dock-from-dash@fthx"
				"user-theme@gnome-shell-extensions.gcampax.github.com"
			];
		};
    };
 };
}
