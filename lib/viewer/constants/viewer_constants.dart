import 'package:app/viewer/models/box_info.dart';
import 'package:app/viewer/models/grid_info.dart';
import 'package:app/viewer/models/viewer_info.dart';

class ViewerConstants {
  static String get infoDefaults => ViewerInfo(
      gridInfo: GridInfo(
        numberOfRows: 3, 
        numberOfColumns: 3, 
        targetDefault: 30),
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
      ],
      boxesBackgroundcolor: "#F21D1D",
      orderBoxCompletion: []).toJson();
}
