import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
    this.isCheck = false,
  });
  final bool isCheck;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool? isCheck;

  @override
  void initState() {
    isCheck = widget.isCheck;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isCheck = !isCheck!;
        setState(() {});
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 24.0,
            width: 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(
                  color:
                      isCheck! ? ConstColor.blueAccent : ConstColor.hintColor),
            ),
          ),
          isCheck!
              ? const Positioned(
                  bottom: 0.0,
                  child: SvgIcon(
                    icon: ConstIcons.check,
                    color: ConstColor.blueAccent,
                    size: 28.0,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
