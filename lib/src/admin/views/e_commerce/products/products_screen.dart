import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';

import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/products/product.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int tempCategoryIndex = 0;

  List<bool> isColor = [];
  List<String> tempFilterList = [];
  List<bool> iscategory = [];
  final List<String> _categoryList = [
    'All',
    'Electronics',
    'Bags',
    'Home and Kitchen',
    'Accessories',
    'Entertainment',
    'Induction',
  ];
  final List<String> _productColor = [
    'White',
    'Black',
    'Amber',
    'Grey',
    'Yellow',
    'Red',
    'Gold',
    'Pink',
  ];

  List<Map<String, dynamic>> _filterList = [];

  bool isFilter = false;

  @override
  void initState() {
    isColor.clear();
    iscategory.clear();
    for (var data in _productColor) {
      isColor.add(false);
    }

    for (int i = 0; i < _productColor.length; i++) {
      if (i == 0) {
        iscategory.add(true);
      } else {
        iscategory.add(false);
      }
    }
    super.initState();
  }

  RangeValues rangeValue = const RangeValues(0, 500);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !Responsive.isMobile(context) ? const SizedBox.shrink() : _filterUi(),
        FxBox.h16,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isFilter
                ? _filterList.isEmpty
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Center(
                              child: CustomText(title: 'No data found'),
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: isFilter
                                ? _filterList.length
                                : productList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: Responsive.isMobile(context)
                                  ? 1
                                  : Responsive.isTablet(context)
                                      ? 2
                                      : islg(context)
                                          ? 2
                                          : MediaQuery.of(context).size.width ==
                                                      1303 ||
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      1310
                                              ? 3
                                              : isxl(context)
                                                  ? 4
                                                  : 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              mainAxisExtent:
                                  Responsive.isWeb(context) ? 390 : 426,
                            ),
                            itemBuilder: (context, index) {
                              return _cardUI(index);
                            }),
                      )
                : Expanded(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount:
                            isFilter ? _filterList.length : productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: Responsive.isMobile(context)
                              ? 1
                              : Responsive.isTablet(context)
                                  ? 2
                                  : islg(context)
                                      ? 2
                                      : MediaQuery.of(context).size.width ==
                                                  1303 ||
                                              MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  1310
                                          ? 3
                                          : isxl(context)
                                              ? 4
                                              : 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          mainAxisExtent: Responsive.isWeb(context)
                              ? 390
                              : Responsive.isMobile(context)
                                  ? 380
                                  : 426,
                        ),
                        itemBuilder: (context, index) {
                          return _cardUI(index);
                        }),
                  ),
            FxBox.w16,
            Responsive.isMobile(context)
                ? const SizedBox.shrink()
                : _filterUi(),
          ],
        ),
      ],
    );
  }

  Widget _filterUi() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        constraints:
            BoxConstraints(maxWidth: Responsive.isMobile(context) ? 400 : 250),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _filterHeader(),
            Divider(color: Colors.grey.shade300),
            FxBox.h10,
            _priceRange(),
            FxBox.h32,
            _brandFilter(),
            FxBox.h32,
            _colorFilter(),
          ],
        ),
      ),
    );
  }

  Widget _colorFilter() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            title: languageModel.eCommerceWeb.colors,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        FxBox.h10,
        ListView.builder(
          shrinkWrap: true,
          itemCount: _productColor.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Checkbox(
                  activeColor: ColorConst.primary,
                  checkColor: ColorConst.white,
                  value: isColor[index],
                  onChanged: (value) {
                    if (value == true) {
                      isColor[index] = true;
                    } else {
                      isColor[index] = false;
                    }
                    setState(() {});
                  },
                ),
                CustomText(
                  title: _productColor[index],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _brandFilter() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            title: languageModel.eCommerceAdmin.category.trim(),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        FxBox.h10,
        ListView.builder(
          shrinkWrap: true,
          itemCount: _categoryList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Checkbox(
                  activeColor: ColorConst.primary,
                  checkColor: ColorConst.white,
                  value: iscategory[index],
                  onChanged: (value) {
                    _filterList.clear();

                    List<Map<String, dynamic>> tempList = [];
                    List<Map<String, dynamic>> tempList1 = [];

                    if (value == true) {
                      if (_categoryList[index] == 'All') {
                        iscategory[index] = true;
                        setState(() {
                          _filterList =
                              List<Map<String, dynamic>>.from(productList);
                        });
                      } else {
                        iscategory[0] = false;

                        tempFilterList.add(_categoryList[index]);
                        iscategory[index] = true;
                        tempCategoryIndex = index;

                        tempList1.clear();
                        _filterList.clear();
                        setState(() {});
                        for (int i = 0; i < tempFilterList.length; i++) {
                          tempList = productList.where(
                            (e) {
                              return e['category'] == tempFilterList[i];
                            },
                          ).toList();
                          tempList1.addAll(tempList);

                          _filterList = tempList1;
                          setState(() {});
                        }

                        isFilter = true;
                      }
                    } else {
                      tempFilterList.remove(_categoryList[index]);
                      iscategory[index] = false;

                      if (tempFilterList.isEmpty) {
                        iscategory[0] = true;
                        _filterList.clear();
                        setState(() {
                          _filterList =
                              List<Map<String, dynamic>>.from(productList);
                        });
                      } else {
                        tempList1 = [];
                        _filterList = [];
                        setState(() {});
                        for (int i = 0; i < tempFilterList.length; i++) {
                          tempList = productList.where(
                            (element) {
                              return element['category']
                                  .toString()
                                  .contains(tempFilterList[i]);
                            },
                          ).toList();
                          tempList1.addAll(tempList);

                          _filterList = tempList1;
                          setState(() {});
                        }
                      }
                    }
                    setState(() {});
                  },
                ),
                CustomText(
                  title: _categoryList[index],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _priceRange() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            title: languageModel.eCommerceWeb.priceRange,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        FxBox.h10,
        RangeSlider(
          values: rangeValue,
          min: 0.0,
          max: 500.0,
          activeColor: ColorConst.primary,
          onChanged: (value) {
            isFilter = true;
            _filterList = productList
                .where((element) =>
                    element['price'] > rangeValue.start &&
                    element['price'] < rangeValue.end)
                .toList();

            setState(() {
              rangeValue = value;
            });
          },
        ),
        FxBox.h10,
        Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
            title:
                '\$ ${rangeValue.start.toString().split('.')[0]} - \$ ${rangeValue.end.toString().split('.')[0]}',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _filterHeader() {
    return Row(
      children: [
        Image.asset(
          Images.filter,
          width: 20,
          color: isDark ? ColorConst.white : ColorConst.black,
        ),
        FxBox.w10,
        CustomText(
          title: languageModel.eCommerceWeb.filter,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }

  Widget _cardUI(int index) {
    return GestureDetector(
      onTap: () {
        autoTabRouter!.setActiveIndex(39);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                _filterList.isNotEmpty
                    ? _filterList[index]['image']
                    : productList[index]['image'],
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
                        title: _filterList.isNotEmpty
                            ? _filterList[index]['title']
                            : productList[index]['title'],
                        fontSize: 16.0,
                        maxLine: 2,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    CustomText(
                      title: _filterList.isNotEmpty
                          ? _filterList[index]['rating']
                          : productList[index]['rating'],
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
              FxBox.h12,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    CustomText(
                      title:
                          '${_filterList.isNotEmpty ? _filterList[index]['price'] : productList[index]['price']} \$',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    const Spacer(),
                    _iconBox(
                      icon: Icons.add_shopping_cart_outlined,
                      onPressed: () {},
                      color: ColorConst.grey800,
                    ),
                    FxBox.w10,
                    _iconBox(
                      color: ColorConst.errorDark,
                      icon: _iconChoose(index),
                      onPressed: () {
                        if (_filterList.isNotEmpty) {
                          _filterList[index]['isFavourite'] =
                              !_filterList[index]['isFavourite'];
                        } else {
                          productList[index]['isFavourite'] =
                              !productList[index]['isFavourite'];
                        }
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _iconChoose(int index) {
    if (_filterList.isNotEmpty) {
      return _filterList[index]['isFavourite']
          ? Icons.favorite_outlined
          : Icons.favorite_border_outlined;
    } else {
      return productList[index]['isFavourite']
          ? Icons.favorite_outlined
          : Icons.favorite_border_outlined;
    }
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
