import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:quan_ly_kho/app/data/services/storage/storage_services.dart';
import 'package:quan_ly_kho/app/modules/categories_management/categories_management_state.dart';
import 'package:quan_ly_kho/app/data/models/category.dart';

import '../../core/utils/keys.dart';

class CategoryManagementLogic extends GetxController {
  final state = CategoryManagementState();
  final _store = Get.find<StorageServices>();
  SCategory? selectedCategory;

  List<SCategory> readCategories() {
    var categories = <SCategory>[];
    jsonDecode(_store.read(storeCategory).toString())
        .forEach((e) => categories.add(SCategory.fromJson(e)));
    return categories;
  }

  void writeCategory(List<SCategory> categories) {
    _store.write(storeCategory, jsonEncode(categories));
  }

  @override
  void onInit() {
    state.categories.assignAll(readCategories());
    ever(state.categories, (_) => writeCategory(state.categories));
    super.onInit();
  }
}
