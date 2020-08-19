{
  pkgs
}:
  with pkgs;
  stdenv.mkDerivation {
    name = "test";
    buildInputs = [
      php72
    ] ++ (with php72Packages; [
      composer
    ]);
    services.nginx.enable = true;
    services.nginx.virtualHosts."myhost.org" = {
        addSSL = true;
        enableACME = true;
        root = "/var/www/myhost.org";
    };

  }