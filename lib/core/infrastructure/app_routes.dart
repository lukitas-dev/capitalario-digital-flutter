enum AppRoutes {
  home(path: "/"),
  pray(path: "/pray");

  const AppRoutes({required this.path});

  final String path;
}