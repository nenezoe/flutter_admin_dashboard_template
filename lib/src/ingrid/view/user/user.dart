import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

import 'activity.dart';
import 'details.dart';
import 'friends.dart';
import 'message.dart';
import 'timeline.dart';

@RoutePage()
class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FxBox.h24,
            const RouteTitle(),
            FxBox.h24,
            if (IngridResponsive.isLargeWeb(context))
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        const UserDetails(),
                        FxBox.h24,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Expanded(child: Message()),
                            FxBox.w24,
                            const Expanded(child: Friends()),
                          ],
                        )
                      ],
                    ),
                  ),
                  FxBox.w24,
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        const DetailsCard(
                          title: ConstString.yourPlan,
                          data: 'Premium',
                          otherDetails: 'Expired on 1 April 2024',
                          image: 'assets/ingrid/square.png',
                        ),
                        FxBox.h24,
                        const LastestActivity()
                      ],
                    ),
                  ),
                  FxBox.w24,
                  const Expanded(flex: 2, child: TimeLine()),
                ],
              ),
            if (IngridResponsive.isSmallWeb(context) ||
                IngridResponsive.isMediumWeb(context)) ...[
              const UserDetails(),
              FxBox.h24,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const DetailsCard(
                          title: ConstString.yourPlan,
                          data: 'Premium',
                          otherDetails: 'Expired on 1 April 2024',
                          image: 'assets/ingrid/square.png',
                        ),
                        FxBox.h24,
                        const LastestActivity()
                      ],
                    ),
                  ),
                  FxBox.w24,
                  const Expanded(child: TimeLine()),
                ],
              ),
              FxBox.h24,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: Message()),
                  FxBox.w24,
                  const Expanded(child: Friends()),
                ],
              ),
            ],
            if (IngridResponsive.isMobile(context) ||
                IngridResponsive.isTablet(context)) ...[
              const UserDetails(),
              FxBox.h24,
              const DetailsCard(
                title: ConstString.yourPlan,
                data: 'Premium',
                otherDetails: 'Expired on 1 April 2024',
                image: 'assets/ingrid/square.png',
              ),
              FxBox.h24,
              const LastestActivity(),
              FxBox.h24,
              const TimeLine(),
              FxBox.h24,
              const Message(),
              FxBox.h24,
              const Friends(),
            ],
            SafeArea(child: FxBox.h24),
          ],
        ),
      ),
    );
  }
}
