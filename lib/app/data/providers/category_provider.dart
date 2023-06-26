import 'dart:convert';

import 'package:get/get.dart';
import 'package:quan_ly_kho/app/core/utils/keys.dart';
import 'package:quan_ly_kho/app/data/models/category.dart';
import 'package:quan_ly_kho/app/data/services/storage/storage_services.dart';

class CategoryProvider {
  final _store = Get.find<StorageServices>();
  List<SCategory> readCategory() {
    var categories = <SCategory>[];
    jsonDecode(_store.read(storeCategory).toString())
        .forEach((e) => categories.add(SCategory.fromJson(e)));
    return categories;
  }

  void writeCategory(List<SCategory> categories) {
    _store.write(storeCategory, jsonEncode(categories));
  }
}
