import 'package:get/get.dart';

import 'create_logic.dart';

class CategoryCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryCreateLogic());
  }
}
