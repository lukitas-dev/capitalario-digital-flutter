import 'package:app/core/constants/constants.dart';
import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/given/models/given_info.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'given_store.g.dart';

typedef GivenSetupCallback = Function(GivenInfo info);

class GivenStore = _GivenStoreBase with _$GivenStore;

abstract class _GivenStoreBase with Store {
  
  @observable
  AppState state = AppState.loading;
  
  @observable
  int quantity = 0;

  @observable
  String offer = "";

  @observable
  TextEditingController capitalQuantity = TextEditingController();
  
  @observable
  bool showAlert = false;


  setup(GivenSetupCallback callback) {
    var json = AppCore.config.getString(AppConstants.givenInfoKey);
    var info = GivenInfo.fromJson(json);
    callback(info);
    state = AppState.ready;
  }

   @action
  update(int n) {
    quantity += n;
    if (quantity < 0) {
      quantity = 0;
    }
    capitalQuantity.text = quantity == 0 ? "" : "${quantity}cg";
  }

  @action
  reset() {
    quantity = 0;
    capitalQuantity.text = "";
  }

  @action
  setOffer(String value) {
    offer = value;
  }

  @computed
  bool get enableSendButton => true;

  
  Future<void> sendCapital() async {
    state = AppState.loading;
   
  }
}
