enum AppAssets {
  logo(path: "assets/logo.webp"),
  logoMenu(path: "assets/logo_menu.webp"),
  loading(path: "assets/fire.gif"),
  giveSuccess(path: "assets/pray_check.webp"),
  homeBackground(path: "assets/home_background.webp");

  const AppAssets({required this.path});

  final String path;
}