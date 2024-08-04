import 'package:app/core/repository/given_repository.dart';
import 'package:app/core/repository/main_repository.dart';

typedef OnSuccessCallback = Function(String id);
typedef OnErrorCallback = Function();
typedef OnGetDocCallback = Function(Map<String, dynamic>? data);
typedef OnGetAllCallback = Function(List<Map<String, dynamic>> dataList);
typedef OnQuantityCallback = Function(int quantity);

class AppRepository {
  static MainRepository get main => MainRepository();
  static GivenRepository get given => GivenRepository();
}
