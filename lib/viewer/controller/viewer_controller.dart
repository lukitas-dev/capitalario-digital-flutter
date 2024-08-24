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
  int _total = 0;

  Future<void> setup() async {
    await _store.setup((viewerInfo, totalOfGiven) async {
      _info = viewerInfo;
      _prepareLiveBoxes();
      await _processLiveBoxes(totalOfGiven);
    });
  }

  _prepareLiveBoxes() {
    _liveBoxList = [];
    for (var box in _info.boxList) {
      _liveBoxList.add(LiveBox(current: 0, isCompleted: false, boxInfo: box));
    }
  }

  _processLiveBoxes(int totalOfGiven) async {
    _total = totalOfGiven;
    if (_info.orderBoxCompletion.isEmpty ||
        _info.orderBoxCompletion.length < _info.boxList.length) {
      for (var i = 0; i < _liveBoxList.length; i++) {
        _liveBoxList[i] = _proccessBox(i);
      }
    } else {
      for (var i = 0; i < _liveBoxList.length; i++) {
        var index = _info.orderBoxCompletion[i];
        _liveBoxList[index] = _proccessBox(index);
      }
    }
  }

  LiveBox _proccessBox(int index) {
    final liveBox = _liveBoxList[index];
    int target = liveBox.boxInfo.target > 0
        ? liveBox.boxInfo.target
        : _info.gridInfo.targetDefault;
    if (_total >= target) {
      _total = _total - target;
      return LiveBox(
          current: target, isCompleted: true, boxInfo: liveBox.boxInfo);
    } else {
      var current = _total;
      if (_total != 0) {
        _total = 0;
      }
      return LiveBox(
          current: current, isCompleted: false, boxInfo: liveBox.boxInfo);
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

  String getTitle() {
    return "Capitalário";
  }
}
