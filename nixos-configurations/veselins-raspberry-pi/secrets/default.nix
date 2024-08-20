{inputs, ...}: {
  imports = [
    inputs.agenix.nixosModules.age
  ];

  age.secrets.veselinPassword.file = ./veselinPassword.age;
}
