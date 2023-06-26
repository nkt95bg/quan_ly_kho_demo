// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:quan_ly_kho/app/core/utils/common/app_colors.dart';
import 'package:quan_ly_kho/app/core/utils/validator.dart';
import 'package:quan_ly_kho/app/modules/categories_management/widgets/create/create_logic.dart';
import 'package:quan_ly_kho/app/widgets/drop_down/app_dropdown.dart';

import '../../../../widgets/textfields/app_text_field.dart';
import '../common/filled_button.dart';

class CategoryCreateView extends GetView<CategoryCreateLogic> with Validator {
  final bool isCreate;
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final listOptionStatus = [
    const StatusCard(title: 'Vô hiệu hóa'),
    const StatusCard(
      title: 'Có hiệu lực',
      isActived: true,
    )
  ];
  CategoryCreateView({
    Key? key,
    required this.isCreate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 10),
            child: Text(
              isCreate ? 'Tạo danh mục' : 'Chi tiết danh mục',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Form(
                  key: form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hình ảnh mô tả',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: 80,
                              height: 80,
                              child: DottedBorder(
                                color: Colors.black26,
                                radius: const Radius.circular(10),
                                borderType: BorderType.RRect,
                                dashPattern: const [2, 2],
                                child: const Center(
                                    child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.black26,
                                )),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Image(
                            image: AssetImage('assets/images/danhmuc.png'),
                            width: 85,
                            height: 85,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFieldWidget(
                        label: 'Mã danh mục',
                        required: true,
                        initText: controller.category.code,
                        onChanged: (value) {
                          controller.category.code = value;
                        },
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        validator: checkRequired,
                      ),
                      AppDropDownWidget<StatusCard>(
                        label: 'Trạng thái',
                        required: true,
                        onChanged: ((value) {
                          controller.category.status = value?.isActived;
                        }),
                        outline: true,
                        items: List<DropdownMenuItem<StatusCard>>.generate(
                            listOptionStatus.length,
                            (index) => DropdownMenuItem<StatusCard>(
                                  value: listOptionStatus[index],
                                  child: (listOptionStatus[index]),
                                )),
                        value: (controller.category.status != null &&
                                controller.category.status == true)
                            ? listOptionStatus.last
                            : listOptionStatus.first,
                      ),
                      AppTextFieldWidget(
                        label: 'Tên danh mục',
                        required: true,
                        initText: controller.category.name,
                        onChanged: (value) {
                          controller.category.name = value;
                        },
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        validator: checkRequired,
                      ),
                      AppTextFieldWidget(
                        label: 'Nhóm danh mục',
                        required: true,
                        initText: controller.category.group,
                        onChanged: (value) {
                          controller.category.group = value;
                        },
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        validator: checkRequired,
                      ),
                      AppTextFieldWidget(
                        label: 'Đơn vị tính',
                        required: true,
                        initText: controller.category.unit,
                        onChanged: (value) {
                          controller.category.unit = value;
                        },
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        validator: checkRequired,
                      ),
                      AppTextFieldWidget(
                        label: 'Tồn kho',
                        required: true,
                        initText: controller.category.quantity,
                        onChanged: (value) {
                          controller.category.quantity = value;
                        },
                        textInputType: TextInputType.number,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        validator: checkRequired,
                      ),
                      const Text(
                        'Thông tin chi tiết',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppTextFieldWidget(
                        label: 'Thành phần',
                        required: false,
                        initText: controller.category.component,
                        onChanged: (value) {
                          controller.category.component = value;
                        },
                        maxLines: 4,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      AppTextFieldWidget(
                        label: 'Chi tiết',
                        required: false,
                        initText: controller.category.detail,
                        onChanged: (value) {
                          controller.category.detail = value;
                        },
                        maxLines: 4,
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      AppTextFieldWidget(
                          label: 'Cách dùng',
                          required: false,
                          initText: controller.category.usage,
                          onChanged: (value) {
                            controller.category.usage = value;
                          },
                          maxLines: 4,
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          isCreate
                              ? const Expanded(flex: 0, child: SizedBox())
                              : Expanded(
                                  flex: 1,
                                  child: MyFilledButton(
                                    title: 'Xóa',
                                    textColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    borderColor: Colors.black38,
                                    voidCallback: () {
                                      controller.deleteCategory();
                                      EasyLoading.showSuccess(
                                          'Deleted Success!');
                                    },
                                  ),
                                ),
                          SizedBox(
                            width: isCreate ? 0 : 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: MyFilledButton(
                              title: isCreate ? 'Lưu' : 'Chỉnh sửa',
                              backgroundColor: AppColors.primary,
                              voidCallback: () {
                                if (form.currentState!.validate()) {
                                  if (isCreate) {
                                    controller.addCategory()
                                        ? EasyLoading.showSuccess(
                                            'Created success!')
                                        : EasyLoading.showError(
                                            'Duplicate Category!');
                                  } else {
                                    controller.updateCategory();
                                    EasyLoading.showSuccess('Updated success!');
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class StatusCard extends StatelessWidget {
  final String title;
  final bool isActived;
  const StatusCard({
    Key? key,
    required this.title,
    this.isActived = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        color: isActived ? Colors.lightGreen[50] : Colors.red[50],
        border:
            Border.all(color: isActived ? Colors.lightGreen : Colors.redAccent),
      ),
      child: Center(
          child: Text(
        title,
        style: TextStyle(
            color: isActived ? Colors.lightGreen : Colors.redAccent,
            fontWeight: FontWeight.bold,
            fontSize: 14),
      )),
    );
  }
}
