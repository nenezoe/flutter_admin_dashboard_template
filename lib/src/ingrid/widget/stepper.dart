import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterx/flutterx.dart';

class IngridStepper extends StatelessWidget {
  const IngridStepper({super.key, required this.step});

  final List<IngridStep> step;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: step.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => step[index],
    );
  }
}

class IngridStep extends StatelessWidget {
  const IngridStep({
    super.key,
    required this.title,
    required this.content,
    this.titleStyle,
    this.runningSpace = 0.0,
  });

  final String title;
  final String content;
  final TextStyle? titleStyle;
  final double runningSpace;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SvgPicture.asset(ConstIcons.step),
            ),
          ],
        ),
        FxBox.w32,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: titleStyle ?? ConstTheme.title(context),
              ),
              FxBox.h8,
              Text(content, style: ConstTheme.hintText),
              FxBox.h20,
              SizedBox(height: runningSpace),
            ],
          ),
        ),
      ],
    );
  }
}
