enum AppAssets {
  logo(path: "assets/logo.png");

  const AppAssets({required this.path});

  final String path;
}