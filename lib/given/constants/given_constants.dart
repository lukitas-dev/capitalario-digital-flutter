import 'package:app/core/models/alert_info.dart';
import 'package:app/core/models/field_info.dart';
import 'package:app/core/models/quantity_field_info.dart';
import 'package:app/core/models/quantity_option.dart';
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
          quantityField: QuantityFieldInfo(
              label: "Label Quantitdade",
              optionList: [
                QuantityOption(description: "2", value: 2),
                QuantityOption(description: "5", value: 5),
                QuantityOption(description: "10", value: 10)
              ],
              showDeleteButton:true,
              maxValue: 10,
              hint: "cg"),
          sendTitleButton: "Enviar",
          sendAlert: AlertInfo(
              title: "Título Aqui",
              description: "Descrição aqui",
              button: "OK"))
      .toJson();
}
