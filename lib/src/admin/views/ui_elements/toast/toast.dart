import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class Toast extends StatefulWidget {
  const Toast({Key? key}) : super(key: key);

  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> {
  final List<IconData> _iconList = [
    Icons.home_mini_rounded,
    Icons.check_circle_rounded,
    Icons.error_rounded,
    Icons.warning_rounded,
    Icons.info_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: Responsive.isMobile(context)
          ? [
              _simpleToast(false),
              FxBox.h12,
              _simpleToast(true),
              FxBox.h12,
              _iconToast(),
            ]
          : [
              Row(
                children: [
                  Expanded(child: _simpleToast(false)),
                  FxBox.w12,
                  Expanded(child: _simpleToast(true)),
                ],
              ),
              FxBox.h12,
              Row(
                children: [
                  Expanded(child: _iconToast()),
                  FxBox.w12,
                  Expanded(child: FxBox.shrink),
                ],
              ),
            ],
    );
  }

  Widget _simpleToast(bool background) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                background
                    ? languageModel.widget.lightBackgroundToast
                    : languageModel.widget.simpleToast,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              FxBox.h16,
              _toast(
                context,
                ToastWithColor(
                  message: languageModel.widget.primary,
                  isLightBackground: background,
                ),
                ToastPosition.top,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithColor.success(
                  message: languageModel.widget.success,
                  isLightBackground: background,
                ),
                ToastPosition.top,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithColor.error(
                  message: languageModel.widget.error,
                  isLightBackground: background,
                ),
                ToastPosition.top,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithColor.warning(
                  message: languageModel.widget.warning,
                  isLightBackground: background,
                ),
                ToastPosition.topLeft,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithColor.info(
                  message: languageModel.widget.info,
                  isLightBackground: background,
                ),
                ToastPosition.topRight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconToast() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                languageModel.widget.iconToast,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              FxBox.h16,
              _toast(
                context,
                ToastWithoutColor(
                  message: languageModel.widget.primary,
                  icon: _iconList[0],
                ),
                ToastPosition.topRight,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithoutColor.success(
                  message: languageModel.widget.success,
                  icon: _iconList[1],
                ),
                ToastPosition.topRight,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithoutColor.error(
                  message: languageModel.widget.error,
                  icon: _iconList[2],
                ),
                ToastPosition.topRight,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithoutColor.warning(
                  message: languageModel.widget.warning,
                  icon: _iconList[3],
                ),
                ToastPosition.topRight,
              ),
              FxBox.h12,
              _toast(
                context,
                ToastWithoutColor.info(
                  message: languageModel.widget.info,
                  icon: _iconList[4],
                ),
                ToastPosition.topRight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toast(
      BuildContext context, ToastProvider toast, ToastPosition? position) {
    return InkWell(
      child: FxToast.show(context, toast),
      onTap: () => FxToast.showToast(
        context: context,
        toast: toast,
        position: position,
      ),
    );
  }
}
