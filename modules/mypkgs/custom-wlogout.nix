{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "custom-wlogout";
  src = /home/Surtsev/.config/wlogout;

  installPhase = ''
    # Копирование исполняемого файла
    mkdir -p $out/bin
    cp ./my-wlogout $out/bin/custom-wlogout
    chmod +x $out/bin/custom-wlogout

    # Копирование ресурсов
    mkdir -p $out/share/wlogout
    cp -v ./layout $out/share/wlogout/layout              # Копируем layout
    cp -v ./style.css $out/share/wlogout/style.css        # Копируем стили
    cp -rv ./icons $out/share/wlogout/icons              # Копируем иконки (рекурсивно)

    # Создание конфига с относительными путями
    cat > $out/share/wlogout/config <<EOF
    [config]
    layout=./layout
    css=./style.css
    icons=./icons
    EOF
  '';
}
