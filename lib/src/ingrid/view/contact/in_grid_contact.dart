import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class InGridContactScreen extends StatefulWidget {
  const InGridContactScreen({super.key});

  @override
  State<InGridContactScreen> createState() => _InGridContactScreenState();
}

class _InGridContactScreenState extends State<InGridContactScreen> {
  int pageIndex = 0;
  final List<Map<String, dynamic>> _contactList = [
    {
      'name': 'John Doe',
      'profession': 'UI Designer',
    },
    {
      'name': 'Samantha William',
      'profession': 'UI Designer',
    },
    {
      'name': 'Tony Soap',
      'profession': 'Web Developer',
    },
    {
      'name': 'Karen Hope',
      'profession': 'Android Developer',
    },
    {
      'name': 'Tatang Wijaya',
      'profession': 'QA Engineer',
    },
    {
      'name': 'Johnny Ahmad',
      'profession': 'Product Owner',
    },
    {
      'name': 'Jordan Nico',
      'profession': 'Product Manager',
    },
    {
      'name': 'Budi Prabowo',
      'profession': 'ios Developer',
    },
    {
      'name': 'Nadila Adja',
      'profession': 'Graphic Designer',
    },
    {
      'name': 'Azizi Azazel',
      'profession': 'UX Engineer',
    },
    {
      'name': 'Angelina Crispy',
      'profession': 'Software Engineering',
    },
    {
      'name': 'Ipi Antoinette',
      'profession': 'VP Product',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            FxBox.h24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const RouteTitle(),
                MaterialButton(
                  height: 50,
                  minWidth: 210,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  color: ConstColor.primary,
                  onPressed: () {},
                  child: ConstText.largeText(
                    text: ConstString.addContact,
                    fontSize: 16,
                    color: ConstColor.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            FxBox.h28,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _contactList.length,
                gridDelegate: Responsive.isMobile(context)
                    ? const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 45,
                        mainAxisSpacing: 45,
                        mainAxisExtent: 350,
                      )
                    : Responsive.isTablet(context)
                        ? const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 45,
                            mainAxisSpacing: 45,
                            mainAxisExtent: 350,
                          )
                        : MediaQuery.of(context).size.width < 1500
                            ? SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent:
                                    MediaQuery.of(context).size.width * 0.24,
                                crossAxisSpacing: 45,
                                mainAxisSpacing: 45,
                                mainAxisExtent: 350,
                              )
                            : SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent:
                                    MediaQuery.of(context).size.width * 0.24,
                                crossAxisSpacing: 45,
                                mainAxisSpacing: 45,
                                mainAxisExtent: 350,
                              ),
                itemBuilder: (context, index) {
                  return _contactUi(
                      name: _contactList[index]['name'],
                      profession: _contactList[index]['profession']);
                },
              ),
            ),
            FxBox.h60,
            Responsive.isMobile(context) || Responsive.isTablet(context)
                ? Column(
                    children: [
                      ConstText.lightText(
                        text: 'Showing ${pageIndex + 1} of 240 data',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff98A4B5),
                      ),
                      FxBox.h32,
                      _button(),
                    ],
                  )
                : _bottomFooter(),
            SafeArea(child: FxBox.h24),
          ],
        ),
      ),
    );
  }

  Widget _bottomFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ConstText.lightText(
          text: 'Showing ${pageIndex + 1} of 240 data',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xff98A4B5),
        ),
        _button(),
        const SizedBox(width: 150),
      ],
    );
  }

  Widget _button() {
    return SizedBox(
      height: 32,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                pageIndex = index;

                setState(() {});
              },
              child: Container(
                height: 32,
                width: 32,
                margin: const EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                  color: pageIndex == index
                      ? ConstColor.blueAccent
                      : ConstColor.white,
                  border: Border.all(color: ConstColor.blueAccent),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                alignment: Alignment.center,
                child: ConstText.lightText(
                  text: '${index + 1}',
                  textAlign: TextAlign.center,
                  fontSize: 16,
                  color: pageIndex != index
                      ? ConstColor.blueAccent
                      : ConstColor.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }),
    );
  }

  Widget _contactUi({
    required String name,
    required String profession,
  }) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
      decoration: BoxDecoration(
          color:
              context.isDarkMode ? ConstColor.darkFillColor : ColorConst.white,
          borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: ConstColor.lightGray,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.asset(
                    Images.profileImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Icon(
                Icons.more_horiz,
                color: ConstColor.lightGray,
              ),
            ],
          ),
          FxBox.h24,
          ConstText.lightText(
            text: name,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          FxBox.h8,
          ConstText.lightText(
            text: profession,
            fontSize: 14,
            color: ConstColor.lightGray,
            fontWeight: FontWeight.w400,
          ),
          FxBox.h24,
          _iconWithText(
              imagePath: ConstIcons.briefcase, text: 'Peterdraw Studio'),
          FxBox.h28,
          _iconWithText(imagePath: ConstIcons.contact, text: '+123 456 789'),
          FxBox.h28,
          _iconWithText(imagePath: ConstIcons.email, text: 'email@mail.com'),
          FxBox.h24,
        ],
      ),
    );
  }

  Widget _iconWithText({
    required String imagePath,
    required String text,
  }) {
    return Row(
      children: [
        SvgIcon(
          icon: imagePath,
          color: ConstColor.blueAccent,
        ),
        FxBox.w16,
        ConstText.lightText(
          text: text,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
