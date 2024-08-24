enum AppScreen {
  home(className: 'HomeClass', screenName: 'HomeScreen'),
  light(className: 'LightClass', screenName: 'LightScreen'),
  challenges(className: 'ChallengesClass', screenName: 'ChallengesScreen'),
  challengesDetails(className: 'ChallengesDetailsClass', screenName: 'ChallengesDetailsScreen'),
  pray(className: 'PrayClass', screenName: 'PrayScreen'),
  given(className: 'GivenClass', screenName: 'GivenScreen'),
  viewer(className: 'ViewerClass', screenName: 'ViewerScreen'),
  ranking(className: 'RankingClass', screenName: 'RankingScreen');

  const AppScreen({required this.className, required this.screenName});

  final String className;
  final String screenName;
}