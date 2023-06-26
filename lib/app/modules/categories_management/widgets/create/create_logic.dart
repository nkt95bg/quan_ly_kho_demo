import 'package:get/get.dart';
import 'package:quan_ly_kho/app/modules/categories_management/categories_management_logic.dart';

import '../../../../data/models/category.dart';
import '../../../../data/services/storage/storage_services.dart';

class CategoryCreateLogic extends GetxController {
  late SCategory category;
  late int selectedIndex;
  final state = Get.find<CategoryManagementLogic>().state;
  // final _store = Get.find<StorageServices>();

  @override
  void onInit() {
    category =
        Get.find<CategoryManagementLogic>().selectedCategory ?? SCategory()
          ..image = '';
    selectedIndex = state.categories.indexOf(category);
    super.onInit();
  }

  bool addCategory() {
    if (category == SCategory() || state.categories.contains(category)) {
      return false;
    }
    Get.back();
    state.categories.add(category);
    return true;
  }

  void updateCategory() {
    Get.back();
    state.categories[selectedIndex] = category;
  }

  void deleteCategory() {
    Get.back();
    state.categories.remove(category);
  }
}
