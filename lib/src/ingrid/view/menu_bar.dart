import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/ingrid/constant/const.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/utils/extension.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/color.dart';
import '../constant/string.dart';
import 'drawer.dart';

@RoutePage()
class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<PageRouteInfo<dynamic>> routes = [
    const IngridDashboard(),
    const EmailScreen(),
    const InGridContactScreen(),
    const Crypto(),
    const Kanban(),
    const IngridInvoice(),
    const BankScreen(),
    const FileManager(),
    const User(),
    const InGridCalendar(),
    const ToDoScreen(),
    const ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: routes,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          key: _scaffoldKey,
          drawer: IngridDrawer(tabsRouter: tabsRouter),
          body: Row(
            children: [
              if (IngridResponsive.isLargeWeb(context) ||
                  IngridResponsive.isMediumWeb(context))
                IngridDrawer(tabsRouter: tabsRouter),
              Expanded(
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: false,
                    leading: IngridResponsive.isLargeWeb(context) ||
                            IngridResponsive.isMediumWeb(context)
                        ? null
                        : IconButton(
                            onPressed: () =>
                                _scaffoldKey.currentState?.openDrawer(),
                            icon: SvgIcon(
                              icon: ConstIcons.kanban,
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                    titleSpacing: 24.0,
                    title: IngridResponsive.isMobile(context) ||
                            IngridResponsive.isTablet(context)
                        ? const SizedBox.shrink()
                        : ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 656.0),
                            child: TextField(
                              cursorWidth: 1,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: context.isDarkMode
                                    ? ConstColor.darkFillColor
                                    : ConstColor.lightFillColor,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                hintText: ConstString.search,
                                hintStyle: const TextStyle(
                                  fontSize: 16,
                                  color: ConstColor.hintColor,
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: SvgIcon(
                                    icon: ConstIcons.search,
                                    color: ConstColor.hintColor,
                                  ),
                                ),
                                isCollapsed: true,
                              ),
                            ),
                          ),
                    actions: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0)),
                        color: ConstColor.primary,
                        onPressed: () async {
                          const url = Strings.buyNowUrl;
                          final uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw 'Could not Launch Url';
                          }
                        },
                        child: ConstText.largeText(
                          text: ConstString.buyKnow,
                          fontSize: 16,
                          color: ConstColor.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      FxBox.w12,
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0)),
                        color: ConstColor.primary,
                        onPressed: () {
                          context.router.push(const FMenuBar());
                        },
                        child: ConstText.largeText(
                          text: ConstString.backToHome,
                          fontSize: 16,
                          color: ConstColor.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () => themeMode.value = !themeMode.value,
                        icon: Icon(
                          !context.isDarkMode
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode_outlined,
                        ),
                      ),
                      FxBox.w32,
                      SvgIcon(
                        icon: ConstIcons.notification,
                        color: context.isDarkMode ? Colors.white : Colors.black,
                      ),
                      FxBox.w32,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.asset(
                          Images.profileImage,
                          height: 40.0,
                          width: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      FxBox.w12,
                    ],
                  ),
                  body: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
