enum AppAssets {
  logo(path: "assets/logo.png"),
  loading(path: "assets/fire.gif"),
  giveSuccess(path: "assets/pray_check.webp"),
  menuHome(path: "assets/menu_home.webp"),
  menuPray(path: "assets/menu_pray.webp"),
  menuGiven(path: "assets/menu_given.webp"),
  menuViewer(path: "assets/menu_viewer.webp");

  const AppAssets({required this.path});

  final String path;
}