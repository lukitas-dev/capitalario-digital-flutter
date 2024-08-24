// ignore_for_file: unused_import

import 'package:app/core/infrastructure/app_assets.dart';
import 'package:app/core/models/alert_info.dart';
import 'package:app/core/models/button_style_info.dart';
import 'package:app/core/models/field_info.dart';
import 'package:app/core/models/field_style_info.dart';
import 'package:app/core/models/quantity_field_info.dart';
import 'package:app/core/models/quantity_option.dart';
import 'package:app/given/models/given_info.dart';

class GivenConstants {
  static String get infoDefaults => GivenInfo(
          toolbarTitle: "Entrega",
          headerImagePath: AppAssets.givenHeaderMob.path,
          regionField: FieldInfo(
              label: "",
              hint: "Selecione o seu regional",
              optionsList: [
                "Sul (Tabor)",
                "Paraná (Missiones)",
                "Sudeste (Coração Tabor)",
                "Nordeste (Sol do Tabor)"
              ]),
          offerField: FieldInfo(
              label: "",
              hint: "Selecione o sua entrega",
              optionsList: [
                "Propósito Jufem a caminho",
                "Leitura do “Dá-nos Luz”",
                "CG 20h 24",
                "Terço",
                "Missa",
                "Dificuldades",
                "Outros"
              ]),
          fieldStyleInfo: FieldStyleInfo(
              arrowColor: "#FFFFFF",
              backgroundColor: "#910909",
              textColor: "#FFFFFF",
              textSize: 18,
              selectionBackgroundColor: "#FFFFFF",
              selectionTextColor: "#000000",
              selectionTextSize: 18),
          quantityField: QuantityFieldInfo(
              label: "",
              optionList: [],
              showDeleteButton: false,
              maxValue: 10,
              hint: "0",
              backgroundColor: "#910909",
              inputBackgroundColor: "#D9D9D9"),
          sendTitleButton: "Enviar",
          sendButtonStyle: ButtonStyleInfo(
              textColor: "#FFFFFF",
              borderColor: "#DA9C3B",
              backgroundColor: "#DA9C3B",
              height: 80,
              borderRadius: 40,
              textFontSize: 30),
          sendAlert: AlertInfo(
              title: "Entrega realizada",
              description:
                  "Seus capitais foram adicionados ao capitalário com sucesso.",
              button: "OK"))
      .toJson();
}
