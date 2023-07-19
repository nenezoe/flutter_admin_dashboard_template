import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/widget/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class FooterPage extends StatefulWidget {
  const FooterPage({super.key});

  @override
  State<FooterPage> createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> {
  final List<String> _quicklinkList = [
    languageModel.landingPage.aboutUs,
    languageModel.landingPage.termsConditions,
    languageModel.landingPage.privacyPolicy,
    languageModel.landingPage.deliveryPolicy,
    languageModel.landingPage.cancellationPolicy,
  ];
  final List<String> _accountList = [
    languageModel.landingPage.login,
    languageModel.landingPage.orderHistory,
    languageModel.landingPage.myWishlist,
    languageModel.landingPage.trackOrder,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _upFooter(),
          _downfooter(),
        ],
      ),
    );
  }

  Widget _upFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
      color: ColorConst.footerUpColor,
      width: MediaQuery.of(context).size.width,
      child: isxl(context) || islg(context)
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _logoWithText(),
                _contactInfo(),
                _quickLink(),
                _account(),
              ],
            )
          : Responsive.isTablet(context)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _logoWithText(),
                    FxBox.h24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _contactInfo(),
                        _quickLink(),
                        _account(),
                      ],
                    )
                  ],
                )
              : Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _logoWithText(),
                    FxBox.h24,
                    _contactInfo(),
                    FxBox.h24,
                    _quickLink(),
                    FxBox.h24,
                    _account(),
                  ],
                ),
    );
  }

  Widget _quickLink() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        ConstText.lightText(
          text: languageModel.landingPage.quickLinks,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: ColorConst.white,
        ),
        FxBox.h20,
        Column(
          crossAxisAlignment: Responsive.isMobile(context)
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: _quicklinkList.map((quickLink) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {},
                child: ConstText.lightText(
                  text: quickLink,
                  fontSize: 13,
                  color: Colors.white70,
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _account() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        ConstText.lightText(
          text: languageModel.landingPage.myAccount,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: ColorConst.white,
        ),
        FxBox.h20,
        Column(
          crossAxisAlignment: Responsive.isMobile(context)
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: _accountList.map((account) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: InkWell(
                onTap: () {
                  if (account == languageModel.landingPage.login) {
                    autoecTabRouter!.setActiveIndex(8);
                  } else if (account ==
                      languageModel.landingPage.orderHistory) {
                    autoecTabRouter!.setActiveIndex(12);
                  } else if (account == languageModel.landingPage.myWishlist) {
                    autoecTabRouter!.setActiveIndex(6);
                  } else {
                    autoecTabRouter!.setActiveIndex(11);
                  }
                },
                child: ConstText.lightText(
                  text: account,
                  fontSize: 13,
                  color: Colors.white70,
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget _contactInfo() {
    return Column(
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        ConstText.lightText(
          text: languageModel.landingPage.contactInfo,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: ColorConst.white,
        ),
        FxBox.h20,
        ConstText.lightText(
          text: '${languageModel.landingPage.address}:',
          fontSize: 13,
          color: Colors.white70,
        ),
        const Text(
          'Sarvadhi Solutions Private Limited\n'
          'Surat, Gujarat, India - 395006',
          softWrap: true,
          maxLines: 2,
          style: TextStyle(
            fontSize: 13,
            color: Colors.white70,
          ),
        ),
        FxBox.h12,
        ConstText.lightText(
          text: '${languageModel.landingPage.phone}:',
          fontSize: 13,
          color: Colors.white70,
        ),
        const Text(
          '1800 120 1234',
          softWrap: true,
          maxLines: 2,
          style: TextStyle(
            fontSize: 13,
            color: Colors.white70,
          ),
        ),
        FxBox.h12,
        ConstText.lightText(
          text: '${languageModel.landingPage.email}:',
          fontSize: 13,
          color: Colors.white70,
        ),
        const Text(
          'support@sarvadhi.com',
          softWrap: true,
          maxLines: 2,
          style: TextStyle(
            fontSize: 13,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Widget _logoWithText() {
    return Column(
      mainAxisAlignment: Responsive.isMobile(context)
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      crossAxisAlignment: Responsive.isMobile(context)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          color: ColorConst.transparent,
          child: Image.asset(
            Images.oldlgDarkLogo,
            fit: BoxFit.cover,
          ),
        ),
        FxBox.h16,
        SizedBox(
          width: 300,
          height: 45,
          child: CustomTextField(
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            suffixIcon: FxButton(
              onPressed: () {},
              height: 65,
              borderRadius: 4,
              color: ColorConst.footerButtonRed,
              text: 'Subscribe',
              textColor: ColorConst.white,
            ),
            hintText: 'Your Email Address',
            fillColor: isDark ? ColorConst.scaffoldDark : ColorConst.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        FxBox.h16,
        Row(
          mainAxisAlignment: Responsive.isMobile(context)
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: 140,
                child: Image.asset(Images.playStore),
              ),
            ),
            FxBox.w12,
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: 140,
                child: Image.asset(Images.appStore),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _downfooter() {
    return Container(
      height: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? 120
          : 80,
      color: ColorConst.footerDownColor,
      width: MediaQuery.of(context).size.width,
      child: _footer(),
    );
  }

  Widget _footer() {
    return isxl(context) || islg(context)
        ? Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ConstText.lightText(
                text: '© 2023 Sarvadhi Solutions | All Rights Reserved.',
                color: ColorConst.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              socialButton(),
              ConstText.lightText(
                text: 'Developed by : Sarvadhi Solutions Pvt. Ltd.',
                color: ColorConst.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstText.lightText(
                text: '© 2023 Sarvadhi Solutions | All Rights Reserved.',
                color: ColorConst.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              socialButton(),
              ConstText.lightText(
                text: 'Developed by : Sarvadhi Solutions Pvt. Ltd.',
                color: ColorConst.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ],
          );
  }

  Widget socialButton() {
    return Row(
      mainAxisAlignment:
          Responsive.isMobile(context) || Responsive.isTablet(context)
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
      children: [
        _social(
          onTap: () {},
          imagePath: Images.facebook,
          color: Colors.blueAccent,
        ),
        FxBox.w10,
        _social(
          onTap: () {},
          imagePath: Images.instagram,
        ),
        FxBox.w10,
        _social(
          onTap: () {},
          imagePath: Images.twitter,
        ),
        FxBox.w10,
        _social(
          onTap: () {},
          imagePath: Images.youtube,
        ),
        FxBox.w10,
        _social(
          onTap: () {},
          imagePath: Images.linkedin,
        ),
      ],
    );
  }

  Widget _social({
    void Function()? onTap,
    required String imagePath,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        imagePath,
        height: 20,
        color: color,
      ),
    );
  }
}
