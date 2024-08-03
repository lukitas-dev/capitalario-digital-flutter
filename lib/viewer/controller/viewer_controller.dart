import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/viewer/models/live_box.dart';
import 'package:app/viewer/models/viewer_info.dart';
import 'package:app/viewer/stores/viewer_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ViewerController {
  final ViewerStore _store = ViewerStore();
  late ViewerInfo _info;
  late List<LiveBox> _liveBoxList;

  void setup() {
    _store.setup((viewerInfo, totalOfGiven) async {
      _info = viewerInfo;
      await _processLiveBoxes(totalOfGiven);
    });
  }

  _processLiveBoxes(int totalOfGiven) async {
    _liveBoxList = [];
    int total = totalOfGiven;
    for (var box in _info.boxList) {
      int target = box.target > 0 ? box.target : _info.gridInfo.targetDefault;
      if (total >= target) {
        total = total - target;
        _liveBoxList
            .add(LiveBox(current: target, isCompleted: true, boxInfo: box));
      } else {
        _liveBoxList
            .add(LiveBox(current: total, isCompleted: false, boxInfo: box));
        if (total != 0) {
          total = 0;
        }
      }
    }
  }

  Widget buildBoxes() {
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _info.gridInfo.numberOfColumns,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0),
        itemCount: _liveBoxList.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredGrid(
              position: index,
              columnCount: _info.gridInfo.numberOfColumns,
              duration: const Duration(milliseconds: 1500),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: _buildBox(_liveBoxList[index]),
                ),
              ));
        });
  }

  Widget _buildBox(LiveBox liveBox) {
    return Card(
      child: Container(
        width: 100.0,
        height: 100.0,
        color: liveBox.isCompleted
            ? Colors.transparent
            : AppCore.infra.colors.fromHex(_info.boxesBackgroundcolor),
        child: liveBox.isCompleted
            ? _showImage(liveBox)
            : _showImageWithOpacity(liveBox),
      ),
    );
  }

  Widget _showImage(LiveBox liveBox) {
    return liveBox.boxInfo.imagePath.isNotEmpty
        ? Image.asset(
            "assets/${liveBox.boxInfo.imagePath}",
            fit: BoxFit.fill,
          )
        : const Icon(Icons.image);
  }

  Widget _showImageWithOpacity(LiveBox liveBox) {
    int target = liveBox.boxInfo.target > 0
        ? liveBox.boxInfo.target
        : _info.gridInfo.targetDefault;
    var opacity = liveBox.current / target;
    return liveBox.current > 0
        ? Opacity(
            opacity: opacity,
            child: liveBox.boxInfo.imagePath.isNotEmpty
                ? Image.asset(
                    "assets/${liveBox.boxInfo.imagePath}",
                    fit: BoxFit.fill,
                  )
                : Container(),
          )
        : Container();
  }

  AppState getState() {
    return _store.state;
  }
}
