import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final List<Map<String, dynamic>> _blogData = [
    {
      'blog_poster': 'assets/images/t-shirt_ward1.jpeg',
      'blog_name': languageModel.landingPage.blogTitle,
      'blog_des': '${languageModel.landingPage.blogText1}'
          '${languageModel.landingPage.blogText2}'
          '${languageModel.landingPage.blogText3}',
    },
    {
      'blog_poster': 'assets/images/t-shirt_ward.jpeg',
      'blog_name': languageModel.landingPage.blogTitle,
      'blog_des': '${languageModel.landingPage.blogText1}'
          '${languageModel.landingPage.blogText2}'
          '${languageModel.landingPage.blogText3}',
    },
    {
      'blog_poster': 'assets/images/t-shirt_ward2.jpeg',
      'blog_name': languageModel.landingPage.blogTitle,
      'blog_des': '${languageModel.landingPage.blogText1}'
          '${languageModel.landingPage.blogText2}'
          '${languageModel.landingPage.blogText3}',
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
            text: languageModel.landingPage.blog.toUpperCase(),
            fontWeight: FontWeight.bold,
          ),
          FxBox.h24,
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: Responsive.isMobile(context)
                ? const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 450,
                  )
                : MediaQuery.of(context).size.width < 1500
                    ? const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 450,
                      )
                    : SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width * 0.28,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 450,
                      ),
            itemCount: _blogData.length,
            itemBuilder: (context, index) {
              return _blogBox(
                blogDes: _blogData[index]['blog_des'],
                blogPath: _blogData[index]['blog_poster'],
                blogTitle: _blogData[index]['blog_name'],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _blogBox({
    required String blogPath,
    required String blogTitle,
    required String blogDes,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              blogPath,
              height: 220,
              fit: BoxFit.cover,
            ),
            FxBox.h24,
            ConstText.lightText(
              text: blogTitle,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h12,
            Expanded(
              child: Text(
                blogDes,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            FxBox.h24,
            FxButton(
              onPressed: () {
                autoecTabRouter!.setActiveIndex(16);
              },
              text: 'View More',
            ),
          ],
        ),
      ),
    );
  }
}
