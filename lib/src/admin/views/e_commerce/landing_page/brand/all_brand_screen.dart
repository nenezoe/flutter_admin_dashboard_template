import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/brand/brand.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class AllBrandScreen extends StatefulWidget {
  const AllBrandScreen({super.key});

  @override
  State<AllBrandScreen> createState() => _AllBrandScreenState();
}

class _AllBrandScreenState extends State<AllBrandScreen> {
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
            text: languageModel.landingPage.allBrand.toUpperCase(),
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
            itemCount: allBrandCloth.length,
            itemBuilder: (context, index) {
              return _blogBox(
                imagePath: allBrandCloth[index]['imagePath'],
                imageTitle: allBrandCloth[index]['name'],
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
