import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';

import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  final List<Map<String, dynamic>> categoryData = [
    {
      'imagePath': Images.artDesign,
      'name': Strings.artDesign,
    },
    {
      'imagePath': Images.book,
      'name': Strings.book,
    },
    {
      'imagePath': Images.craft,
      'name': Strings.craft,
    },
    {
      'imagePath': Images.gadgets,
      'name': Strings.gadgets,
    },
    {
      'imagePath': Images.games,
      'name': Strings.game,
    },
    {
      'imagePath': Images.music,
      'name': Strings.music,
    },
    {
      'imagePath': Images.photography,
      'name': Strings.photography,
    },
    {
      'imagePath': Images.sport,
      'name': Strings.sport,
    },
    {
      'imagePath': Images.men,
      'name': Strings.men,
    },
    {
      'imagePath': Images.women,
      'name': Strings.women,
    },
    {
      'imagePath': Images.makeup,
      'name': Strings.makeup,
    },
    {
      'imagePath': Images.shoes,
      'name': Strings.shoe,
    },
    {
      'imagePath': Images.jewellery,
      'name': Strings.jewellery,
    },
    {
      'imagePath': Images.grocery,
      'name': Strings.grocery,
    },
    {
      'imagePath': Images.watch,
      'name': Strings.watch,
    },
    {
      'imagePath': Images.underwearLoungewearAccessories,
      'name': Strings.underwearLoungewearAccessories,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstText.lightText(
            text: languageModel.landingPage.allCategory.toUpperCase(),
            fontWeight: FontWeight.bold,
          ),
          FxBox.h24,
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: Responsive.isMobile(context)
                ? const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 180,
                  )
                : MediaQuery.of(context).size.width < 1500
                    ? const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 180,
                      )
                    : SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width * 0.18,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 180,
                      ),
            itemCount: categoryData.length,
            itemBuilder: (context, index) {
              return _blogBox(
                imagePath: categoryData[index]['imagePath'],
                imageTitle: categoryData[index]['name'],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _blogBox({
    required String imagePath,
    required String imageTitle,
  }) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              height: 90,
              fit: BoxFit.cover,
            ),
            FxBox.h24,
            Tooltip(
              message: imageTitle,
              child: ConstText.lightText(
                text: imageTitle,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
