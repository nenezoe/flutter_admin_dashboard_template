import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/hover.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/home/e_com_product.dart';
import 'package:auto_route/annotations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ProductHomeScreen extends StatefulWidget {
  const ProductHomeScreen({super.key});

  @override
  State<ProductHomeScreen> createState() => _ProductHomeScreenState();
}

class _ProductHomeScreenState extends State<ProductHomeScreen> {
  final ValueNotifier<int> _crouselIndex = ValueNotifier<int>(0);
  final List<String> _imageList = [
    Images.offersImage,
    Images.offersImage2,
    Images.offersImage1,
  ];
  final ScrollController _fascrollController = ScrollController();
  final ScrollController _fascrollController1 = ScrollController();
  final ScrollController _bsscrollController = ScrollController();
  final ScrollController _bsscrollController1 = ScrollController();
  final ScrollController _mwscrollController = ScrollController();
  final ScrollController _mwscrollController1 = ScrollController();

  @override
  void dispose() {
    _fascrollController.dispose();
    _fascrollController1.dispose();
    _bsscrollController.dispose();
    _bsscrollController1.dispose();
    _mwscrollController.dispose();
    _mwscrollController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Responsive.isMobile(context) || Responsive.isTablet(context)
              ? Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxHeight: 500),
                      width: double.infinity,
                      child: _crouselSlider(),
                    ),
                    FxBox.h12,
                    Tooltip(
                      message: 'Live For Fashion',
                      child: Image.asset(
                        Images.tempImage,
                        height: 250,
                      ),
                    ),
                    FxBox.h12,
                    Tooltip(
                      message: 'Get Your Style',
                      child: Image.asset(
                        Images.tempImage1,
                        height: 250,
                      ),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: Container(
                        constraints: const BoxConstraints(maxHeight: 500),
                        // width: double.infinity,
                        child: _crouselSlider(),
                      ),
                    ),
                    FxBox.w20,
                    Expanded(
                      child: Column(
                        children: [
                          Tooltip(
                            message: 'Live For Fashion',
                            child: Image.asset(
                              Images.tempImage,
                              height: 250,
                            ),
                          ),
                          FxBox.h32,
                          Tooltip(
                            message: 'Get Your Style',
                            child: Image.asset(
                              Images.tempImage1,
                              height: 250,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
          FxBox.h24,
          _featureProduct(
            list: ecomProduct,
            type: languageModel.landingPage.featuredProducts,
            controller: _fascrollController,
            recontroller: _fascrollController1,
          ),
          FxBox.h24,
          _featureProduct(
            list: ecomProduct,
            type: languageModel.landingPage.bestSelling,
            controller: _bsscrollController,
            recontroller: _bsscrollController1,
          ),
          FxBox.h24,
          Responsive.isMobile(context)
              ? Column(
                  children: [
                    Image.asset(Images.tempImage),
                    FxBox.h32,
                    Image.asset(Images.tempImage1),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(Images.tempImage),
                      ),
                    ),
                    FxBox.w32,
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset(Images.tempImage1),
                      ),
                    ),
                  ],
                ),
          FxBox.h24,
          _featureProduct(
            list: menAndWomanProduct,
            type: languageModel.landingPage.menAndWomanFashion,
            controller: _mwscrollController,
            recontroller: _mwscrollController1,
          ),
          FxBox.h24,
          InkWell(
            onTap: () {},
            child: Image.asset(Images.tempImage2),
          ),
        ],
      ),
    );
  }

  Widget _rightScroll(void Function()? onTap) {
    return Positioned(
      top: 0,
      bottom: 0,
      right: 20,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: isDark ? ColorConst.scaffoldDark : Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 2.0,
                spreadRadius: 0.5,
              )
            ],
          ),
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ),
      ),
    );
  }

  Widget _leftScroll(void Function()? onTap) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 5,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: isDark ? ColorConst.scaffoldDark : Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 2.0,
                spreadRadius: 0.5,
              )
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _featureProduct({
    required String type,
    required ScrollController controller,
    required ScrollController recontroller,
    required List<EcomProduct> list,
  }) {
    final List<EcomProduct> reversedList = list.reversed.toList();
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: ConstText.mediumText(
                text: type,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              thickness: 0.5,
              indent: 10,
              endIndent: 10,
            ),
            FxBox.h12,
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListView.separated(
                      controller: controller,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 24.0,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = list[index];

                        return FxHover(
                          builder: (isHover) {
                            return SizedBox(
                              width: 200,
                              child: _productDesign(
                                currAmount: item.currentAmount!,
                                disAmount: item.discountAmount!,
                                desription: item.description!,
                                imagePath: item.imagePath!,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  _leftScroll(
                    () {
                      setState(
                        () {
                          controller.animateTo(
                            controller.offset - 300,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.linear,
                          );
                        },
                      );
                    },
                  ),
                  _rightScroll(
                    () {
                      setState(() {
                        controller.animateTo(
                          controller.offset + 300,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.linear,
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
            FxBox.h12,
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListView.separated(
                      controller: recontroller,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 24.0,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: reversedList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final item = reversedList[index];

                        return FxHover(
                          builder: (isHover) {
                            return SizedBox(
                              width: 200,
                              child: _productDesign(
                                currAmount: item.currentAmount!,
                                disAmount: item.discountAmount!,
                                desription: item.description!,
                                imagePath: item.imagePath!,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  _leftScroll(
                    () {
                      setState(
                        () {
                          recontroller.animateTo(
                            recontroller.offset - 300,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.linear,
                          );
                        },
                      );
                    },
                  ),
                  _rightScroll(
                    () {
                      setState(() {
                        recontroller.animateTo(
                          recontroller.offset + 300,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.linear,
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productDesign({
    required String imagePath,
    required String disAmount,
    required String currAmount,
    required String desription,
  }) {
    return FxHover(builder: (isHover) {
      return Card(
        child: Stack(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    autoecTabRouter!.setActiveIndex(13);
                  },
                  child: Image.asset(
                    imagePath,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.warning);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Rs$currAmount',
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: 24.0,
                          ),
                          Text(
                            'Rs$disAmount',
                            style: TextStyle(
                                color: isDark
                                    ? ColorConst.errorDark
                                    : const Color(0xFF5b2230),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star_border,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                      Text(
                        desription,
                        maxLines: 2,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            if (isHover) ...[
              Positioned(
                top: 0,
                right: 0,
                child: Column(
                  children: [
                    FxBox.h8,
                    _iconButton(
                      Icons.favorite_border,
                      () {
                        autoecTabRouter!.setActiveIndex(6);
                      },
                    ),
                    FxBox.h8,
                    _iconButton(
                      Icons.shuffle_rounded,
                      () {
                        autoecTabRouter!.setActiveIndex(5);
                      },
                    ),
                    FxBox.h8,
                    _iconButton(
                      Icons.shopping_cart_outlined,
                      () {
                        autoecTabRouter!.setActiveIndex(7);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      );
    });
  }

  Widget _iconButton(IconData iconData, void Function()? onPressed) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 2.0,
            spreadRadius: 0.5,
          )
        ],
        shape: BoxShape.circle,
        color: Colors.white60,
      ),
      child: IconButton(
        icon: Icon(iconData),
        onPressed: onPressed,
        color: ColorConst.black,
      ),
    );
  }

  Widget _crouselSlider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          items: _imageList
              .map(
                (image) => Image.asset(
                  image,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              )
              .toList(),
          options: CarouselOptions(
            viewportFraction: 1.0,
            autoPlay: true,
            initialPage: _crouselIndex.value,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, reason) {
              _crouselIndex.value = index;
            },
          ),
        ),
        Positioned(
          bottom: 24,
          child: SizedBox(
            height: 3,
            child: ValueListenableBuilder<int>(
                valueListenable: _crouselIndex,
                builder: (context, currentIndex, _) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: _imageList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: 30,
                        color: currentIndex == index
                            ? Theme.of(context).primaryColor
                            : ColorConst.white.withOpacity(0.55),
                      );
                    },
                  );
                }),
          ),
        ),
      ],
    );
  }
}
