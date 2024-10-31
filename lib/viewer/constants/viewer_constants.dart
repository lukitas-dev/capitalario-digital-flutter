import 'package:app/viewer/models/box_info.dart';
import 'package:app/viewer/models/grid_info.dart';
import 'package:app/viewer/models/viewer_info.dart';

class ViewerConstants {
  static String get infoDefaults => ViewerInfo(
      toolbarTitle: "Capitalário",
      gridInfo:
          GridInfo(numberOfRows: 5, numberOfColumns: 3, targetDefault: 1200),
      boxList: [
        BoxInfo(target: 0, imagePath: "row-1-column-1.webp"),
        BoxInfo(target: 0, imagePath: "row-1-column-2.webp"),
        BoxInfo(target: 0, imagePath: "row-1-column-3.webp"),
        BoxInfo(target: 0, imagePath: "row-2-column-1.webp"),
        BoxInfo(target: 0, imagePath: "row-2-column-2.webp"),
        BoxInfo(target: 0, imagePath: "row-2-column-3.webp"),
        BoxInfo(target: 0, imagePath: "row-3-column-1.webp"),
        BoxInfo(target: 0, imagePath: "row-3-column-2.webp"),
        BoxInfo(target: 0, imagePath: "row-3-column-3.webp"),
        BoxInfo(target: 0, imagePath: "row-4-column-1.webp"),
        BoxInfo(target: 0, imagePath: "row-4-column-2.webp"),
        BoxInfo(target: 0, imagePath: "row-4-column-3.webp"),
        BoxInfo(target: 0, imagePath: "row-5-column-1.webp"),
        BoxInfo(target: 0, imagePath: "row-5-column-2.webp"),
        BoxInfo(target: 0, imagePath: "row-5-column-3.webp"),
      ],
      boxesBackgroundcolor: "#910909",
      orderBoxCompletion: []).toJson();
}
