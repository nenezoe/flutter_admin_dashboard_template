import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class FriendBox extends StatefulWidget {
  const FriendBox({super.key});

  @override
  State<FriendBox> createState() => _FriendBoxState();
}

class _FriendBoxState extends State<FriendBox> {
  final List<Map<String, dynamic>> _friendList = [
    {
      'title': 'Samantha William',
      'description': 'UX Designer',
    },
    {
      'title': 'Tony Soap',
      'description': 'Web Developer',
    },
    {
      'title': 'Nadila Adja',
      'description': 'Graphic Designer',
    },
    {
      'title': 'Jordan Nico',
      'description': 'Product Manager',
    },
    {
      'title': 'Azizi Azazel',
      'description': 'UX Engineer',
    },
    {
      'title': 'Johnny Ahmad',
      'description': 'Product Owner',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return IngridCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  ConstString.friends,
                  style: ConstTheme.title(context),
                ),
              ),
              const SvgIcon(
                icon: ConstIcons.menu,
                color: ConstColor.hintColor,
              ),
            ],
          ),
          FxBox.h16,
          _searchTextField(),
          FxBox.h16,
          _friendBox(),
        ],
      ),
    );
  }

  Widget _friendBox() {
    return ListView.builder(
      itemCount: _friendList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return FriendDetailTile(
          title: _friendList[index]['title'],
          description: _friendList[index]['description'],
        );
      },
    );
  }

  Widget _searchTextField() {
    return SizedBox(
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: context.isDarkMode
              ? ConstColor.darkFillColor
              : ConstColor.lightFillColor,
          hintText: 'Search...',
          prefixIcon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: SvgIcon(
              icon: ConstIcons.search,
              color: ConstColor.hintColor,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

class FriendDetailTile extends StatelessWidget {
  const FriendDetailTile({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: 48.0,
            width: 48.0,
            decoration: BoxDecoration(
              color: ConstColor.hintColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                Images.profileImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          FxBox.w16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ConstTheme.title(context).copyWith(fontSize: 16.0),
                ),
                Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ConstTheme.hintText.copyWith(fontSize: 12.0),
                ),
              ],
            ),
          ),
          FxBox.w16,
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: SvgIcon(
              icon: ConstIcons.chat,
              color: ConstColor.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
