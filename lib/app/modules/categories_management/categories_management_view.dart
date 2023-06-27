import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quan_ly_kho/app/modules/categories_management/categories_management_logic.dart';
import 'package:quan_ly_kho/app/routes/routes_config.dart';
import 'package:quan_ly_kho/app/widgets/textfields/app_text_field.dart';

import 'widgets/common/card.dart';

class CategorieManagementView extends GetView<CategoryManagementLogic> {
  const CategorieManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<CategoryManagementLogic>();
    final state = logic.state;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Tất cả danh mục',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppTextFieldWidget(
                  onChanged: (value) {
                    controller.filterCategory(value);
                  },
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(Icons.search_outlined),
                  ),
                  hintText: 'Tìm kiếm'),
            ),
            const SizedBox(height: 16),
            Expanded(child: Obx(() {
              var categories = state.resultCategories;
              return ListView.separated(
                itemBuilder: ((context, index) {
                  var category = categories[index];
                  return InkWell(
                      onTap: () {
                        controller.selectedCategory = category;
                        Get.toNamed(
                            '${RouteConfig.category}${RouteConfig.detail}');
                      },
                      child: CategoryCard(category: category));
                }),
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(height: 16),
                itemCount: categories.length,
              );
            }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.selectedCategory = null;
          Get.toNamed('${RouteConfig.category}${RouteConfig.create}');
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
