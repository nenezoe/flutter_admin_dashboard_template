import 'package:admin_dashboard/src/admin/constant/icons.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class Modal extends StatefulWidget {
  const Modal({Key? key}) : super(key: key);

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  double _getWidth() {
    if (MediaQuery.of(context).size.width <= 550) {
      return MediaQuery.of(context).size.width / 2 - 40;
    } else if (MediaQuery.of(context).size.width <= 750) {
      return (MediaQuery.of(context).size.width / 2) - 50;
    } else if (Responsive.isWeb(context)) {
      return ((MediaQuery.of(context).size.width - 240) / 4) - 36;
    } else {
      return (MediaQuery.of(context).size.width / 3) - 36;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 0,
      runSpacing: 56,
      children: [
        _modelButton(
          title: languageModel.widget.simpleModal,
          content: Text(languageModel.widget.modalLorem),
        ),
        FxBox.w16,
        _modelButton(
          title: languageModel.widget.modalWithButton,
          content: Text(languageModel.widget.modalLorem),
          actions: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.close,
              buttonType: ButtonType.secondary,
            ),
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.saveChange,
            ),
          ],
        ),
        FxBox.w16,
        _modelButton(
          title: languageModel.widget.largeModal,
          modalType: ModalType.large,
          content: Text(languageModel.widget.modalLorem),
          actions: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.close,
              buttonType: ButtonType.secondary,
            ),
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.saveChange,
            ),
          ],
        ),
        FxBox.w16,
        _modelButton(
          title: languageModel.widget.extraLargeModal,
          modalType: ModalType.extraLarge,
          content: Text(languageModel.widget.modalLorem),
          actions: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.close,
              buttonType: ButtonType.secondary,
            ),
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.saveChange,
            ),
          ],
        ),
        FxBox.w16,
        _modelButton(
          title: languageModel.widget.scrollableModal,
          content: Text(
            '${languageModel.widget.modalLorem}\n\n${languageModel.widget.modalLorem}\n\n${languageModel.widget.modalLorem}\n\n${languageModel.widget.modalLorem}',
          ),
          actions: [
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.close,
              buttonType: ButtonType.secondary,
            ),
            FxButton(
              onPressed: () => Navigator.pop(context),
              text: Strings.saveChange,
            ),
          ],
        ),
      ],
    );
  }

  Widget _modelButton(
      {required String title,
      required Widget content,
      List<Widget>? actions,
      ModalType? modalType = ModalType.normal}) {
    return SizedBox(
      height: 180,
      width: _getWidth(),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
            ),
            FxBox.h16,
            FxButton(
              text: Strings.clickMe,
              onPressed: () {
                FxModal.showModel(
                  context: context,
                  title: title,
                  content: SelectionArea(child: content),
                  trailingIcon: const SvgIcon(icon: IconlyBroken.closeSquare),
                  actions: actions,
                  modelType: modalType,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
