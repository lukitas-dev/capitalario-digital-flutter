enum AppRoutes {
  home(path: "/"),
  pray(path: "/pray"),
  given(path: "/given"),
  viewer(path: "/viewer");

  const AppRoutes({required this.path});

  final String path;
}