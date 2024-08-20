{options, ...}: {
  age.identityPaths =
    options.age.identityPaths.default
    ++ [
      "/etc/ssh/id_ed25519"
      "/etc/ssh/id_rsa"
    ];
}
