enum AppScreen {
  home(className: 'HomeClass', screenName: 'HomeScreen'),
  pray(className: 'PrayClass', screenName: 'PrayScreen'),
  given(className: 'GivenClass', screenName: 'GivenScreen'),
  viewer(className: 'ViewerClass', screenName: 'ViewerScreen');

  const AppScreen({required this.className, required this.screenName});

  final String className;
  final String screenName;
}