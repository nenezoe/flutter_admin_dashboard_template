import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';

import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class BlogDetailsScreen extends StatefulWidget {
  const BlogDetailsScreen({super.key});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: isxl(context)
          ? Row(
              children: [
                const Expanded(child: SizedBox.shrink()),
                Expanded(flex: 3, child: _blogDetail()),
                const Expanded(child: SizedBox.shrink()),
              ],
            )
          : Column(
              children: [
                _blogDetail(),
              ],
            ),
    );
  }

  Widget _blogDetail() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ConstText.lightText(
        //   text: Strings.blogDetail.toUpperCase(),
        //   fontWeight: FontWeight.bold,
        // ),
        // FxBox.h24,
        Card(
          shadowColor: ColorConst.primary.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          elevation: 7,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                FxBox.h16,
                _blogHeader(),
                FxBox.h16,
                _blogImage(),
                FxBox.h16,
                _blogDes(),
                FxBox.h16,
                _imageWithDec(Images.tShirt, true),
                FxBox.h16,
                _imageWithDec(Images.tShirt1, false),
                FxBox.h16,
                _imageWithDec(Images.tShirt2, true),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageWithDec(String imagePath, bool isFront) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isFront) ...[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(imagePath),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  '${languageModel.landingPage.blogText1}'
                  '${languageModel.landingPage.blogText2}'
                  '${languageModel.landingPage.blogText3}\n\n'
                  '${languageModel.landingPage.productDescription}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
        if (!isFront) ...[
          Expanded(
            child: Column(
              children: [
                Text(
                  '${languageModel.landingPage.blogText1}'
                  '${languageModel.landingPage.blogText2}'
                  '${languageModel.landingPage.blogText3}\n\n'
                  '${languageModel.landingPage.productDescription}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(imagePath),
            ),
          ),
        ],
      ],
    );
  }

  Widget _blogImage() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Image.asset('assets/images/t-shirt_ward1.jpeg'),
    );
  }

  Widget _blogHeader() {
    return ConstText.mediumText(
      text: languageModel.landingPage.blogTitle,
      fontWeight: FontWeight.bold,
    );
  }

  Widget _blogDes() {
    return SizedBox(
      width: 900,
      child: Text(
        '${languageModel.landingPage.blogText1}'
        '${languageModel.landingPage.blogText2}'
        '${languageModel.landingPage.blogText3}\n\n'
        '${languageModel.landingPage.productDescription}',
        // overflow: TextOverflow.ellipsis,

        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
