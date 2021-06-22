{ lib, buildGoModule, fetchFromGitHub, bash, go, python3, ruby }:

buildGoModule rec {
  pname = "slides";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "maaslalani";
    repo = "slides";
    rev = "v${version}";
    sha256 = "0vwpisyvsgmvrzp26hapghgqmm3fhrzrvdnmws00xc2q3fsij9qx";
  };

  checkInputs = [
    bash
    go
    python3
    ruby
  ];

  vendorSha256 = "0y6fz9rw702mji571k0gp4kpfx7xbv7rvlnmpfjygy6lmp7wga6f";

  ldflags = [
    "-s" "-w"
    "-X=main.Version=${version}"
  ];

  meta = with lib; {
    description = "Terminal based presentation tool";
    homepage = "https://github.com/maaslalani/slides";
    license = licenses.mit;
    maintainers = with maintainers; [ maaslalani ];
  };
}
