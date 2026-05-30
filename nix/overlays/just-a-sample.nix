# doen't work
{ stdenv, fetchurl, unzip, autoPatchelfHook, lib, alsa-lib, libGL, fontconfig, freetype }:

stdenv.mkDerivation rec {
  pname = "just-a-sample";
  version = "1.3.2";
  
  src = fetchurl {
    url = "https://github.com/BOBONA/Just-a-Sample/releases/download/v1.3-latest/JAS.Linux.VST3.v1.3.2.zip";
    sha256 = "be092ace689d10285567921978289529f841ca7439ed2a534f36fcb7b3796afb";
  };
  
  nativeBuildInputs = [ unzip autoPatchelfHook ];
  
  # ← Добавили недостающие зависимости
  buildInputs = [ stdenv.cc.cc.lib alsa-lib libGL fontconfig freetype ];
  
  dontConfigure = true;
  dontBuild = true;
  
  installPhase = ''
    mkdir -p $out/lib/vst3
    unzip $src -d $out/lib/vst3/
    mv "$out/lib/vst3/Just a Sample.vst3" "$out/lib/vst3/JustASample.vst3"
  '';  

  meta = {
    description = "Just a Sample — modern open-source audio sampler";
    homepage = "https://bobona.github.io/just-a-sample/";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}
