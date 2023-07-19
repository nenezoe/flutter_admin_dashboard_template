import 'package:auto_route/auto_route.dart';

import 'routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
  //  AutoRoute(
  //     path: '/login-one',
  //     page: LoginOne.page,
  //     initial: true,
  //   ),
    AutoRoute(
      path: '/',
      page: FMenuBar.page,
      children: [
        AutoRoute(path: '', page: Dashboard.page),
        AutoRoute(path: 'calendar', page: Calendar.page),
        AutoRoute(path: 'map', page: GoogleMaps.page),
        AutoRoute(path: 'toast', page: Toast.page),
        AutoRoute(path: 'button-element', page: Button.page),
        AutoRoute(path: 'rating-bar', page: Rating.page),
        AutoRoute(path: 'badge', page: CustomBadge.page),
        AutoRoute(path: 'alert-dialog', page: AlertDialogBox.page),
        AutoRoute(path: 'modal', page: Modal.page),
        AutoRoute(path: 'loaders', page: Loaders.page),
        AutoRoute(path: 'tabs', page: TabScreen.page),
        AutoRoute(path: 'basic-action-email', page: BasicEmail.page),
        AutoRoute(path: 'alert-email', page: AlertEmail.page),
        AutoRoute(path: 'billing-email', page: BillingEmail.page),
        AutoRoute(path: 'morris-chart', page: MorrisChart.page),
        AutoRoute(path: 'chartist-chart', page: ChartListChart.page),
        AutoRoute(path: 'chartjs-chart', page: ChartJsChart.page),
        AutoRoute(path: 'basic-table', page: BasicTable.page),
        AutoRoute(path: 'data-table', page: Datatable.page),
        AutoRoute(path: 'responsive-table', page: ResponsiveTable.page),
        AutoRoute(path: 'editable-table', page: EditableTable.page),
        AutoRoute(path: 'timeline', page: TimelineScreen.page),
        AutoRoute(path: 'pricing', page: Pricing.page),
        AutoRoute(path: 'card', page: Cards.page),
        AutoRoute(path: 'FAQs', page: FAQs.page),
        AutoRoute(path: 'invoice', page: Invoice.page),
        AutoRoute(path: 'gallery', page: Gallery.page),
        AutoRoute(path: 'carousel-slider', page: Carousel.page),
        AutoRoute(path: 'elements', page: ElementsForm.page),
        AutoRoute(path: 'validation', page: ValidationForm.page),
        AutoRoute(path: 'dropzone', page: FileUploadForm.page),
        AutoRoute(path: 'repeater', page: RepeaterForm.page),
        AutoRoute(path: 'mask', page: MaskForm.page),
        AutoRoute(path: 'wizard', page: WizardForm.page),
        AutoRoute(path: 'video-player', page: VideoScreen.page),
        AutoRoute(path: 'user-profile', page: UserProfile.page),
        AutoRoute(path: 'drag-drop', page: DragAndDrop.page),
        AutoRoute(path: 'date-picker', page: DatePicker.page),
        AutoRoute(path: 'products', page: ProductsScreen.page),
        AutoRoute(
            path: 'products/products-detail', page: ProductDetailScreen.page),
        AutoRoute(path: 'category', page: CategoryScreen.page),
        AutoRoute(path: 'category/sub-category', page: SubCategoryScreen.page),
        AutoRoute(path: 'vendor', page: VenderScreen.page),
        AutoRoute(path: 'vendor/vendor-detail', page: VenderDetailScreen.page),
        AutoRoute(path: 'customer', page: CustomerScreen.page),
        AutoRoute(path: 'payment', page: PaymentScreen.page),
        AutoRoute(path: 'payment/success', page: SuccessScreen.page),
        AutoRoute(path: 'return-order', page: ReturnOrderScreen.page),
        AutoRoute(path: 'order', page: OrderScreen.page),
        AutoRoute(
            path: 'return-order/return-order-invoice',
            page: ReturnOrderInvoice.page),
        AutoRoute(path: 'order/order-invoice', page: OrderInvoice.page),
        AutoRoute(path: 'subscribers', page: SubScriptionScreen.page),
        AutoRoute(path: 'coupons', page: CouponsScreen.page),
        AutoRoute(path: 'return-condition', page: ReturnConditionScreen.page),
        AutoRoute(path: 'e-commerce-dashboard', page: EcommerceDashboard.page),
        AutoRoute(path: 'cart', page: CartScreen.page),
        AutoRoute(path: 'product-add', page: ProductAdd.page),
        AutoRoute(path: 'dropdown', page: DropDownScreen.page),
      ],
    ),
    AutoRoute(
      path: '/landing-page/',
      page: ECLandingRoute.page,
      children: [
        AutoRoute(path: '', page: ProductHomeScreen.page),
        AutoRoute(path: 'blog', page: BlogScreen.page),
        AutoRoute(path: 'all-category', page: AllCategoryScreen.page),
        AutoRoute(path: 'all-brand', page: AllBrandScreen.page),
        AutoRoute(path: 'offer', page: OffersScreen.page),
        AutoRoute(path: 'Compare', page: CompareScreen.page),
        AutoRoute(path: 'Compare', page: CompareScreen.page),
        AutoRoute(path: 'wish-list', page: WishList.page),
        AutoRoute(path: 'landing-cart', page: ECartScreen.page),
        AutoRoute(path: 'landing-login', page: ELogin.page),
        AutoRoute(path: 'landing-register', page: ERegister.page),
        AutoRoute(path: 'landing-forgot', page: EForgot.page),
        AutoRoute(path: 'order-history', page: OrderHistory.page),
        AutoRoute(path: 'track-order', page: TrackOrder.page),
        AutoRoute(path: 'show-product-detail', page: ShowProductDetails.page),
        AutoRoute(path: 'payment', page: LandingPaymentScreen.page),
        AutoRoute(path: 'payment/success', page: LandingSuccessScreen.page),
        AutoRoute(path: 'blog/blog-detail', page: BlogDetailsScreen.page),
      ],
    ),
    AutoRoute(path: '/login-one', page: LoginOne.page),
    AutoRoute(path: '/login-two', page: LoginTwo.page),
    AutoRoute(path: '/register-one', page: RegisterOne.page),
    AutoRoute(path: '/register-two', page: RegisterTwo.page),
    AutoRoute(path: '/recover-password-one', page: RecoverPasswordOne.page),
    AutoRoute(path: '/recover-password-two', page: RecoverPasswordTwo.page),
    AutoRoute(path: '/lock-screen-one', page: LockScreenOne.page),
    AutoRoute(path: '/lock-screen-two', page: LockScreenTwo.page),
    AutoRoute(path: '/error-404', page: Error404.page),
    AutoRoute(path: '/error-500', page: Error500.page),
    AutoRoute(path: '/coming-soon', page: ComingSoon.page),
    AutoRoute(path: '/maintenance', page: Maintenance.page),

    /// Indrid Routes
    AutoRoute(
      path: '/ingrid/',
      page: Ingrid.page,
      children: [
        RedirectRoute(path: '', redirectTo: 'dashboard'),
        AutoRoute(path: 'dashboard', page: IngridDashboard.page),
        AutoRoute(path: 'crypto', page: Crypto.page),
        AutoRoute(path: 'kanban', page: Kanban.page),
        AutoRoute(path: 'invoice', page: IngridInvoice.page),
        AutoRoute(path: 'user', page: User.page),
        AutoRoute(path: 'contact', page: InGridContactScreen.page),
        AutoRoute(path: 'calender', page: InGridCalendar.page),
        AutoRoute(path: 'banking', page: BankScreen.page),
        AutoRoute(path: 'chat', page: ChatScreen.page),
        AutoRoute(path: 'file-manager', page: FileManager.page),
        AutoRoute(path: 'email', page: EmailScreen.page),
        AutoRoute(path: 'todo-list', page: ToDoScreen.page),
      ],
    ),
  ];
}
