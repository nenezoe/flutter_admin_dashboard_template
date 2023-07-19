// ignore_for_file: prefer_const_constructors

import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/views/calender/calender.dart';
import 'package:admin_dashboard/src/admin/views/charts/chartist.dart';
import 'package:admin_dashboard/src/admin/views/charts/chartjs.dart';
import 'package:admin_dashboard/src/admin/views/charts/morris_chart.dart';
import 'package:admin_dashboard/src/admin/views/dashboard/dashboard.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/cart/cart_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/category/category_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/category/sub_category.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/compare_screen/compare_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/coupon/coupons_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/customer/customer_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/e_auth/e_forgot.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/e_auth/e_login.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/e_auth/e_register.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/e_cart/e_cart.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/e_commerce_dashboard/e_commerce_dashboard_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/blog/blog_details_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/blog/blog_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/brand/all_brand_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/category/category_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/home/product_home.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/offers/offers_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/payment/landing_payment.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/landing_page/payment/landing_success.dart';

import 'package:admin_dashboard/src/admin/views/e_commerce/order/order_invoice.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/order/order_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/order_history/order_history.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/payment/payment_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/payment/success_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/products/product_detail_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/products/products_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/return_condition/return_condition_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/return_order/return_order_invoice.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/return_order/return_order_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/show_product_screen/show_product_details.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/subscription/subscription_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/vender/vender_detail_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/vender/vender_screen.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/products/product_add.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/wish_list/wish_list.dart';
import 'package:admin_dashboard/src/admin/views/email_templates/alert_email.dart';
import 'package:admin_dashboard/src/admin/views/email_templates/basic_email.dart';
import 'package:admin_dashboard/src/admin/views/email_templates/billing_email.dart';
import 'package:admin_dashboard/src/admin/views/extra_pages/directory.dart';
import 'package:admin_dashboard/src/admin/views/extra_pages/faqs.dart';
import 'package:admin_dashboard/src/admin/views/extra_pages/gallery.dart';
import 'package:admin_dashboard/src/admin/views/extra_pages/invoice.dart';
import 'package:admin_dashboard/src/admin/views/extra_pages/pricing.dart';
import 'package:admin_dashboard/src/admin/views/extra_pages/timeline.dart';
import 'package:admin_dashboard/src/admin/views/forms/elements_form.dart';
import 'package:admin_dashboard/src/admin/views/forms/file_upload_form.dart';
import 'package:admin_dashboard/src/admin/views/forms/mask_form.dart';
import 'package:admin_dashboard/src/admin/views/forms/repeater_form.dart';
import 'package:admin_dashboard/src/admin/views/forms/validation_form.dart';
import 'package:admin_dashboard/src/admin/views/forms/wizard_form.dart';
import 'package:admin_dashboard/src/admin/views/map/map.dart';
import 'package:admin_dashboard/src/admin/views/tables/basic_table.dart';
import 'package:admin_dashboard/src/admin/views/tables/data_tables.dart';
import 'package:admin_dashboard/src/admin/views/tables/editable_table.dart';
import 'package:admin_dashboard/src/admin/views/tables/responsive_table.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/track_order/track_order.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/alert/alert_dialog.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/badge/custom_badge.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/buttons/button.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/carousel/carousel.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/date_picker/date_picker.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/draganddrop/drag_and_drop_element.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/dropdown/dropdown_screen.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/loader/loader.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/modal/modal.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/rating/rating.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/tabbar/tabs_screen.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/toast/toast.dart';
import 'package:admin_dashboard/src/admin/views/ui_elements/videos/video_screen.dart';
import 'package:admin_dashboard/src/admin/views/user/user_profile.dart';
import 'package:flutter/material.dart';

int getRouteIndex(String route) {
  if (route == Strings.buttons) {
    return 1;
  } else if (route == Strings.rating) {
    return 2;
  } else if (route == Strings.badge) {
    return 3;
  } else if (route == Strings.toast) {
    return 4;
  } else if (route == Strings.alertDialog) {
    return 5;
  } else if (route == Strings.modal) {
    return 6;
  } else if (route == Strings.basicActionEmail) {
    return 7;
  } else if (route == Strings.alertEmail) {
    return 8;
  } else if (route == Strings.billingEmail) {
    return 9;
  } else if (route == Strings.loader) {
    return 10;
  } else if (route == Strings.morrisChart) {
    return 11;
  } else if (route == Strings.chartistChart) {
    return 12;
  } else if (route == Strings.chartJsChart) {
    return 13;
  } else if (route == Strings.basicTable) {
    return 14;
  } else if (route == Strings.dataTable) {
    return 15;
  } else if (route == Strings.responsiveTable) {
    return 16;
  } else if (route == Strings.editableTable) {
    return 17;
  } else if (route == Strings.timeline) {
    return 18;
  } else if (route == Strings.pricing) {
    return 19;
  } else if (route == Strings.directory) {
    return 20;
  } else if (route == Strings.faqs) {
    return 21;
  } else if (route == Strings.invoice) {
    return 22;
  } else if (route == Strings.gallery) {
    return 23;
  } else if (route == Strings.carousel) {
    return 24;
  } else if (route == Strings.tabs) {
    return 25;
  } else if (route == Strings.calendar) {
    return 26;
  } else if (route == Strings.formElements) {
    return 27;
  } else if (route == Strings.formValidation) {
    return 28;
  } else if (route == Strings.formFileUpload) {
    return 29;
  } else if (route == Strings.formRepeater) {
    return 30;
  } else if (route == Strings.formWizard) {
    return 31;
  } else if (route == Strings.formMask) {
    return 32;
  } else if (route == Strings.videoPlayer) {
    return 33;
  } else if (route == Strings.map) {
    return 34;
  } else if (route == Strings.userProfile) {
    return 35;
  } else if (route == Strings.dragDrop) {
    return 36;
  } else if (route == Strings.datePicker) {
    return 37;
  } else if (route == Strings.products) {
    return 38;
  } else if (route == '${Strings.products}/products Detail') {
    return 39;
  } else if (route == Strings.category) {
    return 40;
  } else if (route == '${Strings.category}/${Strings.subCategory}') {
    return 41;
  } else if (route == Strings.vendor) {
    return 42;
  } else if (route == '${Strings.vendor}/vender Detail') {
    return 43;
  } else if (route == Strings.customer) {
    return 44;
  } else if (route == Strings.payment) {
    return 45;
  } else if (route == Strings.returnOrder) {
    return 46;
  } else if (route == '${Strings.returnOrder}/return Order Invoice') {
    return 47;
  } else if (route == Strings.subscriber) {
    return 48;
  } else if (route == Strings.coupons) {
    return 49;
  } else if (route == Strings.order) {
    return 50;
  } else if (route == '${Strings.order}/order Invoice') {
    return 51;
  } else if (route == Strings.returnCondition) {
    return 52;
  } else if (route == Strings.eCommerceDashboard) {
    return 53;
  } else if (route == Strings.cart) {
    return 54;
  } else if (route == Strings.productAdd) {
    return 55;
  } else if (route == '${Strings.payment}/success') {
    return 56;
  } else if (route == Strings.dropDown) {
    return 57;
  }
  // else if (route == Strings.landingPage) {
  //   return 58;
  // }
  else {
    return 0;
  }
}

Widget getRouteWidget(int index) {
  if (index == 1) {
    return  Button();
  } else if (index == 2) {
    return  Rating();
  } else if (index == 3) {
    return  CustomBadge();
  } else if (index == 4) {
    return Toast();
  } else if (index == 5) {
    return AlertDialogBox();
  } else if (index == 6) {
    return Modal();
  } else if (index == 7) {
    return BasicEmail();
  } else if (index == 8) {
    return AlertEmail();
  } else if (index == 9) {
    return BillingEmail();
  } else if (index == 10) {
    return Loaders();
  } else if (index == 11) {
    return MorrisChart();
  } else if (index == 12) {
    return ChartListChart();
  } else if (index == 13) {
    return ChartJsChart();
  } else if (index == 14) {
    return BasicTable();
  } else if (index == 15) {
    return Datatable();
  } else if (index == 16) {
    return ResponsiveTable();
  } else if (index == 17) {
    return EditableTable();
  } else if (index == 18) {
    return TimelineScreen();
  } else if (index == 19) {
    return Pricing();
  } else if (index == 20) {
    return Cards();
  } else if (index == 21) {
    return FAQs();
  } else if (index == 22) {
    return Invoice();
  } else if (index == 23) {
    return Gallery();
  } else if (index == 24) {
    return Carousel();
  } else if (index == 25) {
    return TabScreen();
  } else if (index == 26) {
    return Calendar();
  } else if (index == 27) {
    return ElementsForm();
  } else if (index == 28) {
    return ValidationForm();
  } else if (index == 29) {
    return FileUploadForm();
  } else if (index == 30) {
    return RepeaterForm();
  } else if (index == 31) {
    return WizardForm();
  } else if (index == 32) {
    return MaskForm();
  } else if (index == 33) {
    return VideoScreen();
  } else if (index == 34) {
    return GoogleMaps();
  } else if (index == 35) {
    return UserProfile();
  } else if (index == 36) {
    return DragAndDrop();
  } else if (index == 37) {
    return DatePicker();
  } else if (index == 38) {
    return ProductsScreen();
  } else if (index == 39) {
    return ProductDetailScreen();
  } else if (index == 40) {
    return CategoryScreen();
  } else if (index == 41) {
    return SubCategoryScreen();
  } else if (index == 42) {
    return VenderScreen();
  } else if (index == 43) {
    return VenderDetailScreen();
  } else if (index == 44) {
    return CustomerScreen();
  } else if (index == 45) {
    return PaymentScreen();
  } else if (index == 46) {
    return ReturnOrderScreen();
  } else if (index == 47) {
    return ReturnOrderInvoice();
  } else if (index == 48) {
    return SubScriptionScreen();
  } else if (index == 49) {
    return CouponsScreen();
  } else if (index == 50) {
    return OrderScreen();
  } else if (index == 51) {
    return OrderInvoice();
  } else if (index == 52) {
    return ReturnConditionScreen();
  } else if (index == 53) {
    return EcommerceDashboard();
  } else if (index == 54) {
    return CartScreen();
  } else if (index == 55) {
    return ProductAdd();
  } else if (index == 56) {
    return SuccessScreen();
  } else if (index == 57) {
    return DropDownScreen();
  }
  // else if (index == 58) {
  //   return ECLandingPage();
  // }
  else {
    return Dashboard();
  }
}

Widget getECRouteWidget(int index) {
  if (index == 1) {
    return BlogScreen();
  } else if (index == 2) {
    return AllCategoryScreen();
  } else if (index == 3) {
    return AllBrandScreen();
  } else if (index == 4) {
    return OffersScreen();
  } else if (index == 5) {
    return CompareScreen();
  } else if (index == 6) {
    return WishList();
  } else if (index == 7) {
    return ECartScreen();
  } else if (index == 8) {
    return ELogin();
  } else if (index == 9) {
    return ERegister();
  } else if (index == 10) {
    return EForgot();
  } else if (index == 11) {
    return TrackOrder();
  } else if (index == 12) {
    return OrderHistory();
  } else if (index == 13) {
    return ShowProductDetails();
  } else if (index == 14) {
    return LandingPaymentScreen();
  } else if (index == 15) {
    return LandingSuccessScreen();
  } else if (index == 16) {
    return BlogDetailsScreen();
  } else {
    return ProductHomeScreen();
  }
}
