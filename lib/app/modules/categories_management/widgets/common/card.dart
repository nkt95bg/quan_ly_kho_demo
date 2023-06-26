import 'package:flutter/material.dart';

import '../../../../data/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  final SCategory category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(5),
              child: Image(
                image: AssetImage('assets/images/danhmuc.png'),
                height: 60,
                width: 60,
              ),
            ),
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mã sản phẩm: ${category.code}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Tên sản phẩm: ${category.name}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                        // overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Loại sản phẩm: ${category.group}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Số lượng: ${category.quantity} ${category.unit}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(
                flex: 1,
                child: SizedBox(
                    child: Center(
                        child: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )))),
          ],
        ),
      ),
    );
  }
}
