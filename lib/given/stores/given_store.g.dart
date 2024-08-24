// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'given_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GivenStore on _GivenStoreBase, Store {
  Computed<CapitalInfo>? _$capitalComputed;

  @override
  CapitalInfo get capital =>
      (_$capitalComputed ??= Computed<CapitalInfo>(() => super.capital,
              name: '_GivenStoreBase.capital'))
          .value;
  Computed<bool>? _$enableSendButtonComputed;

  @override
  bool get enableSendButton => (_$enableSendButtonComputed ??= Computed<bool>(
          () => super.enableSendButton,
          name: '_GivenStoreBase.enableSendButton'))
      .value;

  late final _$stateAtom =
      Atom(name: '_GivenStoreBase.state', context: context);

  @override
  AppState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AppState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: '_GivenStoreBase.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$offerAtom =
      Atom(name: '_GivenStoreBase.offer', context: context);

  @override
  String get offer {
    _$offerAtom.reportRead();
    return super.offer;
  }

  @override
  set offer(String value) {
    _$offerAtom.reportWrite(value, super.offer, () {
      super.offer = value;
    });
  }

  late final _$regionAtom =
      Atom(name: '_GivenStoreBase.region', context: context);

  @override
  String get region {
    _$regionAtom.reportRead();
    return super.region;
  }

  @override
  set region(String value) {
    _$regionAtom.reportWrite(value, super.region, () {
      super.region = value;
    });
  }

  late final _$capitalQuantityAtom =
      Atom(name: '_GivenStoreBase.capitalQuantity', context: context);

  @override
  TextEditingController get capitalQuantity {
    _$capitalQuantityAtom.reportRead();
    return super.capitalQuantity;
  }

  @override
  set capitalQuantity(TextEditingController value) {
    _$capitalQuantityAtom.reportWrite(value, super.capitalQuantity, () {
      super.capitalQuantity = value;
    });
  }

  late final _$showAlertAtom =
      Atom(name: '_GivenStoreBase.showAlert', context: context);

  @override
  bool get showAlert {
    _$showAlertAtom.reportRead();
    return super.showAlert;
  }

  @override
  set showAlert(bool value) {
    _$showAlertAtom.reportWrite(value, super.showAlert, () {
      super.showAlert = value;
    });
  }

  late final _$_GivenStoreBaseActionController =
      ActionController(name: '_GivenStoreBase', context: context);

  @override
  dynamic update(int n) {
    final _$actionInfo = _$_GivenStoreBaseActionController.startAction(
        name: '_GivenStoreBase.update');
    try {
      return super.update(n);
    } finally {
      _$_GivenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$_GivenStoreBaseActionController.startAction(
        name: '_GivenStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$_GivenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOffer(String value) {
    final _$actionInfo = _$_GivenStoreBaseActionController.startAction(
        name: '_GivenStoreBase.setOffer');
    try {
      return super.setOffer(value);
    } finally {
      _$_GivenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRegion(String value) {
    final _$actionInfo = _$_GivenStoreBaseActionController.startAction(
        name: '_GivenStoreBase.setRegion');
    try {
      return super.setRegion(value);
    } finally {
      _$_GivenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
quantity: ${quantity},
offer: ${offer},
region: ${region},
capitalQuantity: ${capitalQuantity},
showAlert: ${showAlert},
capital: ${capital},
enableSendButton: ${enableSendButton}
    ''';
  }
}
