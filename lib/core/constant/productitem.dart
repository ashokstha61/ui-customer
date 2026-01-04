import 'package:customer_ui/features/customer/model/product_item.dart';

final List<ProductItem> products = [
  ProductItem(
    id: 'P001',
    title: 'CozyCore Knit Sweater',
    variant: 'M / Gray',
    quantity: 1,
    price: 1999,
    image: 'assets/images/sweater.png',
  ),
  ProductItem(
    id: 'P002',
    title: 'NoirFlex Casual Shirt',
    variant: 'L / Gray',
    quantity: 2,
    price: 4098,
    image: 'assets/images/shirt.png',
  ),
  ProductItem(
    id: 'P003',
    title: 'VoltSprint X1',
    variant: 'XL / Gray',
    quantity: 1,
    price: 5970,
    image: 'assets/images/voltshoe.png',
  ),
  ProductItem(
    id: 'P004',
    title: 'UrbanStride Neo',
    variant: 'M / Black',
    quantity: 2,
    price: 8869,
    image: 'assets/images/urbanshoe.png',
  ),
];

final int grandTotal =
        products.fold(0, (sum, item) => sum + item.price);
