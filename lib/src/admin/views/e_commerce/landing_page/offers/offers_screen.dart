import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/offers/offers.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
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
            text: languageModel.landingPage.offers.toUpperCase(),
            fontWeight: FontWeight.bold,
          ),
          FxBox.h24,
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
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
                        mainAxisExtent: 400,
                      ),
            itemCount: allOffers.length,
            itemBuilder: (context, index) {
              return _blogBox(
                imagePath: allOffers[index]['imagePath'],
                imageTitle: allOffers[index]['name'],
                offers: allOffers[index]['offers'],
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
    required String offers,
  }) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 50,
            child: Column(
              children: [
                ConstText.lightText(
                  text: imageTitle,
                  fontWeight: FontWeight.bold,
                  color: ColorConst.white,
                ),
                ConstText.lightText(
                  text: offers,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: ColorConst.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
