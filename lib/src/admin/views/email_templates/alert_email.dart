import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class AlertEmail extends StatelessWidget {
  const AlertEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width >= 560.0
                    ? 512.0
                    : MediaQuery.of(context).size.width - 48,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: ColorConst.primaryDark,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: ColorConst.black,
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      languageModel.emailTemplate.emailWarning,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: ColorConst.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(languageModel.emailTemplate.alertEmail1),
                            FxBox.w4,
                            Text(
                              languageModel.emailTemplate.alertEmail2,
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(languageModel.emailTemplate.alertEmail3),
                          ],
                        ),
                        FxBox.h20,
                        Text(languageModel.emailTemplate.alertEmail4),
                        FxBox.h20,
                        Align(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {},
                            child: CustomText(
                              title: languageModel.emailTemplate.alertEmail5,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        FxBox.h20,
                        Text.rich(
                          TextSpan(
                            text: languageModel.emailTemplate.alertEmail6,
                            children: <InlineSpan>[
                              const TextSpan(
                                text: '  ${Strings.fdash}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: languageModel.emailTemplate.alertEmail7),
                            ],
                          ),
                        ),
                        FxBox.h20,
                        const Text(
                          Strings.fdash,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(languageModel.emailTemplate.supportTeam),
                        FxBox.h36,
                        const Align(
                          alignment: Alignment.center,
                          child: Text('2022 © ${Strings.fdash}.'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
