{
  pkgs,
  config,
  ...
}: {

  # User backup via restic
  services.restic.backups = {

    # ndufour backup
    localndufour = {
      paths = [
        "/home/ndufour"
      ];
      exclude = [
        "/home/ndufour/.local/share/Steam"
        "/home/ndufour/.cache"
        "/home/ndufour/.ollama"
        "/home/ndufour/.cargo"
        "/home/ndufour/.minikube"
        "/home/ndufour/.vagrant.d"
      ];
      
      initialize = true;
      repositoryFile  = config.sops.secrets."backups/localndufour/repository".path;
      passwordFile    = config.sops.secrets."backups/localndufour/password".path;
      environmentFile = config.sops.secrets."backups/localndufour/env".path;

      timerConfig = {
        OnCalendar = "*-*-* 9:00:00";
        Persistent = true;
      };

      pruneOpts = [
        "--keep-daily 14"
        "--keep-weekly 4"
        "--keep-monthly 1"
      ];
    };

  };
}