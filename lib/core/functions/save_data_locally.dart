import 'package:ecommerce_app/core/utils/constant.dart';
import 'package:hive_flutter/hive_flutter.dart';

saveDataLocally({required String key, required String value}) async {
  Hive.box(Constants.tokenBox).put(key, value);
}
