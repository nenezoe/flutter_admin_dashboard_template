import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:flutter/material.dart';

class StackedUserRow extends StatelessWidget {
  const StackedUserRow({
    super.key,
    required this.itemCount,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        itemCount,
        (index) => Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: ConstColor.hintColor,
              ),
              height: 48.0,
              width: 48.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  Images.profileImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (index != itemCount - 1)
              Positioned(
                right: -44.0,
                child: Container(
                  width: 48.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color: context.theme.cardColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
