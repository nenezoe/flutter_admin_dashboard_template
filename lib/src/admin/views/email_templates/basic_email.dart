import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class BasicEmail extends StatelessWidget {
  const BasicEmail({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.indigo, width: 3.0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageModel.emailTemplate.basicEmail1,
                    softWrap: true,
                  ),
                  FxBox.h20,
                  Text(
                   languageModel.emailTemplate.basicEmail2,
                    softWrap: true,
                  ),
                  FxBox.h20,
                  Align(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {},
                      child: CustomText(
                        title: languageModel.emailTemplate.confirmEmail,
                        fontWeight: FontWeight.w800,
                      ),
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
                    child: Text("2022 © ${Strings.fdash}."),
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
