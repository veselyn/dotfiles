{lib, ...}: {
  programs.git = {
    signing.key = lib.mkForce "415F6249A29FEB3F";

    extraConfig = {
      gpg.format = lib.mkForce "openpgp";
    };
  };
}
