{inputs, ...}: {
  imports = [
    inputs.agenix.nixosModules.age
  ];

  age.secrets.veselinPassword.file = ./veselinPassword.age;
  age.secrets.tailscaleAuthKey.file = ./tailscaleAuthKey.age;
}
