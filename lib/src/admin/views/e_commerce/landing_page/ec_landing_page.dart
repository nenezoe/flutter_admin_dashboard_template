import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/const.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/icons.dart';
import 'package:admin_dashboard/src/admin/constant/image.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/routes/routes.gr.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/utils/routes.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/footer_page.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ECLandingPage extends StatefulWidget {
  const ECLandingPage({super.key});

  @override
  State<ECLandingPage> createState() => _ECLandingPageState();
}

class _ECLandingPageState extends State<ECLandingPage> {
  final List<PageRouteInfo<dynamic>> _routes = const [
    ProductHomeScreen(),
    BlogScreen(),
    AllCategoryScreen(),
    AllBrandScreen(),
    OffersScreen(),
    CompareScreen(),
    WishList(),
    ECartScreen(),
    ELogin(),
    ERegister(),
    EForgot(),
    TrackOrder(),
    OrderHistory(),
    ShowProductDetails(),
    LandingPaymentScreen(),
    LandingSuccessScreen(),
    BlogDetailsScreen(),
  ];
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<TextDirection> _layout =
      ValueNotifier<TextDirection>(TextDirection.ltr);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsRouter(
        routes: _routes,
        builder: (ctx, child) {
          TabsRouter ecTabRouter = AutoTabsRouter.of(ctx);
          autoecTabRouter = ecTabRouter;

          _scrollController.animateTo(0,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut);

          return ValueListenableBuilder<TextDirection>(
              valueListenable: _layout,
              builder: (context, value, _) {
                return CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            color: isDark
                                ? ColorConst.scaffoldDark
                                : ColorConst.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 20.0),
                            child: Column(
                              children: [
                                _header(),
                                FxBox.h32,
                                _tabWithLogin(),
                              ],
                            ),
                          ),
                          ecTabRouter.activeIndex == 8 ||
                                  ecTabRouter.activeIndex == 9 ||
                                  ecTabRouter.activeIndex == 10
                              ? FxBox.shrink
                              : FxBox.h32,
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ecTabRouter.activeIndex == 8 ||
                                        ecTabRouter.activeIndex == 9 ||
                                        ecTabRouter.activeIndex == 10
                                    ? 0
                                    : 24.0),
                            child: getECRouteWidget(ecTabRouter.activeIndex),
                          ),
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: true,
                      child: Column(
                        children: [
                          const Expanded(child: SizedBox.shrink()),
                          _headerOffooter(),
                          const FooterPage(),
                        ],
                      ),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }

  Widget _headerOffooter() {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? ColorConst.scaffoldDark : ColorConst.white,
      ),
      child: isxl(context) || islg(context)
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _vdivider(),
                _iconWithText(
                  imagePath: Images.terms,
                  iconString: languageModel.landingPage.termsConditions,
                ),
                _vdivider(),
                _iconWithText(
                  imagePath: Images.privacyPolicy,
                  iconString: languageModel.landingPage.privacyPolicy,
                ),
                _vdivider(),
                _iconWithText(
                  imagePath: Images.deliveryPolicy,
                  iconString: languageModel.landingPage.deliveryPolicy,
                ),
                _vdivider(),
                _iconWithText(
                  imagePath: Images.cancellationPolicy,
                  iconString: languageModel.landingPage.cancellationPolicy,
                ),
                _vdivider(),
              ],
            )
          : Responsive.isTablet(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _vdivider(),
                    Column(
                      children: [
                        _iconWithText(
                          imagePath: Images.terms,
                          iconString: languageModel.landingPage.termsConditions,
                        ),
                        FxBox.h20,
                        _iconWithText(
                          imagePath: Images.privacyPolicy,
                          iconString: languageModel.landingPage.privacyPolicy,
                        ),
                      ],
                    ),
                    _vdivider(),
                    Column(
                      children: [
                        _iconWithText(
                          imagePath: Images.deliveryPolicy,
                          iconString: languageModel.landingPage.deliveryPolicy,
                        ),
                        FxBox.h20,
                        _iconWithText(
                          imagePath: Images.cancellationPolicy,
                          iconString:
                              languageModel.landingPage.cancellationPolicy,
                        ),
                      ],
                    ),
                    _vdivider(),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FxBox.h20,
                    _iconWithText(
                      imagePath: Images.terms,
                      iconString: languageModel.landingPage.termsConditions,
                    ),
                    FxBox.h20,
                    _iconWithText(
                      imagePath: Images.privacyPolicy,
                      iconString: languageModel.landingPage.privacyPolicy,
                    ),
                    FxBox.h20,
                    _iconWithText(
                      imagePath: Images.deliveryPolicy,
                      iconString: languageModel.landingPage.deliveryPolicy,
                    ),
                    FxBox.h20,
                    _iconWithText(
                      imagePath: Images.cancellationPolicy,
                      iconString: languageModel.landingPage.cancellationPolicy,
                    ),
                    FxBox.h20,
                  ],
                ),
    );
  }

  Widget _vdivider() {
    return Container(
      constraints: const BoxConstraints(maxHeight: 120),
      child: const VerticalDivider(),
    );
  }

  Widget _iconWithText({
    required String imagePath,
    required String iconString,
  }) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 30,
            color: !isDark ? ColorConst.black : ColorConst.white,
          ),
          FxBox.h12,
          ConstText.lightText(
            text: iconString,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  Widget _tabWithLogin() {
    return Container(
      color: isDark ? ColorConst.scaffoldDark : ColorConst.white,
      width: MediaQuery.of(context).size.width,
      child: Responsive.isMobile(context) || Responsive.isTablet(context)
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _loginRegister(),
                    _textButton(
                        onPressed: () {
                          context.router.push(const FMenuBar());
                        },
                        text: 'Go to Dashboard'),
                  ],
                ),
                FxBox.h16,
                _tabBar(),
              ],
            )
          : Row(
              children: [
                FxBox.w(100),
                _tabBar(),
                const Spacer(),
                _loginRegister(),
                FxBox.w24,
                _textButton(
                    onPressed: () {
                      context.router.push(const FMenuBar());
                    },
                    text: 'Go to Dashboard'),
              ],
            ),
    );
  }

  Widget _loginRegister() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _textButton(
            onPressed: () {
              autoecTabRouter!.setActiveIndex(8);
            },
            text: languageModel.landingPage.login),
        ConstText.lightText(text: '/'),
        _textButton(
            onPressed: () {
              autoecTabRouter!.setActiveIndex(9);
            },
            text: languageModel.landingPage.register),
      ],
    );
  }

  Widget _tabBar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _textButton(
              onPressed: () {
                autoecTabRouter!.setActiveIndex(0);
              },
              text: languageModel.landingPage.home),
          FxBox.w10,
          _textButton(
              onPressed: () {
                autoecTabRouter!.setActiveIndex(1);
              },
              text: languageModel.landingPage.blog),
          FxBox.w10,
          _textButton(
              onPressed: () {
                autoecTabRouter!.setActiveIndex(2);
              },
              text: languageModel.landingPage.category.trim()),
          FxBox.w10,
          _textButton(
              onPressed: () {
                autoecTabRouter!.setActiveIndex(3);
              },
              text: languageModel.landingPage.brand),
          FxBox.w10,
          _textButton(
              onPressed: () {
                autoecTabRouter!.setActiveIndex(4);
              },
              text: languageModel.landingPage.offer),
        ],
      ),
    );
  }

  Widget _textButton({
    required void Function()? onPressed,
    required String text,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: ConstText.lightText(
        text: text,
        color: isDark ? ColorConst.white : ColorConst.black,
      ),
    );
  }

  Widget _header() {
    return Container(
      color: isDark ? ColorConst.scaffoldDark : ColorConst.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 240,
            padding: const EdgeInsets.symmetric(horizontal: 61),
            color: ColorConst.transparent,
            child: Image.asset(
                isDark ? Images.oldlgDarkLogo : Images.oldlgLightLogo),
          ),
          const Spacer(),

          (Responsive.isMobile(context) || Responsive.isTablet(context))
              ? MaterialButton(
                  minWidth: 60,
                  hoverColor: ColorConst.transparent,
                  onPressed: () {},
                  child: const SvgIcon(icon: IconlyBroken.search),
                )
              : Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  width: islg(context) ? 500 : 600,
                  child: TextField(
                    cursorWidth: 1,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey.shade50),
                      ),
                      contentPadding: const EdgeInsets.fromLTRB(12, 4, 0, 4),
                      hintText: languageModel.translate('search'),
                      hintStyle: const TextStyle(fontSize: 15),
                      suffixIcon: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        color: ColorConst.black,
                        minWidth: 60,
                        hoverColor: ColorConst.transparent,
                        onPressed: () {},
                        child: const SvgIcon(
                          icon: IconlyBroken.search,
                          color: ColorConst.white,
                        ),
                      ),
                      isCollapsed: true,
                    ),
                  ),
                ),

          // if (Responsive.isMobile(context) || Responsive.isTablet(context)) ...[
          //   MaterialButton(
          //     height: double.infinity,
          //     minWidth: 60,
          //     hoverColor: ColorConst.transparent,
          //     onPressed: () {},
          //     child: const SvgIcon(icon: IconlyBroken.search),
          //   )
          // ],
          if (!Responsive.isMobile(context)) ...[
            FxBox.w16,
            _iconWithBadge(
              badgeText: '2',
              icon: Icons.compare_arrows,
              title: languageModel.landingPage.compare,
              onTap: () {
                autoecTabRouter!.setActiveIndex(5);
              },
            ),
            FxBox.w12,
            _iconWithBadge(
              badgeText: '3',
              icon: Icons.favorite_outline_outlined,
              title: languageModel.landingPage.wishlist,
              onTap: () {
                autoecTabRouter!.setActiveIndex(6);
              },
            ),
            FxBox.w12,
            _iconWithBadge(
              badgeText: '0',
              icon: Icons.shopping_bag_outlined,
              title: languageModel.landingPage.cart.trim(),
              onTap: () {
                autoecTabRouter!.setActiveIndex(7);
              },
            ),
          ],
        ],
      ),
    );
  }

  Widget _iconWithBadge(
      {required String badgeText,
      required IconData icon,
      required String title,
      void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Badge(
            label: Text(
              badgeText,
              style: const TextStyle(color: ColorConst.white),
            ),
            backgroundColor: ColorConst.black,
            child: Icon(
              icon,
              size: 26,
            ),
          ),
          FxBox.w6,
          CustomText(title: title),
        ],
      ),
    );
  }
}
