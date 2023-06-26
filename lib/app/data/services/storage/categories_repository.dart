// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:quan_ly_kho/app/data/models/category.dart';
import 'package:quan_ly_kho/app/data/providers/category_provider.dart';

class CategoryRepository {
  CategoryProvider provider;
  CategoryRepository({
    required this.provider,
  });
  List<SCategory> readCategories() => provider.readCategory();
  void writeCategory(List<SCategory> categories) =>
      provider.writeCategory(categories);
}
