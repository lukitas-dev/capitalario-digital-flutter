enum AppRoutes {
  home(path: "/"),
  givenUsLight(path: "/givenUsLight"),
  challenges(path: "/challenges"),
  pray(path: "/pray"),
  given(path: "/given"),
  viewer(path: "/viewer"),
  ranking(path: "/ranking");

  const AppRoutes({required this.path});

  final String path;
}
