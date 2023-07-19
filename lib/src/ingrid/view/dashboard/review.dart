import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

List<String> _userName = ['Johnny Ahmad', 'Tatang Wijaya', 'Budi Prabowo'];

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ReviewCard(userName: _userName[0])),
        FxBox.w24,
        Expanded(child: ReviewCard(userName: _userName[1])),
        FxBox.w24,
        Expanded(child: ReviewCard(userName: _userName[2])),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  color: ConstColor.hintColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    Images.profileImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FxBox.w12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: ConstTheme.text(context)
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text('1 hour ago', style: ConstTheme.hintText),
                ],
              ),
            ],
          ),
          FxBox.h32,
          Text(
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.',
            style: ConstTheme.text(context),
          ),
          FxBox.h32,
          Row(
            children: List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.only(right: index == 4 ? 0.0 : 8.0),
                child: const Icon(
                  Icons.star_sharp,
                  color: ConstColor.yellowAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
