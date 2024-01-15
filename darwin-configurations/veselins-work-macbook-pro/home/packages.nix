{pkgs, ...}: {
  home.packages = with pkgs; [
    awscli2
    mkcert
    sshuttle
    ssm-session-manager-plugin
    terraform
  ];
}
