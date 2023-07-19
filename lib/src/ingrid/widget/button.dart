import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:flutter/material.dart';

class IngridButton extends StatelessWidget {
  const IngridButton({
    super.key,
    required this.text,
    this.size,
  });

  final String text;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(ConstColor.primary),
        fixedSize: MaterialStatePropertyAll(size ?? Size(context.width, 38.0)),
        elevation: const MaterialStatePropertyAll(0.0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

class StatusButton extends StatelessWidget {
  final String text;
  final Color color;
  final BorderRadiusGeometry? borderRadius;

  const StatusButton({
    super.key,
    required this.text,
    required this.color,
    this.borderRadius,
  });

  StatusButton.product({super.key})
      : borderRadius = BorderRadius.circular(12.0),
        color = ConstColor.primary,
        text = 'Product Team',
        super();

  StatusButton.developer({super.key})
      : borderRadius = BorderRadius.circular(12.0),
        color = ConstColor.redAccent,
        text = 'Developer Team',
        super();

  StatusButton.design({super.key})
      : borderRadius = BorderRadius.circular(12.0),
        color = ConstColor.yellowAccent,
        text = 'Design Team',
        super();

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: null,
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0.0),
        backgroundColor: MaterialStatePropertyAll(color.withOpacity(0.1)),
        surfaceTintColor: MaterialStatePropertyAll(color.withOpacity(0.1)),
        foregroundColor: MaterialStatePropertyAll(color),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(4.0))),
        textStyle: const MaterialStatePropertyAll(
            TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500)),
        minimumSize: const MaterialStatePropertyAll(Size(80.0, 40.0)),
      ),
      child: Text(text),
    );
  }
}
