enum AppRoutes {
  home(path: "/"),
  pray(path: "/pray"),
  given(path: "/given");

  const AppRoutes({required this.path});

  final String path;
}