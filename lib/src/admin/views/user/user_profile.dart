import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final List<List<String>> about = [
    ['Phone:', 'Email:', 'Website:', 'Address:', 'Gender:', 'Birth date:'],
    [
      '+91 90817 26354',
      'jane@deo.com',
      'www.jane-deo.com',
      'India',
      'Female',
      'June 1, 1992',
    ],
  ];
  final List<List<String>> social = [
    ['Facebook:', 'Instagram:', 'Linkedin:', 'Twitter:'],
    [
      'https://www.facebook.com/jane.deo',
      'https://www.instagram.com/jane.deo',
      'https://www.linkedin.com/jane.deo',
      'https://www.twitter.com/jane.deo',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!Responsive.isMobile(context))
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.asset(
                          Images.profileImage,
                          fit: BoxFit.cover,
                          height: 144.0,
                          width: 144.0,
                        ),
                      ),
                      FxBox.w24,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Jane Deo',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Managing Director',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: ColorConst.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                if (Responsive.isMobile(context)) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      Images.profileImage,
                      fit: BoxFit.cover,
                      height: 144.0,
                      width: 144.0,
                    ),
                  ),
                  FxBox.h16,
                  const Text(
                    'Jane Deo',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Text(
                    'Managing Director',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: ColorConst.primary,
                    ),
                  ),
                ],
                FxBox.h32,
                MediaQuery.of(context).size.width > 936
                    ? Row(
                        children: [
                          Expanded(child: _detailsWidget('About', about)),
                          Expanded(child: _detailsWidget('Social', social)),
                        ],
                      )
                    : Column(
                        children: [
                          _detailsWidget('About', about),
                          FxBox.h32,
                          _detailsWidget('Social', social),
                        ],
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _detailsWidget(String title, List<List<String>> data) {
    return Column(
      children: [
        _titleWidget(title),
        FxBox.h12,
        ...List.generate(
          data.first.length,
          (index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    data.first.elementAt(index),
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Opacity(
                    opacity: 0.75,
                    child: Text(
                      data.last.elementAt(index),
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _titleWidget(String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            Container(color: ColorConst.primary, width: 12.0, height: 2.0),
            FxBox.w2,
            Container(color: ColorConst.primary, width: 2.0, height: 2.0),
            FxBox.w2,
            Container(color: ColorConst.primary, width: 2.0, height: 2.0),
          ],
        ),
      ],
    );
  }
}
