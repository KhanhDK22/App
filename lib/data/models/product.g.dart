// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      price: (json['Price'] as num?)?.toDouble(),
      quantity: json['Quantity'] as int?,
      productName: json['ProductName'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'Price': instance.price,
      'Quantity': instance.quantity,
      'ProductName': instance.productName,
      'imagePath': instance.imagePath,
    };
