import 'package:app/viewer/models/box_info.dart';
import 'package:app/viewer/models/grid_info.dart';
import 'package:app/viewer/models/viewer_info.dart';

class ViewerConstants {
  static String get infoDefaults => ViewerInfo(
      toolbarTitle: "Capitalário",
      gridInfo:
          GridInfo(numberOfRows: 5, numberOfColumns: 3, targetDefault: 30),
      boxList: [
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
        BoxInfo(target: 0, imagePath: ""),
      ],
      boxesBackgroundcolor: "#910909",
      orderBoxCompletion: []).toJson();
}
