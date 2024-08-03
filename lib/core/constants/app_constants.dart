class AppConstants {
  ConfigConstants get config => ConfigConstants();
  MenuConstants get menu => MenuConstants();
  CollectionConstants get collections => CollectionConstants();
  DocumentConstants get documents => DocumentConstants();
}

class ConfigConstants {
  String get homeInfo => "homeInfo";
  String get prayInfo => "prayInfo";
  String get givenInfo => "givenInfo";
  String get viewerInfo => "viewerInfo";
}

class MenuConstants {
  String get pray => "Oração";
  String get given => "Entrega";
  String get viewer => "Visualizar";
}

class CollectionConstants {
  String get main => "CapitalarioDigital";
  String get given => "GivenCapital";
}

class DocumentConstants {
  String get status => "status";
}
