{
  pkgs,
  ...
}:
{
  # tools to deal with a few cloud services
  environment.systemPackages = with pkgs; [
    scaleway-cli
    hcloud

    s3cmd
    minio-client
  ];
}