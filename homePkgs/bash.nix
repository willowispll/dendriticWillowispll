{...}: {
  programs.bash = {
    enable = true;
    initExtra = "
        fastfetch
      ";
  };
}
