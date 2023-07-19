import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/icons.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/hover.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/views/authentication/constant_auth.dart';
import 'package:admin_dashboard/src/admin/widget/custom_text_field.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ELogin extends StatefulWidget {
  const ELogin({super.key});

  @override
  State<ELogin> createState() => _ELoginState();
}

class _ELoginState extends State<ELogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SelectionArea(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  Images.authBG,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FxBox.h20,
                    Center(
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 460,
                        ),
                        padding: Responsive.isMobile(context)
                            ? const EdgeInsets.all(32)
                            : const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: isDark ? ColorConst.black : ColorConst.white,
                          border: Border.all(
                            color: isDark ? ColorConst.black : ColorConst.white,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            _logoView(),
                            FxBox.h16,
                            ConstantAuth.headerView(
                                languageModel.authentication.signIn,
                                languageModel.authentication.signInText,
                                context),
                            _bottomView(),
                          ],
                        ),
                      ),
                    ),
                    FxBox.h20,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoView() {
    return SvgPicture.asset(IconlyBroken.adminKit);
  }

  Widget _bottomView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FxBox.h28,
        ConstantAuth.labelView(languageModel.authentication.email),
        FxBox.h8,
        _usernameTextBoxWidget(),
        FxBox.h16,
        ConstantAuth.labelView(languageModel.form.password),
        FxBox.h8,
        _passwordTextBoxWidget(),
        FxBox.h16,
        _loginButton(),
        FxBox.h20,
        _forgotPasswordButton(),
        FxBox.h20,
        _serviceText(),
      ],
    );
  }

  Widget _usernameTextBoxWidget() {
    return CustomTextField(
      hintText: Strings.enterEmail,
      onChanged: (String value) {},
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.done,
      controller: _usernameController,
    );
  }

  Widget _passwordTextBoxWidget() {
    return CustomTextField(
      obsecureText: true,
      hintText: Strings.enterPassword,
      onChanged: (String value) {},
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.done,
      controller: _passwordController,
    );
  }

  Widget _loginButton() {
    return FxButton(
      onPressed: () {},
      text: languageModel.authentication.signIn,
      borderRadius: 8.0,
      height: 40,
      minWidth: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  Widget _forgotPasswordButton() {
    return GestureDetector(
      onTap: () {
        autoecTabRouter!.setActiveIndex(10);
      },
      child: FxHover(
        builder: (isHover) {
          Color color = isHover
              ? ColorConst.primaryDark
              : Theme.of(context).colorScheme.primary;
          return Row(
            children: [
              Icon(
                Icons.lock,
                size: 14,
                color: color,
              ),
              FxBox.w4,
              CustomText(
                title: languageModel.authentication.forgotPassword,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                textColor: color,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _serviceText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomText(
          title: Strings.privacy,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
        CustomText(
          title: Strings.terms,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
        CustomText(
          title: Strings.sarvadhi2022,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          textColor: isDark ? ColorConst.white : ColorConst.black,
        ),
      ],
    );
  }
}
