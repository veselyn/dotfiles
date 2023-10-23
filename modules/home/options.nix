{lib, ...}: {
  options = with lib; {
    modules.home = {
      user = mkOption {};
    };
  };
}
