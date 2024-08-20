let
  sshKey = import ../ssh-key.nix;
in {
  "veselinPassword.age".publicKeys = [sshKey];
}
