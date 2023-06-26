// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SCategory extends Equatable {
  String? image;
  String? code;
  bool? status;
  String? name;
  String? group;
  String? unit;
  String? quantity;
  String? component;
  String? detail;
  String? usage;

  SCategory({
    this.image,
    this.code,
    this.status,
    this.name,
    this.group,
    this.unit,
    this.quantity,
    this.component,
    this.detail,
    this.usage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'code': code,
      'status': status,
      'name': name,
      'group': group,
      'unit': unit,
      'quantity': quantity,
      'component': component ?? '',
      'detail': detail ?? '',
      'usage': usage ?? '',
    };
  }

  factory SCategory.fromMap(Map<String, dynamic> map) {
    return SCategory(
      image: map['image'] as String,
      code: map['code'] as String,
      status: map['status'] as bool,
      name: map['name'] as String,
      group: map['group'] as String,
      unit: map['unit'] as String,
      quantity: map['quantity'] as String,
      component: map['component'] as String,
      detail: map['detail'] as String,
      usage: map['usage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SCategory.fromJson(String source) =>
      SCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [code];
}
