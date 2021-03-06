FROM nixos/nix

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
RUN nix-channel --update

RUN nix-build -A pythonFull '<nixpkgs>'

RUN nix-env -iA nixpkgs.niv

COPY index.html /usr/share/nginx/html/index.html
COPY default.nix /default.nix

RUN nix-build .