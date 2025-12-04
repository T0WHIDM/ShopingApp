import 'package:flutter_shop_sample/Data/model/variant.dart';
import 'package:flutter_shop_sample/Data/model/variants_type.dart';

class ProductVariant {
  VariantsType variantsType;
  List<Variant> variantList;

  ProductVariant(this.variantList, this.variantsType);
}
