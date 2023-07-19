import 'package:admin_dashboard/src/admin/constant/image.dart';

class EcomProduct {
  String? imagePath;
  String? currentAmount;
  String? discountAmount;
  String? description;

  EcomProduct(
      {this.imagePath,
      this.currentAmount,
      this.discountAmount,
      this.description});
}

final List<EcomProduct> ecomProduct = [
  EcomProduct(
    imagePath: 'assets/images/arm_chair.jpeg',
    currentAmount: '1199',
    discountAmount: '999',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
  EcomProduct(
    imagePath: 'assets/images/b_cup.jpeg',
    currentAmount: '1199',
    discountAmount: '999',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
  EcomProduct(
    imagePath: 'assets/images/bag.jpeg',
    currentAmount: '1199',
    discountAmount: '999',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
  EcomProduct(
    imagePath: 'assets/images/dining_chair.jpeg',
    currentAmount: '1199',
    discountAmount: '999',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
  EcomProduct(
    imagePath: 'assets/images/fancy_bag.jpeg',
    currentAmount: '1199',
    discountAmount: '999',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
  EcomProduct(
    imagePath: 'assets/images/galaxy22.jpeg',
    currentAmount: '1199',
    discountAmount: '999',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
  EcomProduct(
    imagePath: 'assets/images/iphone.jpeg',
    currentAmount: '1199',
    discountAmount: '999',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
  EcomProduct(
    imagePath: 'assets/images/play_game.jpeg',
    currentAmount: '1199',
    discountAmount: '999',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
  EcomProduct(
    imagePath: 'assets/images/samsung_tv.jpeg',
    currentAmount: '1199',
    discountAmount: '999',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
];

final List<EcomProduct> menAndWomanProduct = [
  EcomProduct(
    imagePath: Images.tShirt,
    currentAmount: '1299',
    discountAmount: '1000',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
  EcomProduct(
    imagePath: Images.tShirt1,
    currentAmount: '1099',
    discountAmount: '1000',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
  EcomProduct(
    imagePath: Images.tShirt2,
    currentAmount: '999',
    discountAmount: '899',
    description: 'Cotton Polyester Blend Printed Shirt Fabric (Unstitched)',
  ),
  EcomProduct(
    imagePath: Images.sportwear,
    currentAmount: '2200',
    discountAmount: '2000',
    description: 'Best Selling and Comportable shoes',
  ),
  EcomProduct(
    imagePath: Images.bagCat,
    currentAmount: '2000',
    discountAmount: '1700',
    description: 'Best and Beautifull Bag ',
  ),
  EcomProduct(
    imagePath: Images.makeupCategories,
    currentAmount: '2500',
    discountAmount: '2200',
    description: 'Natural and Sugar free',
  ),
  EcomProduct(
    imagePath: Images.western,
    currentAmount: '2300',
    discountAmount: '2200',
    description: 'Blend Stitched AnarKali Gown',
  ),
  EcomProduct(
    imagePath: Images.flipflop,
    currentAmount: '1000',
    discountAmount: '700',
    description: 'Best Selling and Comportable shoes',
  ),
];
