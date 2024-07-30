import 'package:app/core/models/alert_info.dart';
import 'package:app/core/models/field_info.dart';
import 'package:app/given/models/given_info.dart';

class GivenConstants {
  static String get infoDefaults => GivenInfo(
          headerImagePath: "",
          fieldList: [
            FieldInfo(
                label: "Label Aqui",
                hint: "Hint aqui",
                optionsList: ["opção A", "opção B", "opção C"])
          ],
          sendTitleButton: "Enviar",
          sendAlert: AlertInfo(
              title: "Título Aqui",
              description: "Descrição aqui",
              button: "OK"))
      .toJson();
}
