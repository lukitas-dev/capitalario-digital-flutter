enum AppAssets {
  logo(path: "assets/logo.png"),
  loading(path: "assets/fire.gif"),
  giveSuccess(path: "assets/pray_check.webp");

  const AppAssets({required this.path});

  final String path;
}