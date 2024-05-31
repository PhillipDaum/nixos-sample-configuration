{ config, pkgs, ... }:

{
  # Jellyfin
  ## this is from Ricky Kresslin, thanks! https://kressle.in/jellyfin
  virtualisation.oci-containers.containers."jellyfin" = {
    autoStart = true;
    image = "jellyfin/jellyfin";
    volumes = [
      "/media/containers/Jellyfin/config:/config"
      "/media/containers/Jellyfin/cache:/cache"
      "/media/containers/Jellyfin/log:/log"
      "/media/movies:/movies"
      "/media/shows:/shows"
	"/media/music:/music"
    ];
    ports = [ "8096:8096" ];
    environment = {
      JELLYFIN_LOG_DIR = "/log";
    };
  };
}
