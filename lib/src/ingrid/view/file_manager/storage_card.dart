import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterx/flutterx.dart';

class StorageCard extends StatelessWidget {
  const StorageCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> storageBox = [
      {
        'storageIcon': ConstIcons.drive,
        'storageName': ConstString.googleDrive,
        'precentageColor': ConstColor.yellow,
      },
      {
        'storageIcon': ConstIcons.onedrive,
        'storageName': ConstString.oneDrive,
        'precentageColor': ConstColor.primary,
      },
      {
        'storageIcon': ConstIcons.dropbox,
        'storageName': ConstString.dropBox,
        'precentageColor': ConstColor.redAccent,
      },
      {
        'storageIcon': ConstIcons.icloud,
        'storageName': ConstString.iCloud,
        'precentageColor': ConstColor.cyan,
      },
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _crossAxisCount(context),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: 235,
      ),
      itemCount: storageBox.length,
      itemBuilder: (context, index) {
        return StorageBox(
          percentageColor: storageBox[index]['precentageColor'],
          storageIcon: storageBox[index]['storageIcon'],
          storageName: storageBox[index]['storageName'],
        );
      },
    );
  }

  int _crossAxisCount(BuildContext context) {
    if (IngridResponsive.isLargeWeb(context)) {
      return 4;
    } else if (IngridResponsive.isMediumWeb(context) ||
        IngridResponsive.isSmallWeb(context)) {
      return 2;
    } else if (IngridResponsive.isTablet(context)) {
      return 1;
    } else {
      return 1;
    }
  }
}

class StorageBox extends StatelessWidget {
  const StorageBox({
    super.key,
    required this.storageIcon,
    required this.storageName,
    required this.percentageColor,
  });
  final String storageIcon;
  final String storageName;
  final Color percentageColor;

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(storageIcon),
              FxBox.w24,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ConstString.storage,
                      style: ConstTheme.text(context),
                    ),
                    FxBox.h10,
                    Tooltip(
                      message: storageName,
                      child: Text(
                        storageName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ConstTheme.text(context).copyWith(
                            fontWeight: FontWeight.w700, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
              const SvgIcon(
                icon: ConstIcons.menu,
                color: ConstColor.hintColor,
              ),
            ],
          ),
          FxBox.h40,
          Text(
            ConstString.total,
            style: ConstTheme.text(context),
          ),
          FxBox.h8,
          Text(
            '25 GB / 50GB',
            style: ConstTheme.text(context)
                .copyWith(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          FxBox.h12,
          CustomeSlider(
            percentageColor: percentageColor,
          ),
        ],
      ),
    );
  }
}

class CustomeSlider extends StatelessWidget {
  const CustomeSlider({
    super.key,
    required this.percentageColor,
    this.percentage,
  });
  final Color percentageColor;
  final double? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8.0,
          width: 300.0,
          decoration: BoxDecoration(
            color: ConstColor.lightGray,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        Container(
          height: 8.0,
          width: percentage ?? 150.0,
          decoration: BoxDecoration(
            color: percentageColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ],
    );
  }
}
