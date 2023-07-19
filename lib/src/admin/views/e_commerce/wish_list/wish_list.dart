import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/wish_list/products.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          languageModel.landingPage.wishlist,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        FxBox.h24,
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: productsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context)
                  ? 1
                  : Responsive.isTablet(context)
                      ? 2
                      : islg(context)
                          ? 2
                          : MediaQuery.of(context).size.width == 1303 ||
                                  MediaQuery.of(context).size.width < 1310
                              ? 3
                              : isxl(context)
                                  ? 4
                                  : 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              mainAxisExtent: 440,
            ),
            itemBuilder: (context, index) {
              return _cardUI(index);
            })
      ],
    );
  }

  Widget _cardUI(int index) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            // color: ColorConst.white,
            // borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: ColorConst.primary.withOpacity(0.1),
                blurRadius: 5.0,
                offset: const Offset(0.0, 5.0),
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                productsList[index]['image'],
                fit: BoxFit.contain,
                height: 250.0,
                width: double.infinity,
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomText(
                        title: productsList[index]['title'],
                        fontSize: 16.0,
                        maxLine: 2,
                        //textColor: ColorConst.black,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    CustomText(
                      title: productsList[index]['rating'],
                      //textColor: ColorConst.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 15,
                    ),
                  ],
                ),
              ),
              FxBox.h8,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomText(
                  title: '${productsList[index]['price']} \$',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  textColor:
                      isDark ? ColorConst.errorDark : ColorConst.priceColor,
                ),
              ),
              FxBox.h12,
              const Divider(height: 0.0),
              FxBox.h12,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    _iconBox(
                      color: ColorConst.black,
                      icon: Icons.delete_outline,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    FxButton(
                      icon: const Icon(Icons.shopping_cart_outlined),
                      borderRadius: 4.0,
                      onPressed: () {
                        autoecTabRouter!.setActiveIndex(7);
                      },
                      text: 'Add to cart',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconBox({
    required void Function()? onPressed,
    required IconData icon,
    Color? color,
  }) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
