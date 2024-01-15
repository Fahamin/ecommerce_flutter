

import 'package:ecommerce_flutter/model/product/product_model.dart';
import 'package:ecommerce_flutter/repository/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider =
FutureProvider.family<List<ProductModelByCategory>,int>((ref, cat) async {
  //NewsRepository newsRepository = NewsRepository();
  return ProductRepository().getProductByCategory(cat);
});