# /nix/overlays/default.nix
final: prev: {
#  just-a-sample = prev.callPackage ./just-a-sample.nix { }; # doesn't work

	# building with bluetooth support
	kdePackages = prev.kdePackages.overrideScope (kfinal: kprev: {
    kdeconnect-kde = kprev.kdeconnect-kde.overrideAttrs (old: {
      buildInputs = old.buildInputs ++ [ kfinal.qtconnectivity ];
      cmakeFlags = (old.cmakeFlags or [ ]) ++ [ "-DBLUETOOTH_ENABLED=ON" ];
    });
  });
}
