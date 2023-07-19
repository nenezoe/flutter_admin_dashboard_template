import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/icons.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/provider/fontBloc/font_bloc.dart';
import 'package:admin_dashboard/src/admin/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/routes/routes.gr.dart';
import 'package:admin_dashboard/src/admin/utils/extainsions/string_extainsions.dart';
import 'package:admin_dashboard/src/admin/utils/hive/hive.dart';
import 'package:admin_dashboard/src/admin/utils/hover.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/utils/routes.dart';
import 'package:admin_dashboard/src/admin/utils/text_utils.dart';
import 'package:admin_dashboard/src/admin/widget/expantion_tile.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class FMenuBar extends StatefulWidget {
  const FMenuBar({Key? key}) : super(key: key);

  @override
  State<FMenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<FMenuBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldDrawerKey =
      GlobalKey<ScaffoldState>();

  final ScrollController _scrollController = ScrollController();

  ValueNotifier<bool> isOpen = ValueNotifier(true);
  final ValueNotifier<bool> _settingDrawer = ValueNotifier(false);
  ValueNotifier<bool> isSubListOpen = ValueNotifier(false);

  Map<String, String> mainData = {
    Strings.dashboard: IconlyBroken.home,
    Strings.eCommerce: IconlyBroken.eCommerce,
    Strings.ingrid: IconlyBroken.eCommerce,
  };

  Map<String, String> componentsEcommceWebsite = {
    Strings.eCommerce: IconlyBroken.eCommerce,
  };

  Map<String, String> componentsEcommer = {
    Strings.dashboard: IconlyBroken.home,
    Strings.eCommerce: IconlyBroken.eCommerce,
    Strings.ingrid: IconlyBroken.eCommerce,
  };

  Map<String, String> componentData = {
    Strings.uiElements: IconlyBroken.box,
    Strings.forms: IconlyBroken.forms,
    Strings.charts: IconlyBroken.charts,
    Strings.tables: IconlyBroken.tables,
  };

  Map<String, String> componentData1 = {
    Strings.calendar: IconlyBroken.calendar,
    Strings.map: IconlyBroken.map,
  };

  Map<String, String> extrasData = {
    Strings.authentication: IconlyBroken.archive,
    Strings.emailTemplates: IconlyBroken.emailTemplate,
    Strings.extraPages: IconlyBroken.extraPages,
  };

  // e-commerce section
  Map<String, String> eCommerceHeader = {
    Strings.eCommerce: IconlyBroken.eCommerce,
  };

  List<String> eCommerceMainSection = [
    Strings.eCommerceAdmin,
  ];
  List<String> eCommerceComponentSection = [Strings.eCommerceSite];

  List<List<String>> eCommerceExpandList = [
    [
      Strings.eCommerceDashboard,
      Strings.productAdd,
      Strings.category,
      Strings.vendor,
      Strings.customer,
      Strings.order,
      Strings.returnOrder,
      Strings.subscriber,
      Strings.coupons,
      Strings.returnCondition,
    ],
    [
      Strings.landingPage,
      Strings.products,
      Strings.cart,
      Strings.payment,
    ],
  ];

  List<List<String>> componentsExpandList = [
    [
      Strings.toast,
      Strings.buttons,
      Strings.rating,
      Strings.badge,
      Strings.alertDialog,
      Strings.modal,
      Strings.loader,
      Strings.tabs,
      Strings.carousel,
      Strings.videoPlayer,
      Strings.dragDrop,
      Strings.datePicker,
      Strings.dropDown,
    ],
    [
      Strings.formElements,
      Strings.formValidation,
      Strings.formFileUpload,
      Strings.formRepeater,
      Strings.formWizard,
      Strings.formMask,
    ],
    [Strings.morrisChart, Strings.chartistChart, Strings.chartJsChart],
    [
      Strings.basicTable,
      Strings.dataTable,
      Strings.responsiveTable,
      Strings.editableTable,
    ],
  ];

  List<List<String>> extrasExpandList = [
    [
      Strings.loginOne,
      Strings.loginTwo,
      Strings.registerOne,
      Strings.registerTwo,
      Strings.recoverPasswordOne,
      Strings.recoverPasswordTwo,
      Strings.lockScreenOne,
      Strings.lockScreenTwo,
    ],
    [
      Strings.basicActionEmail,
      Strings.alertEmail,
      Strings.billingEmail,
    ],
    [
      Strings.timeline,
      Strings.invoice,
      Strings.directory,
      Strings.error404,
      Strings.error500,
      Strings.pricing,
      Strings.gallery,
      Strings.maintenence,
      Strings.comingSoon,
      Strings.faqs,
    ],
  ];

  final List<String> _items = [
    Strings.profile,
    Strings.settings,
    Strings.lockScreen,
  ];

  final List<String> _notificationTitle = [
    'Your order is shipped',
    'your accound have verified',
    'New Notification arrived',
  ];

  final List<String> _notificationSubtitle = [
    'Please share your experience with us',
    'Congratulation  👏🏻',
    'Hey!, How are you?',
  ];

  final List<PageRouteInfo<dynamic>> _routes = const [
    Dashboard(),
    Button(),
    Rating(),
    CustomBadge(),
    Toast(),
    AlertDialogBox(),
    Modal(),
    BasicEmail(),
    AlertEmail(),
    BillingEmail(),
    Loaders(),
    MorrisChart(),
    ChartListChart(),
    ChartJsChart(),
    BasicTable(),
    Datatable(),
    ResponsiveTable(),
    EditableTable(),
    TimelineScreen(),
    Pricing(),
    Cards(),
    FAQs(),
    Invoice(),
    Gallery(),
    Carousel(),
    TabScreen(),
    Calendar(),
    ElementsForm(),
    ValidationForm(),
    FileUploadForm(),
    RepeaterForm(),
    WizardForm(),
    MaskForm(),
    VideoScreen(),
    GoogleMaps(),
    UserProfile(),
    DragAndDrop(),
    DatePicker(),
    ProductsScreen(),
    ProductDetailScreen(),
    CategoryScreen(),
    SubCategoryScreen(),
    VenderScreen(),
    VenderDetailScreen(),
    CustomerScreen(),
    PaymentScreen(),
    ReturnOrderScreen(),
    ReturnOrderInvoice(),
    SubScriptionScreen(),
    CouponsScreen(),
    OrderScreen(),
    OrderInvoice(),
    ReturnConditionScreen(),
    EcommerceDashboard(),
    CartScreen(),
    ProductAdd(),
    SuccessScreen(),
    DropDownScreen(),
    // ECLandingRoute(),
  ];

  // for LTR
  final ValueNotifier<TextDirection> _layout =
      ValueNotifier<TextDirection>(TextDirection.ltr);
  final ValueNotifier<bool> _switchlayout = ValueNotifier<bool>(false);

  // for change language
  final ValueNotifier<String> _language = ValueNotifier<String>('en');
  //final ValueNotifier<bool> _changeLanguage = ValueNotifier<bool>(false);

  int? selectedSkingMode = 0;
  int? selectedNavigationSkingMode = 0;
  int? selectedFontBase = 0;
  int? selectedDirection = 0;
  int? selectedLanguage = 0;

  final List<String> _skinModes = ['CLASSIC', 'LIGHT', 'COOL', 'DARK'];
  final List<String> _fontFamily = ['Nunito', 'Poppins'];
  final List<String> _navigationSkinModes = [
    'DEFAULT',
    'DEEP BLUE',
    'CHARCOAL',
    'GRADIENT'
  ];

  Color? differenttSkinColor;
  Color navigationColor = ColorConst.drawerBG;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: _routes,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        autoTabRouter = tabsRouter;
        return ValueListenableBuilder<TextDirection>(
          valueListenable: _layout,
          builder: (context, value, _) {
            return Directionality(
              textDirection: value,
              child: Scaffold(
                backgroundColor: differenttSkinColor,
                appBar: _appBar(tabsRouter),
                body: Stack(
                  children: [
                    Scaffold(
                      backgroundColor: differenttSkinColor,
                      key: _scaffoldDrawerKey,
                      drawerScrimColor: ColorConst.transparent,
                      drawer: _sidebar(tabsRouter),
                      body: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ValueListenableBuilder<bool>(
                            valueListenable: isOpen,
                            builder: (context, value, child) {
                              return Responsive.isWeb(context)
                                  ? _sidebar(tabsRouter)
                                  : const SizedBox.shrink();
                            },
                          ),
                          Responsive.isWeb(context)
                              ? _globalDiver(true)
                              : const SizedBox.shrink(),
                          Expanded(
                            child: CustomScrollView(
                              controller: _scrollController,
                              slivers: [
                                SliverList(
                                  delegate: SliverChildListDelegate(
                                    [
                                      Responsive.isWeb(context)
                                          ? _globalDiver(false)
                                          : const SizedBox.shrink(),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 24.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (!tabsRouter.currentPath
                                                .contains('ingrid'))
                                              if (!languageModel
                                                  .translate(upperCase(
                                                          tabsRouter
                                                              .currentPath)
                                                      .camelCase())
                                                  .trim()
                                                  .contains(
                                                      Strings.landingPage)) ...[
                                                FxBox.h20,
                                                Text(
                                                  languageModel
                                                      .translate(upperCase(
                                                              tabsRouter
                                                                  .currentPath)
                                                          .camelCase())
                                                      .trim(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                FxBox.h8,
                                                _routesDeatils(tabsRouter),
                                                FxBox.h20,
                                              ],
                                            getRouteWidget(
                                                tabsRouter.activeIndex),
                                            FxBox.h20,
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SliverFillRemaining(
                                  hasScrollBody: false,
                                  fillOverscroll: true,
                                  child: Column(
                                    children: <Widget>[
                                      const Expanded(
                                        child: SizedBox.shrink(),
                                      ),
                                      _footer(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: _settingDrawer,
                        builder: (context, settingDrawer, child) {
                          return settingDrawer
                              ? _settingScreen()
                              : const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// appbar
  PreferredSizeWidget _appBar(TabsRouter tabsRouter) => AppBar(
        toolbarHeight: 70,
        elevation: 0.0,
        shadowColor: ColorConst.transparent,
        leadingWidth: 295,
        title: Responsive.isMobile(context) || Responsive.isTablet(context)
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
                    fillColor: isDark
                        ? ConstColor.darkFillColor
                        : ConstColor.lightFillColor,
                    contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    hintText: ConstString.search,
                    hintStyle: const TextStyle(
                      fontSize: 12,
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
        leading: Row(
          children: [
            ValueListenableBuilder<bool>(
              valueListenable: isOpen,
              builder: (context, value, child) {
                if (Responsive.isWeb(context) && value) {
                  _scaffoldDrawerKey.currentState!.closeDrawer();
                  return InkWell(
                    onTap: () {
                      tabsRouter
                          .setActiveIndex(getRouteIndex(Strings.dashboard));
                      // _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                    child: Container(
                      width: 240,
                      padding: const EdgeInsets.symmetric(horizontal: 61),
                      height: double.infinity,
                      color: selectedNavigationSkingMode == 0
                          ? Theme.of(context).scaffoldBackgroundColor
                          : selectedNavigationSkingMode == 1
                              ? const Color(0xFF092D91)
                              : selectedNavigationSkingMode == 2
                                  ? const Color(0xFF22282F)
                                  : selectedNavigationSkingMode == 3
                                      ? const Color(0xFF5623DB)
                                      : Colors.transparent,
                      child: Image.asset(
                        isDark
                            ? Images.lgDarkLogo
                            : selectedNavigationSkingMode != 0
                                ? Images.lgDarkLogo
                                : Images.lgLightLogo,
                      ),
                    ),
                  );
                }
                return InkWell(
                  onTap: () {
                    tabsRouter.setActiveIndex(getRouteIndex(Strings.dashboard));
                    _scaffoldDrawerKey.currentState?.closeDrawer();
                  },
                  child: Container(
                    width: 60,
                    height: double.infinity,
                    color:
                        isDark ? ColorConst.transparent : ColorConst.drawerBG,
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(Images.smLogo, fit: BoxFit.contain),
                  ),
                );
              },
            ),
            Responsive.isWeb(context)
                ? _globalDiver(true)
                : const SizedBox.shrink(),
            MaterialButton(
              height: double.infinity,
              minWidth: 60,
              hoverColor: ColorConst.transparent,
              onPressed: () async {
                if (Responsive.isMobile(context) ||
                    Responsive.isTablet(context)) {
                  if (_scaffoldDrawerKey.currentState!.isDrawerOpen) {
                    _scaffoldDrawerKey.currentState!.closeDrawer();
                  } else {
                    _scaffoldDrawerKey.currentState!.openDrawer();
                  }
                } else if (Responsive.isWeb(context)) {
                  _scaffoldDrawerKey.currentState!.closeDrawer();
                  isOpen.value = !isOpen.value;
                }
              },
              child: const SvgIcon(icon: IconlyBroken.drawer),
            ),
          ],
        ),
        actions: [
          Responsive.isMobile(context) || Responsive.isTablet(context)
              ? MaterialButton(
                  height: double.infinity,
                  minWidth: 60,
                  hoverColor: ColorConst.transparent,
                  onPressed: () {},
                  child: const SvgIcon(icon: IconlyBroken.search),
                )
              : const SizedBox.shrink(),
          if (Responsive.isWeb(context)) ...[
            _buyNow(),
            BlocBuilder<ThemeModeBloc, ThemeModeState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          HiveUtils.set(HiveKeys.themeMode, !isDark);
                          themeModeBloc
                              .add(ThemeModeEvent.changeTheme(!isDark));
                        },
                        icon: Icon(
                          isDark
                              ? Icons.light_mode_outlined
                              : Icons.dark_mode_outlined,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
          _notification(),
          _profile(tabsRouter),
          ValueListenableBuilder<bool>(
            valueListenable: _settingDrawer,
            builder: (context, settingDrawer, _) {
              return IconButton(
                onPressed: () {
                  _settingDrawer.value = !_settingDrawer.value;
                },
                icon: const Icon(Icons.settings),
              );
            },
          )
        ],
      );

  Widget _settingScreen() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      padding: const EdgeInsets.all(16.0),
      color: Theme.of(context).brightness == Brightness.light
          ? ConstColor.white
          : ConstColor.darkBackgroundColor,
      height: MediaQuery.of(context).size.height,
      width: Responsive.isMobile(context)
          ? 260
          : Responsive.isTablet(context)
              ? 300
              : 335,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Skin Customizer'),
          FxBox.h16,
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          FxBox.h16,
          const Text(
            'Skin Mode',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          _changeSkinMode(),
          const SizedBox(height: 16.0),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Navigation Skin',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          _changeNavigationSkin(),
          const SizedBox(height: 10.0),
          const Text(
            'Font Family Base',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          const SizedBox(height: 10.0),
          _changeFontBase(),
          const SizedBox(height: 10.0),
          const Text(
            'Change Direction',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          const SizedBox(height: 10.0),
          _changeDirection(),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Change Language',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          const SizedBox(height: 10.0),

          _changeLanguage()

          // const SizedBox(height: 10.0),
          // _changeFontBase(),
        ],
      ),
    );
  }

  Widget _changeSkinMode() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 15.0,
      children: List<Widget>.generate(
        4,
        (int index) {
          return ChoiceChip(
            label: Text(
              _skinModes[index],
              style: const TextStyle(fontSize: 12.0),
            ),
            selected: selectedSkingMode == index,
            onSelected: (bool selected) {
              setState(
                () {
                  selectedSkingMode = selected ? index : null;
                  if (index == 0) {
                    themeModeBloc.add(const ThemeModeEvent.changeTheme(false));
                    differenttSkinColor = null;
                  } else if (index == 1) {
                    differenttSkinColor = const Color(0xFFf5f6fa);
                    // _skinColor = Colors.grey.withOpacity(0.01);
                  } else if (index == 2) {
                    differenttSkinColor = const Color(0xFFf7fafe);
                    // _skinColor = Colors.lightBlue.withOpacity(0.5);
                  } else if (index == 3) {
                    themeModeBloc.add(
                      const ThemeModeEvent.changeTheme(true),
                    );
                    differenttSkinColor = null;
                  }
                },
              );
            },
          );
        },
      ).toList(),
    );
  }

  Widget _changeNavigationSkin() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 15.0,
      children: List<Widget>.generate(
        4,
        (int index) {
          return ChoiceChip(
            label: Text(
              _navigationSkinModes[index],
              style: const TextStyle(fontSize: 12.0),
            ),
            selected: selectedNavigationSkingMode == index,
            onSelected: (bool selected) {
              setState(
                () {
                  selectedNavigationSkingMode = selected ? index : null;
                  if (index == 0) {
                    navigationColor = Theme.of(context).scaffoldBackgroundColor;
                  } else if (index == 1) {
                    navigationColor = const Color(0xFF0B35A9);
                    // _skinColor = Colors.grey.withOpacity(0.01);
                  } else if (index == 2) {
                    navigationColor = const Color(0xFF2D353E);
                    // _skinColor = Colors.lightBlue.withOpacity(0.5);
                  } else if (index == 3) {
                    navigationColor = const Color(0xFF432DDB);
                    // themeModeBloc.add(
                    //   const ThemeModeEvent.changeTheme(true),
                    // );
                    // differenttSkinColor = null;
                  }
                },
              );
            },
          );
        },
      ).toList(),
    );
  }

  Widget _changeFontBase() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 15.0,
      children: List<Widget>.generate(
        2,
        (int index) {
          return ChoiceChip(
            label: Text(
              _fontFamily[index],
              style: const TextStyle(fontSize: 12.0),
            ),
            selected: selectedFontBase == index,
            onSelected: (bool selected) {
              setState(
                () {
                  selectedFontBase = selected ? index : null;
                  if (index == 0) {
                    themeModeBloc
                        .add(ThemeModeEvent.changeTheme(isDark ? true : false));
                    context.read<FontBloc>().add(
                          const FontEvent.changeFont(fontFamilyName: 'Nunito'),
                        );
                  } else {
                    themeModeBloc
                        .add(ThemeModeEvent.changeTheme(isDark ? true : false));
                    context.read<FontBloc>().add(
                          const FontEvent.changeFont(fontFamilyName: 'Poppins'),
                        );
                    // robotaFamily = true;
                  }
                  // if (index == 0) {
                  //   navigationColor = Theme.of(context).scaffoldBackgroundColor;
                  // } else if (index == 1) {
                  //   navigationColor = const Color(0xFF0B35A9);
                  //   // _skinColor = Colors.grey.withOpacity(0.01);
                  // } else if (index == 2) {
                  //   navigationColor = const Color(0xFF2D353E);
                  //   // _skinColor = Colors.lightBlue.withOpacity(0.5);
                  // } else if (index == 3) {
                  //   navigationColor = const Color(0xFF432DDB);
                  //   // themeModeBloc.add(
                  //   //   const ThemeModeEvent.changeTheme(true),
                  //   // );
                  //   // differenttSkinColor = null;
                  // }
                },
              );
            },
          );
        },
      ).toList(),
    );
  }

  Widget _changeDirection() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 15.0,
      children: List<Widget>.generate(
        2,
        (int index) {
          return ChoiceChip(
            label: Text(
              index == 0 ? 'Left-To-Right' : 'Right-To-Left',
              style: const TextStyle(fontSize: 12.0),
            ),
            selected: selectedDirection == index,
            onSelected: (bool selected) {
              setState(
                () {
                  selectedDirection = selected ? index : null;
                  if (index == 0) {
                    _layout.value = TextDirection.ltr;
                  } else {
                    _layout.value = TextDirection.rtl;
                  }
                },
              );
            },
          );
        },
      ).toList(),
    );
  }

  Widget _changeLanguage() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 15.0,
      children: List<Widget>.generate(
        2,
        (int index) {
          return ChoiceChip(
            label: Text(
              index == 0 ? 'English' : 'Hindi',
              style: const TextStyle(fontSize: 12.0),
            ),
            selected: selectedLanguage == index,
            onSelected: (bool selected) async {
              setState(
                () {
                  selectedLanguage = selected ? index : null;
                  if (index == 0) {
                    _language.value = 'en';
                  } else {
                    _language.value = 'hi';
                  }
                },
              );
              await languageModel.changeLanguage();
            },
            //       onTap: () async {
            //         if (value == 'en') {
            //           _language.value = 'hi';
            //         } else {
            //           _language.value = 'en';
            //         }
            //         await languageModel.changeLanguage();
            //       },
          );
        },
      ).toList(),
    );
  }

  Widget _notification() {
    return FxDropdownButton(
      focusColor: Colors.transparent,
      underline: FxBox.shrink,
      customButton: const MaterialButton(
        height: double.infinity,
        minWidth: 60,
        hoverColor: ColorConst.transparent,
        onPressed: null,
        child: SvgIcon(icon: IconlyBroken.notification),
      ),
      customItemsIndexes: const [1],
      customItemsHeight: 0,
      onChanged: (value) {},
      dropdownWidth: 280,
      dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
      dropdownDecoration: BoxDecoration(
        color: isDark ? ColorConst.cardDark : Colors.white,
        border: Border.all(
          color: isDark
              ? ColorConst.lightGrey.withOpacity(0.1)
              : ColorConst.lightGrey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      scrollbarAlwaysShow: false,
      dropdownElevation: 0,
      offset: const Offset(-246, 0),
      itemHeight: 282,
      items: [
        DropdownMenuItem(
          alignment: AlignmentDirectional.topStart,
          value: '',
          child: SizedBox(
            height: 300,
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: ScrollController(),
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                      child: Text(
                        '${Strings.notifications} (258)',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FxBox.h8,
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _notificationTitle.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            title: Text(
                              _notificationTitle[index],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              _notificationSubtitle[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .color!
                                        .withOpacity(0.5),
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                    const Divider(color: ColorConst.lightGrey, height: 8.0),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        Strings.viewAll,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _profile(TabsRouter tabsRouter) {
    return FxDropdownButton(
      focusColor: Colors.transparent,
      underline: FxBox.shrink,
      customButton: const MaterialButton(
        height: double.infinity,
        minWidth: 60,
        hoverColor: ColorConst.transparent,
        onPressed: null,
        child: CircleAvatar(
          maxRadius: 16,
          backgroundImage: AssetImage(Images.profileImage),
        ),
      ),
      customItemsIndexes: const [3],
      customItemsHeight: 8,
      onChanged: (value) {
        if (value == 'Profile') {
          // context.router.push(const MenuBar());
          tabsRouter.setActiveIndex(getRouteIndex(Strings.userProfile));
          _scaffoldDrawerKey.currentState?.closeDrawer();
        }
      },
      items: [
        ..._items.map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const DropdownMenuItem<Divider>(
          enabled: false,
          child: Divider(color: ColorConst.lightGrey),
        ),
        const DropdownMenuItem(
          value: 'Logout',
          child: Text(
            Strings.logout,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
      itemHeight: 48,
      itemPadding: const EdgeInsets.only(left: 16, right: 16),
      dropdownWidth: 160,
      dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
      dropdownDecoration: BoxDecoration(
        color: isDark ? ColorConst.cardDark : Colors.white,
        border: Border.all(
          color: isDark
              ? ColorConst.lightGrey.withOpacity(0.1)
              : ColorConst.lightGrey.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      dropdownElevation: 0,
      offset: const Offset(-108, 0),
    );
  }

  /// drawer / sidebar
  Widget _sidebar(TabsRouter tabsRouter) => ValueListenableBuilder<bool>(
        valueListenable: isSubListOpen,
        builder: (context, value1, child) {
          return ValueListenableBuilder<bool>(
            valueListenable: isOpen,
            builder: (context, value, child) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: value || value1 ? 240 : 70,
                color: selectedNavigationSkingMode == 0
                    ? Theme.of(context).scaffoldBackgroundColor
                    : navigationColor,
                child: SingleChildScrollView(
                  controller: ScrollController(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Responsive.isWeb(context)
                          ? _globalDiver(false)
                          : const SizedBox.shrink(),
                      FxBox.h8,
                      // main
                      if (value) _menuHeading(languageModel.translate('main')),
                      _menuList(
                        tabsRouter: tabsRouter,
                        items: mainData,
                        isopen: value,
                        isSubListopen: value1,
                      ),

                      // components
                      if (value)
                        _menuHeading(languageModel.translate('components')),
                      _menuList(
                        tabsRouter: tabsRouter,
                        items: componentData1,
                        isopen: value,
                      ),
                      _menuList(
                        tabsRouter: tabsRouter,
                        items: componentData,
                        isExpanded: true,
                        children: componentsExpandList,
                        isopen: value,
                      ),
                      // _menuList(
                      //   tabsRouter: tabsRouter,
                      //   items: extrasData,
                      //   isExpanded: true,
                      //   children: extrasExpandList,
                      //   isopen: value,
                      // ),

                      _menuList(
                        tabsRouter: tabsRouter,
                        items: extrasData,
                        isExpanded: true,
                        children: extrasExpandList,
                        isopen: value,
                      ),

                      _menuList(
                          tabsRouter: tabsRouter,
                          items: componentsEcommceWebsite,
                          isopen: value,
                          isSubListopen: value1,
                          isComponent: true),

                      // ingrid
                      // if (value) _menuHeading(languageModel.translate('ingrid')),
                      // extras
                      // if (value) _menuHeading(Strings.extras),
                      // _menuList(
                      //   tabsRouter: tabsRouter,
                      //   items: extrasData,
                      //   isExpanded: true,
                      //   children: extrasExpandList,
                      //   isopen: value,
                      // ),
                      FxBox.h20,
                    ],
                  ),
                ),
              );
            },
          );
        },
      );

  /// menu heading
  Widget _menuHeading(String title) {
    return Container(
      padding: const EdgeInsets.only(left: 18),
      height: 40,
      alignment: Alignment.centerLeft,
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: isDark
              ? ColorConst.white
              : selectedNavigationSkingMode != 0
                  ? ConstColor.white
                  : ColorConst.black,
          fontSize: 11,
        ),
      ),
    );
  }

  /// menu list
  Widget _menuList({
    required TabsRouter tabsRouter,
    required Map<String, String> items,
    bool isExpanded = false,
    List<List<String>> children = const [],
    required bool isopen,
    bool isSubListopen = false,
    bool isComponent = false,
  }) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        if (items.keys.elementAt(index) == Strings.eCommerce) {
          return _menuList1(
            tabsRouter: tabsRouter,
            items: eCommerceHeader,
            items1:
                !isComponent ? eCommerceMainSection : eCommerceComponentSection,
            isExpanded: true,
            children: eCommerceExpandList,
            isopen: isopen,
            isSubListopen: isSubListopen,
          );
        }

        return FxHover(
          builder: (isHover) {
            Color color = isHover
                ? isDark
                    ? ColorConst.chartForgoundColor
                    : ColorConst.primary
                : isDark
                    ? ColorConst.white
                    : selectedNavigationSkingMode != 0
                        ? ColorConst.white
                        : ColorConst.black;
            if (isExpanded) {
              return isopen
                  ? FxExpansionTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FxBox.w(22.0),
                          SvgIcon(
                            icon: items.values.elementAt(index),
                            size: 16,
                            color: children[index]
                                    .contains(upperCase(tabsRouter.currentPath))
                                ? isDark
                                    ? ColorConst.chartForgoundColor
                                    : ColorConst.primary
                                : color,
                          ),
                          FxBox.w(24.0),
                        ],
                      ),
                      title: Text(
                        languageModel
                            .translate(items.keys.elementAt(index).camelCase()),
                        style: TextStyle(
                            color: children[index]
                                    .contains(upperCase(tabsRouter.currentPath))
                                ? isDark
                                    ? ColorConst.chartForgoundColor
                                    : ColorConst.primary
                                : color,
                            fontSize: 15.7),
                      ),
                      trailing: SvgIcon(
                        icon: IconlyBroken.arrowDown,
                        size: 16,
                        color: children[index]
                                .contains(upperCase(tabsRouter.currentPath))
                            ? isDark
                                ? ColorConst.chartForgoundColor
                                : ColorConst.primary
                            : color,
                      ),
                      children: [_subMenuList(children[index], tabsRouter)],
                    )
                  : ListTile(
                      leading: SvgIcon(
                        icon: items.values.elementAt(index),
                        size: isopen ? 16 : 18,
                        color: items.keys.elementAt(index) ==
                                upperCase(tabsRouter.currentPath)
                            ? isDark
                                ? ColorConst.chartForgoundColor
                                : ColorConst.primary
                            : color,
                      ),
                      title: isopen
                          ? Text(
                              languageModel.translate(
                                  items.keys.elementAt(index).camelCase()),
                              style: TextStyle(
                                color: items.keys.elementAt(index) ==
                                        upperCase(tabsRouter.currentPath)
                                    ? isDark
                                        ? ColorConst.chartForgoundColor
                                        : ColorConst.primary
                                    : color,
                                fontSize: 15.7,
                              ),
                            )
                          : null,
                      mouseCursor: SystemMouseCursors.click,
                      horizontalTitleGap: 0.0,
                      onTap: () {
                        isOpen.value = true;
                        _scaffoldDrawerKey.currentState?.closeDrawer();
                      },
                    );
            } else {
              return Row(
                children: [
                  if (isopen)
                    Container(
                      width: 6.0,
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: items.keys.elementAt(index) ==
                                upperCase(tabsRouter.currentPath)
                            ? isDark
                                ? ColorConst.chartForgoundColor
                                : ColorConst.primary
                            : ColorConst.transparent,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(6.0),
                          bottomRight: Radius.circular(6.0),
                        ),
                      ),
                    ),
                  if (isopen) FxBox.w16,
                  Expanded(
                    child: ListTile(
                      leading: SvgIcon(
                        icon: items.values.elementAt(index),
                        size: isopen ? 16 : 18,
                        color: items.keys.elementAt(index) ==
                                upperCase(tabsRouter.currentPath)
                            ? isDark
                                ? ColorConst.chartForgoundColor
                                : ColorConst.primary
                            : color,
                      ),
                      title: isopen
                          ? Text(
                              languageModel.translate(
                                  items.keys.elementAt(index).camelCase()),
                              style: TextStyle(
                                color: items.keys.elementAt(index) ==
                                        upperCase(tabsRouter.currentPath)
                                    ? isDark
                                        ? ColorConst.chartForgoundColor
                                        : ColorConst.primary
                                    : color,
                                fontSize: 15.7,
                              ),
                            )
                          : null,
                      mouseCursor: SystemMouseCursors.click,
                      horizontalTitleGap: 0.0,
                      onTap: () {
                        isOpen.value = true;
                        if (items.keys.elementAt(index) == Strings.ingrid) {
                          context.router.push(const Ingrid());
                        }
                        tabsRouter.setActiveIndex(
                            getRouteIndex(items.keys.elementAt(index)));
                        HiveUtils.set(Strings.selectedmenuIndex,
                            getRouteIndex(items.keys.elementAt(index)));
                        _scaffoldDrawerKey.currentState?.closeDrawer();
                      },
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }

  Widget _globalDiver(bool? vertical) {
    return vertical == true
        ? VerticalDivider(
            width: 2,
            color: Colors.grey.withOpacity(0.1),
          )
        : const Divider(
            height: 2,
            color: Colors.transparent,
          );
  }

  Widget _tempMenuList({
    required TabsRouter tabsRouter,
    required List<String> items1,
    bool isExpanded = false,
    List<List<String>> children = const [],
    required bool isopen,
    required bool isSubListopen,
  }) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items1.length,
      itemBuilder: (context, index) => FxHover(
        builder: (isHover) {
          Color color = isHover
              ? isDark
                  ? ColorConst.chartForgoundColor
                  : ColorConst.primary
              : isDark
                  ? ColorConst.white
                  : ColorConst.black;
          if (isExpanded) {
            return isopen
                ? FxExpansionTile(
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FxBox.w(22.0),
                        FxBox.w(24.0),
                      ],
                    ),
                    title: Text(
                      languageModel.translate(items1[index].camelCase()),
                      style: TextStyle(
                          color: children[index]
                                  .first
                                  .camelCase()
                                  .contains(upperCase(tabsRouter.currentPath))
                              // languageModel
                              //         .translate(children[index].first.camelCase())
                              //         .contains(upperCase(tabsRouter.currentPath))
                              ? isDark
                                  ? ColorConst.chartForgoundColor
                                  : ColorConst.primary
                              : color,
                          fontSize: 15.7),
                    ),
                    trailing: SvgIcon(
                      icon: IconlyBroken.arrowDown,
                      size: 16,
                      color: children[index]
                              .first
                              .camelCase()
                              .contains(upperCase(tabsRouter.currentPath))
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    children: [_subMenuList(children[index], tabsRouter)],
                  )
                : ListTile(
                    title: isopen
                        ? Text(
                            languageModel.translate(items1[index].camelCase()),
                            style: TextStyle(
                              color: items1[index].camelCase().contains(
                                      upperCase(tabsRouter.currentPath))
                                  ? isDark
                                      ? ColorConst.chartForgoundColor
                                      : ColorConst.primary
                                  : color,
                              fontSize: 15.7,
                            ),
                          )
                        : null,
                    mouseCursor: SystemMouseCursors.click,
                    horizontalTitleGap: 0.0,
                    onTap: () {
                      isOpen.value = true;
                      _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                  );
          } else {
            return Row(
              children: [
                if (isopen)
                  Container(
                    width: 6.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                      color: items1[index]
                              .camelCase()
                              .contains(upperCase(tabsRouter.currentPath))
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : ColorConst.transparent,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(6.0),
                        bottomRight: Radius.circular(6.0),
                      ),
                    ),
                  ),
                if (isopen) FxBox.w16,
                Expanded(
                  child: ListTile(
                    title: isopen
                        ? Text(
                            languageModel.translate(items1[index].camelCase()),
                            style: TextStyle(
                              color: items1[index].camelCase().contains(
                                      upperCase(tabsRouter.currentPath))
                                  ? isDark
                                      ? ColorConst.chartForgoundColor
                                      : ColorConst.primary
                                  : color,
                              fontSize: 15.7,
                            ),
                          )
                        : null,
                    mouseCursor: SystemMouseCursors.click,
                    horizontalTitleGap: 0.0,
                    onTap: () {
                      isOpen.value = true;

                      tabsRouter.setActiveIndex(getRouteIndex(items1[index]));
                      HiveUtils.set(Strings.selectedmenuIndex,
                          getRouteIndex(items1[index]));
                      _scaffoldDrawerKey.currentState?.closeDrawer();
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _menuList1({
    required TabsRouter tabsRouter,
    required Map<String, String> items,
    required List<String> items1,
    bool isExpanded = false,
    List<List<String>> children = const [],
    required bool isopen,
    required bool isSubListopen,
  }) {
    return FxHover(
      builder: (isHover) {
        Color color = isHover
            ? isDark
                ? ColorConst.chartForgoundColor
                : ColorConst.primary
            : isDark
                ? ColorConst.white
                : selectedNavigationSkingMode != 0
                    ? ColorConst.white
                    : ColorConst.black;
        return isopen
            ? FxExpansionTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FxBox.w(22.0),
                    SvgIcon(
                      icon: items.values.elementAt(0),
                      size: 16,
                      color: children[0]
                              .contains(upperCase(tabsRouter.currentPath))
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                    ),
                    FxBox.w(24.0),
                  ],
                ),
                title: Text(
                  languageModel.translate(items.keys
                      .elementAt(0)
                      .replaceFirst('-', ' ')
                      .camelCase()),
                  style: TextStyle(
                      color: children[0]
                              .contains(upperCase(tabsRouter.currentPath))
                          ? isDark
                              ? ColorConst.chartForgoundColor
                              : ColorConst.primary
                          : color,
                      fontSize: 15.7),
                ),
                trailing: SvgIcon(
                  icon: IconlyBroken.arrowDown,
                  size: 16,
                  color: children[0].contains(upperCase(tabsRouter.currentPath))
                      ? isDark
                          ? ColorConst.chartForgoundColor
                          : ColorConst.primary
                      : color,
                ),
                children: [
                  _tempMenuList(
                    items1: items1,
                    tabsRouter: tabsRouter,
                    isExpanded: true,
                    children: children,
                    isopen: isopen,
                    isSubListopen: isSubListopen,
                  ),
                ],
              )
            : ListTile(
                leading: SvgIcon(
                  icon: items.values.elementAt(0),
                  size: isopen ? 16 : 18,
                  color: items.keys.elementAt(0) ==
                          upperCase(tabsRouter.currentPath)
                      ? isDark
                          ? ColorConst.chartForgoundColor
                          : ColorConst.primary
                      : color,
                ),
                mouseCursor: SystemMouseCursors.click,
                horizontalTitleGap: 0.0,
                onTap: () {
                  isOpen.value = true;
                  _scaffoldDrawerKey.currentState?.closeDrawer();
                },
              );
      },
    );
  }

  /// sub menu list
  Widget _subMenuList(List<String> items, TabsRouter tabsRouter) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => FxHover(
        builder: (isHover) {
          Color color = isHover
              ? isDark
                  ? ColorConst.chartForgoundColor
                  : ColorConst.primary
              : _checkSubRoute(tabsRouter.currentPath) == items[index]
                  ? isDark
                      ? ColorConst.chartForgoundColor
                      : ColorConst.primary
                  : upperCase(tabsRouter.currentPath) == items[index]
                      ? isDark
                          ? ColorConst.chartForgoundColor
                          : ColorConst.primary
                      : isDark
                          ? ColorConst.white
                          : selectedNavigationSkingMode != 0
                              ? ConstColor.white
                              : ColorConst.black;
          return Row(
            children: [
              if (_checkSubRoute(tabsRouter.currentPath) == items[index]) ...[
                Container(
                  width: 6.0,
                  height: 48.0,
                  decoration: BoxDecoration(
                    color:
                        _checkSubRoute(tabsRouter.currentPath) == items[index]
                            ? isDark
                                ? ColorConst.chartForgoundColor
                                : ColorConst.primary
                            : ColorConst.transparent,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(6.0),
                      bottomRight: Radius.circular(6.0),
                    ),
                  ),
                ),
              ],
              Container(
                width: 6.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: upperCase(tabsRouter.currentPath) == items[index]
                      ? isDark
                          ? ColorConst.chartForgoundColor
                          : ColorConst.primary
                      : ColorConst.transparent,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(6.0),
                    bottomRight: Radius.circular(6.0),
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -3),
                  mouseCursor: SystemMouseCursors.click,
                  contentPadding: _switchlayout.value == false
                      ? const EdgeInsets.only(left: 52.0)
                      : const EdgeInsets.only(right: 52.0),
                  title: Text(
                    // items[index],
                    languageModel.translate(items[index].camelCase()),
                    style: TextStyle(color: color, fontSize: 15),
                  ),
                  onTap: () {
                    if (items[index] == 'Login 1') {
                      context.router.push(const LoginOne());
                    } else if (items[index] == 'Login 2') {
                      context.router.push(const LoginTwo());
                    } else if (items[index] == 'Register 1') {
                      context.router.push(const RegisterOne());
                    } else if (items[index] == 'Register 2') {
                      context.router.push(const RegisterTwo());
                    } else if (items[index] == 'Recover Password 1') {
                      context.router.push(const RecoverPasswordOne());
                    } else if (items[index] == 'Recover Password 2') {
                      context.router.push(const RecoverPasswordTwo());
                    } else if (items[index] == 'Lock Screen 1') {
                      context.router.push(const LockScreenOne());
                    } else if (items[index] == 'Lock Screen 2') {
                      context.router.push(const LockScreenTwo());
                    } else if (items[index] == 'Error 404') {
                      context.router.push(const Error404());
                    } else if (items[index] == 'Error 500') {
                      context.router.push(const Error500());
                    } else if (items[index] == 'Maintenence') {
                      context.router.push(const Maintenance());
                    } else if (items[index] == 'Coming Soon') {
                      context.router.push(const ComingSoon());
                    } else if (items[index] == 'Landing Page') {
                      context.router.push(const ECLandingRoute());
                    } else {
                      if (items[index].contains('Landing Page')) {
                        isOpen.value = false;
                      }

                      tabsRouter.setActiveIndex(getRouteIndex(items[index]));
                    }
                    _scaffoldDrawerKey.currentState?.closeDrawer();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// routes
  Widget _routesDeatils(TabsRouter tabsRouter) {
    int routeIndex = getRouteIndex(tabsRouter.currentPath
        .substring(1, tabsRouter.currentPath.length)
        .replaceAll('-', ' ')
        .capitalize());

    return Row(
      children: tabsRouter.currentPath == '/dashboard'
          ? []
          : [
              InkWell(
                mouseCursor: SystemMouseCursors.click,
                // child: Text(Strings.admin),
                child: Text(languageModel.translate('admin')),
              ),
              if (routeIndex.isBetween(1, 6) ||
                  routeIndex == 10 ||
                  routeIndex == 24 ||
                  routeIndex == 25 ||
                  routeIndex == 33 ||
                  routeIndex == 36 ||
                  routeIndex == 37 ||
                  routeIndex == 57) ...[
                // const Text(' / ${Strings.uiElements} '),
                Text(' / ${languageModel.translate('widgets')} '),
              ] else if (routeIndex.isBetween(27, 32)) ...[
                // const Text(' / ${Strings.forms} '),
                Text(' / ${languageModel.translate('formElements')} '),
              ] else if (routeIndex.isBetween(11, 13)) ...[
                // const Text(' / ${Strings.charts} '),
                Text(' / ${languageModel.translate('charts')} '),
              ] else if (routeIndex.isBetween(14, 17)) ...[
                // const Text(' / ${Strings.tables} '),
                Text(' / ${languageModel.translate('tables')} '),
              ] else if (routeIndex.isBetween(7, 9)) ...[
                // const Text(' / ${Strings.emailTemplates} '),
                Text(' / ${languageModel.translate('emailTemplates')} '),
              ] else if (routeIndex == 38) ...[
                Text(' / ${languageModel.translate('eCommerce')} '),
              ] else if (routeIndex == 40) ...[
                Text(' / ${languageModel.translate('eCommerce')} '),
                // const Text(' / ${Strings.eCommerce} '),
              ] else if (routeIndex == 47) ...[
                Text(
                    ' / ${languageModel.translate('eCommerce')} / ${Strings.returnOrder} '),
              ] else if (routeIndex == 51) ...[
                Text(
                    ' / ${languageModel.translate('eCommerce')} / ${Strings.order} '),
              ] else if (routeIndex == 41) ...[
                Text(
                    ' / ${languageModel.translate('eCommerce')} / ${Strings.category} '),
              ] else if (routeIndex == 43) ...[
                Text(
                    ' / ${languageModel.translate('eCommerce')} / ${Strings.vendor} '),
              ] else if (routeIndex == 42 ||
                  routeIndex == 44 ||
                  routeIndex == 45 ||
                  routeIndex == 46 ||
                  routeIndex == 48 ||
                  routeIndex == 49 ||
                  routeIndex == 50 ||
                  routeIndex == 52 ||
                  routeIndex == 53 ||
                  routeIndex == 54 ||
                  routeIndex == 56) ...[
                Text(' / ${languageModel.translate('eCommerce')} '),
              ] else if (routeIndex == 39) ...[
                Text(
                    ' / ${languageModel.translate('eCommerce')} / ${Strings.products}'),
              ] else if (routeIndex == 55) ...[
                Text(' / ${languageModel.translate('eCommerce')} '),
              ] else if (tabsRouter.currentPath == '/calendar' ||
                  tabsRouter.currentPath == '/map') ...[
                const SizedBox.shrink()
              ] else ...[
                // const Text(' / Extra Pages '),
                Text(' / ${languageModel.translate('extraPages')} '),
              ],
              const Text(' / '),
              // Text(upperCase(tabsRouter.currentPath)),
              Text(languageModel
                  .translate(upperCase(tabsRouter.currentPath).camelCase())
                  .trim()),
            ],
    );
  }

  Widget _footer() => Container(
        color: isDark ? ColorConst.footerDark : ColorConst.drawerBG,
        height: 60,
        width: Responsive.isWeb(context)
            ? MediaQuery.of(context).size.width - 240
            : MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: const Text(Strings.footerText),
      );

  String _checkSubRoute(String path) {
    if (upperCase(path) == 'Products Detail') {
      return 'Products';
    } else if (upperCase(path) == 'Sub Category') {
      return 'Category';
    } else if (upperCase(path) == 'Vender Detail') {
      return 'Vender';
    } else if (upperCase(path) == 'Return Order Invoice') {
      return 'Return Order';
    } else if (upperCase(path) == 'Order Invoice') {
      return 'Order';
    } else {
      return '';
    }
  }

  Widget _buyNow() {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
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
    );
  }
}
