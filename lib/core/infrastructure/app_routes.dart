enum AppRoutes {
  home(path: "/"),
  homeV2(path: "/v2"),
  pray(path: "/pray"),
  given(path: "/given"),
  viewer(path: "/viewer");

  const AppRoutes({required this.path});

  final String path;
}