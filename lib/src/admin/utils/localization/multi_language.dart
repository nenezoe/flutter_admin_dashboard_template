// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:admin_dashboard/src/admin/provider/localization/localization_bloc.dart';
import 'package:admin_dashboard/src/admin/utils/hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';

final LanguageModel languageModel = LanguageModel();

class LanguageModel extends Model {
  static const Locale en = Locale('en');
  static const Locale hi = Locale('hi');

  Locale _appLocale = const Locale.fromSubtags(languageCode: 'en');

  Locale get locale {
    // handleLocale();
    notifyListeners();
    return _appLocale;
  }

  List<Locale> get supportedLocales => [en, hi];

  late Map<String, dynamic> _localizedString;

  /// Load JSON file form assets
  Future<bool> load() async {
    try {
      String jsonString = await rootBundle
          .loadString('assets/language/${locale.languageCode}.json');
      _localizedString = jsonDecode(jsonString);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Change localization
  Future<void> changeLanguage() async {
    if (_appLocale == hi) {
      HiveUtils.set(HiveKeys.locale, 'en');
      _appLocale = en;
      await load();
    } else {
      HiveUtils.set(HiveKeys.locale, 'hi');
      _appLocale = hi;
      await load();
    }
    localizationBloc.add(const LocalizationEvent.changeLanguage());
  }

  String translate(String key) => _localizedString[key];

  String get lorem1 => languageModel.translate('lorem1');
  String get lorem2 => languageModel.translate('lorem2');
  String get lorem3 => languageModel.translate('lorem3');

  final _Dashboard dashboard = _Dashboard();
  final _Calendar calendar = _Calendar();
  final _Widget widget = _Widget();
  final _Form form = _Form();
  final _Chart chart = _Chart();
  final _Table table = _Table();
  final _Authentication authentication = _Authentication();
  final _EmailTemplate emailTemplate = _EmailTemplate();
  final _ExtraPage extraPage = _ExtraPage();
  final _ECommerceAdmin eCommerceAdmin = _ECommerceAdmin();
  final _ECommerceWeb eCommerceWeb = _ECommerceWeb();
  final _LandingPage landingPage = _LandingPage();
}

class MultiLanguage {
  final Locale locale;
  MultiLanguage({this.locale = const Locale.fromSubtags(languageCode: 'en')});

  static MultiLanguage? of(BuildContext context) {
    return Localizations.of<MultiLanguage>(context, MultiLanguage);
  }

  static const LocalizationsDelegate<MultiLanguage> delegate =
      _MultiLanguageDelegate();

  final supportedLocale = [const Locale('en'), const Locale('hi')];

  late Map<String, dynamic> _localizedString;

  Future<bool> load() async {
    try {
      String jsonString = await rootBundle
          .loadString('assets/language/${locale.languageCode}.json');
      _localizedString = jsonDecode(jsonString);
      return true;
    } catch (e) {
      return false;
    }
  }

  String translate(String key) {
    return _localizedString[key];
  }
}

class _MultiLanguageDelegate extends LocalizationsDelegate<MultiLanguage> {
  // This delegate instance will never change
  // It can provide a constant constructor.
  const _MultiLanguageDelegate();
  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'hi'].contains(locale.languageCode);
  }

  /// read Json
  @override
  Future<MultiLanguage> load(Locale locale) async {
    // MultiLanguages class is where the JSON loading actually runs

    MultiLanguage localizations = MultiLanguage(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_MultiLanguageDelegate old) => true;
}

class _Dashboard {
  String get cancel => languageModel.translate('cancel');
  String get monthlyIncome => languageModel.translate('monthlyIncome');
  String get thisMonth => languageModel.translate('thisMonth');
  String get lastMonth => languageModel.translate('lastMonth');
  String get chartLorem => languageModel.translate('chartLorem');
  String get monthlyReport => languageModel.translate('monthlyReport');
  String get monthlySalesReport =>
      languageModel.translate('monthlySalesReport');
  String get website => languageModel.translate('website');
  String get desktop => languageModel.translate('desktop');
  String get mobile => languageModel.translate('mobile');
  String get chat => languageModel.translate('chat');
  String get msg1 => languageModel.translate('msg1');
  String get msg2 => languageModel.translate('msg2');
  String get msg3 => languageModel.translate('msg3');
  String get msg4 => languageModel.translate('msg4');
  String get msg5 => languageModel.translate('msg5');
  String get enterYourText => languageModel.translate('enterYourText');
  String get send => languageModel.translate('send');
  String get orderSuccessful => languageModel.translate('orderSuccessful');
  String get orderText => languageModel.translate('orderText');
  String get viewOrder => languageModel.translate('viewOrder');
  String get topProductSale => languageModel.translate('topProductSale');
  String get computer => languageModel.translate('computer');
  String get clientReviews => languageModel.translate('clientReviews');
  String get revirewText => languageModel.translate('revirewText');
  String get activity => languageModel.translate('activity');
  String get step => languageModel.translate('step');
  String get latestOrder => languageModel.translate('latestOrder');
  String get id => languageModel.translate('id');
  String get name => languageModel.translate('name');
  String get product => languageModel.translate('product');
  String get orderDate => languageModel.translate('orderDate');
  String get amount => languageModel.translate('amount');
  String get deliveryStatus => languageModel.translate('deliveryStatus');
  String get mobileApp => languageModel.translate('mobileApp');
  String get desktopApp => languageModel.translate('desktopApp');
}

class _Calendar {
  String get createEvent => languageModel.translate('createEvent');
  String get calendarTitle => languageModel.translate('calendarTitle');
}

class _Widget {
  String get simpleToast => languageModel.translate('simpleToast');
  String get lightBackgroundToast =>
      languageModel.translate('lightBackgroundToast');
  String get iconToast => languageModel.translate('iconToast');
  String get primary => languageModel.translate('primary');
  String get secondary => languageModel.translate('secondary');
  String get success => languageModel.translate('success');
  String get error => languageModel.translate('error');
  String get warning => languageModel.translate('warning');
  String get info => languageModel.translate('info');
  String get simpleButtons => languageModel.translate('simpleButtons');
  String get outlineButtons => languageModel.translate('outlineButtons');
  String get simpleWithIconButtons =>
      languageModel.translate('simpleWithIconButtons');
  String get outlineWithIconButtons =>
      languageModel.translate('outlineWithIconButtons');
  String get simpleIconButtons => languageModel.translate('simpleIconButtons');
  String get outlineIconButtons =>
      languageModel.translate('outlineIconButtons');
  String get socialButtons => languageModel.translate('socialButtons');
  String get outlinedSocialButtons =>
      languageModel.translate('outlinedSocialButtons');
  String get defaultRating => languageModel.translate('defaultRating');
  String get halfRating => languageModel.translate('halfRating');
  String get disableRating => languageModel.translate('disableRating');
  String get customIconRating => languageModel.translate('customIconRating');
  String get simpleBadge => languageModel.translate('simpleBadge');
  String get outlineBadge => languageModel.translate('outlineBadge');
  String get simpleAlert => languageModel.translate('simpleAlert');
  String get iconAlert => languageModel.translate('iconAlert');
  String get alertWithTwoButton =>
      languageModel.translate('alertWithTwoButton');
  String get iconAlertWithTwoButton =>
      languageModel.translate('iconAlertWithTwoButton');
  String get gifAlert => languageModel.translate('gifAlert');
  String get alertWithTextfield =>
      languageModel.translate('alertWithTextfield');
  String get thisIs => languageModel.translate('thisIs');
  String get dialogBox => languageModel.translate('dialogBox');
  String get simpleModal => languageModel.translate('simpleModal');
  String get modalWithButton => languageModel.translate('modalWithButton');
  String get largeModal => languageModel.translate('largeModal');
  String get extraLargeModal => languageModel.translate('extraLargeModal');
  String get scrollableModal => languageModel.translate('scrollableModal');
  String get modalLorem => languageModel.translate('modalLorem');
  String get home => languageModel.translate('home');
  String get profile => languageModel.translate('profile');
  String get messages => languageModel.translate('messages');
  String get settings => languageModel.translate('settings');
  String get extra => languageModel.translate('extra');
  String get tabLorem => languageModel.translate('tabLorem');
  String get carouselWithIndicators =>
      languageModel.translate('carouselWithIndicators');
  String get carouselWithCaptions =>
      languageModel.translate('carouselWithCaptions');
  String get firstSlideLabel => languageModel.translate('firstSlideLabel');
  String get secondSlideLabel => languageModel.translate('secondSlideLabel');
  String get thirdSlideLabel => languageModel.translate('thirdSlideLabel');
  String get singleVideo => languageModel.translate('thirdSlideLabel');
  String get multipleVideo => languageModel.translate('thirdSlideLabel');
  String get dragAndDrop => languageModel.translate('dragAndDrop');
  String get basic => languageModel.translate('basic');
  String get dateFormat => languageModel.translate('dateFormat');
  String get dateRange => languageModel.translate('dateRange');
  String get datePickerText => languageModel.translate('datePickerText');
  String get simpleDropdown => languageModel.translate('simpleDropdown');
  String get searchDropDown => languageModel.translate('searchDropdown');
  String get city => languageModel.translate('city');
  String get country => languageModel.translate('country');
}

class _Form {
  String get inputElements => languageModel.translate('inputElements');
  String get text => languageModel.translate('text');
  String get formSearch => languageModel.translate('formSearch');
  String get email => languageModel.translate('email');
  String get url => languageModel.translate('url');
  String get telephone => languageModel.translate('telephone');
  String get password => languageModel.translate('password');
  String get number => languageModel.translate('number');
  String get date => languageModel.translate('date');
  String get color => languageModel.translate('color');
  String get pickColor => languageModel.translate('pickColor');
  String get select => languageModel.translate('select');
  String get validationForm => languageModel.translate('validationForm');
  String get fullName => languageModel.translate('fullName');
  String get username => languageModel.translate('username');
  String get emailID => languageModel.translate('emailID');
  String get moileNo => languageModel.translate('moileNo');
  String get state => languageModel.translate('state');
  String get zip => languageModel.translate('zip');
  String get inputTypeValidation =>
      languageModel.translate('inputTypeValidation');
  String get required => languageModel.translate('required');
  String get digits => languageModel.translate('digits');
  String get alphanumeric => languageModel.translate('alphanumeric');
  String get inputRangeValidation =>
      languageModel.translate('inputRangeValidation');
  String get rangeLength => languageModel.translate('rangeLength');
  String get minValue => languageModel.translate('minValue');
  String get maxValue => languageModel.translate('maxValue');
  String get rangeValue => languageModel.translate('rangeValue');
  String get regularExp => languageModel.translate('regularExp');
  String get nameError => languageModel.translate('nameError');
  String get userNameError => languageModel.translate('userNameError');
  String get cityError => languageModel.translate('cityError');
  String get stateError => languageModel.translate('stateError');
  String get zipError => languageModel.translate('zipError');
  String get requiredError => languageModel.translate('requiredError');
  String get emailError => languageModel.translate('emailError');
  String get urlError => languageModel.translate('urlError');
  String get digitError => languageModel.translate('digitError');
  String get numberError => languageModel.translate('numberError');
  String get alphanumericError => languageModel.translate('alphanumericError');
  String get rangeLengthError => languageModel.translate('rangeLengthError');
  String get minValueError => languageModel.translate('minValueError');
  String get maxValueError => languageModel.translate('maxValueError');
  String get rangeValueError => languageModel.translate('rangeValueError');
  String get regularExpError => languageModel.translate('regularExpError');
  String get dropzoneText => languageModel.translate('dropzoneText');
  String get nestedForm => languageModel.translate('nestedForm');
  String get subject => languageModel.translate('subject');
  String get resume => languageModel.translate('resume');
  String get message => languageModel.translate('message');
  String get nestedFieldForm => languageModel.translate('nestedFieldForm');
  String get phoneNo => languageModel.translate('phoneNo');
  String get gender => languageModel.translate('gender');
  String get wizardForm => languageModel.translate('wizardForm');
  String get sellerDetails => languageModel.translate('sellerDetails');
  String get companyDocument => languageModel.translate('companyDocument');
  String get bankDetails => languageModel.translate('bankDetails');
  String get confirmDetails => languageModel.translate('confirmDetails');
  String get sellerName => languageModel.translate('sellerName');
  String get mobileNo => languageModel.translate('mobileNo');
  String get address => languageModel.translate('address');
  String get companyName => languageModel.translate('companyName');
  String get liveMarketAccount => languageModel.translate('liveMarketAccount');
  String get productCategory => languageModel.translate('productCategory');
  String get productSubCategory =>
      languageModel.translate('productSubCategory');
  String get contactPerson => languageModel.translate('contactPerson');
  String get panCard => languageModel.translate('panCard');
  String get vatTinNo => languageModel.translate('vatTinNo');
  String get cstNo => languageModel.translate('cstNo');
  String get serviceTaxNo => languageModel.translate('serviceTaxNo');
  String get companyUIN => languageModel.translate('companyUIN');
  String get declaration => languageModel.translate('declaration');
  String get nameOnCard => languageModel.translate('nameOnCard');
  String get creditCardType => languageModel.translate('creditCardType');
  String get creditCardNumber => languageModel.translate('creditCardNumber');
  String get cardVerificationNumber =>
      languageModel.translate('cardVerificationNumber');
  String get expirationDate => languageModel.translate('expirationDate');
  String get confirmText => languageModel.translate('confirmText');
  String get formMask => languageModel.translate('formMask');
  String get dateStyle => languageModel.translate('dateStyle');
  String get repeat => languageModel.translate('repeat');
  String get dateTime => languageModel.translate('dateTime');
  String get ipAddress => languageModel.translate('ipAddress');
  String get emailAddress => languageModel.translate('emailAddress');
}

class _Chart {
  String get lineChart => languageModel.translate('lineChart');
  String get barChart => languageModel.translate('barChart');
  String get areaChart => languageModel.translate('areaChart');
  String get donutChart => languageModel.translate('donutChart');
  String get columnChart => languageModel.translate('columnChart');
  String get animatingDonutWithSvg =>
      languageModel.translate('animatingDonutWithSvg');
  String get simplePieChart => languageModel.translate('simplePieChart');
  String get advancedSmileAnimation =>
      languageModel.translate('advancedSmileAnimation');
  String get simpleLineChart => languageModel.translate('simpleLineChart');
  String get lineScatterDiagram =>
      languageModel.translate('lineScatterDiagram');
  String get lineChartWithArea => languageModel.translate('lineChartWithArea');
  String get overlappingChart => languageModel.translate('overlappingChart');
  String get multipleStatisticsChart =>
      languageModel.translate('multipleStatisticsChart');
  String get polarChart => languageModel.translate('polarChart');
}

class _Table {
  String get simple => languageModel.translate('simple');
  String get striped => languageModel.translate('striped');
  String get hoverable => languageModel.translate('hoverable');
  String get contextual => languageModel.translate('contextual');
  String get bordered => languageModel.translate('bordered');
  String get borderless => languageModel.translate('borderless');
  String get small => languageModel.translate('small');
  String get dark => languageModel.translate('dark');
  String get id => languageModel.translate('id');
  String get customerName => languageModel.translate('customerName');
  String get mobileNo =>
      languageModel.translate('mobileNo').replaceFirst('.', '');
  String get amount => languageModel.translate('amount');
  String get dataTable => languageModel.translate('dataTable');
  String get productName => languageModel.translate('productName');
  String get quantity => languageModel.translate('quantity');
  String get emailID => languageModel.translate('emailID');
  String get responsiveTable => languageModel.translate('responsiveTable');
  String get firstName => languageModel.translate('firstName');
  String get lastName => languageModel.translate('lastName');
  String get userName => languageModel.translate('userName');
  String get department => languageModel.translate('department');
  String get editableTable => languageModel.translate('editableTable');
  String get birthDate => languageModel.translate('birthDate');
  String get gender => languageModel.translate('gender');
  String get edit => languageModel.translate('edit');
}

class _Authentication {
  String get signIn => languageModel.translate('signIn');
  String get signInHeader => languageModel.translate('signInHeader');
  String get signInText => languageModel.translate('signInText');
  String get email => '${languageModel.translate('email')}*';
  String get forgotPassword => languageModel.translate('forgotPassword');
  String get terms => languageModel.translate('confirmText');
  String get contactInformation =>
      languageModel.translate('contactInformation');
  String get phone => '${languageModel.translate('phone')}*';
  String get username => languageModel.translate('username');
  String get register => languageModel.translate('register');
  String get resetPassword => languageModel.translate('resetPassword');
  String get emailInstructions => languageModel.translate('emailInstructions');
  String get reset => languageModel.translate('reset');
  String get locked => languageModel.translate('locked');
  String get loackedText => languageModel.translate('loackedText');
  String get unlock => languageModel.translate('unlock');
}

class _EmailTemplate {
  String get basicEmail1 => languageModel.translate('basicEmail1');
  String get basicEmail2 => languageModel.translate('basicEmail2');
  String get confirmEmail => languageModel.translate('confirmEmail');
  String get supportTeam => languageModel.translate('supportTeam');
  String get emailWarning => languageModel.translate('emailWarning');
  String get alertEmail1 => languageModel.translate('alertEmail1');
  String get alertEmail2 => languageModel.translate('alertEmail2');
  String get alertEmail3 => languageModel.translate('alertEmail3');
  String get alertEmail4 => languageModel.translate('alertEmail4');
  String get alertEmail5 => languageModel.translate('alertEmail5');
  String get alertEmail6 => languageModel.translate('alertEmail6');
  String get alertEmail7 => languageModel.translate('alertEmail7');
}

class _ExtraPage {
  String get timelineTitle1 => languageModel.translate('timelineTitle1');
  String get timelineTitle2 => languageModel.translate('timelineTitle2');
  String get timelineTitle3 => languageModel.translate('timelineTitle3');
  String get timelineTitle4 => languageModel.translate('timelineTitle4');
  String get timelineText1 => languageModel.translate('timelineText1');
  String get timelineText2 => languageModel.translate('timelineText2');
  String get timelineText3 => languageModel.translate('timelineText3');
  String get timelineText4 => languageModel.translate('timelineText4');
  String get intro => 'Intro : ${languageModel.translate('timelineText1')}..  ';
  String get creativeDirector => languageModel.translate('creativeDirector');
  String get readMore => languageModel.translate('readMore');
  String get error1 => languageModel.translate('error1');
  String get error2 => languageModel.translate('error2');
  String get starter => languageModel.translate('starter');
  String get professional => languageModel.translate('professional');
  String get enterprise => languageModel.translate('enterprise');
  String get unlimited => languageModel.translate('unlimited');
  String get pricing1 => languageModel.translate('pricing1');
  String get pricing2 => languageModel.translate('pricing2');
  String get pricing3 => languageModel.translate('pricing3');
  String get pricing4 => languageModel.translate('pricing4');
  String get maintenancaTitle => languageModel.translate('maintenancaTitle');
  String get maintenancaSubtitle =>
      languageModel.translate('maintenancaSubtitle');
  String get maintenancaText => languageModel.translate('maintenancaText');
  String get commingSoon1 => languageModel.translate('commingSoon1');
  String get commingSoon2 => languageModel.translate('commingSoon2');
  String get faqText => languageModel.translate('faqText');
}

class _ECommerceAdmin {
  String get eCommerce => languageModel.translate('eCommerce');
  String get admin => languageModel.translate('admin');
  String get webSite => languageModel.translate('webSite');
  String get eCommerceDashboard =>
      languageModel.translate('eCommerceDashboard');
  String get productAdd => languageModel.translate('productAdd');
  String get venderDetail => languageModel.translate('vendorDetail');
  String get totalUser => languageModel.translate('totalUser');
  String get totalOrders => languageModel.translate('totalOrders');
  String get totalCancelledOrders =>
      languageModel.translate('totalCancelledOrders');
  String get totalReturnOrder => languageModel.translate('totalReturnOrder');
  String get totalVenders => languageModel.translate('totalVendors');
  String get payoutRequestProgress =>
      languageModel.translate('payoutRequestProgress');
  String get totalVelueSales => languageModel.translate('totalVelueSales');
  String get yourTotalBalance => languageModel.translate('yourTotalBalance');
  String get increasedBy => languageModel.translate('increasedBy');
  String get decreasedBy => languageModel.translate('decreasedBy');
  String get monthlyReport => languageModel.translate('monthlyReport');
  String get monthlyReportUser => languageModel.translate('monthlyReportUser');
  String get user => languageModel.translate('user');
  String get subscription => languageModel.translate('subscription');
  String get vender => languageModel.translate('vendor');
  String get total => languageModel.translate('total');
  String get globalSales => languageModel.translate('globalSales');
  String get id => languageModel.translate('id');
  String get countryLogo => languageModel.translate('countryLogo');
  String get countryName => languageModel.translate('countryName');
  String get totalSales => languageModel.translate('totalSales');
  String get salesOverview => languageModel.translate('salesOverview');
  String get traffics => languageModel.translate('traffics');
  String get sales => languageModel.translate('sales');
  String get latestTransaction => languageModel.translate('latestTransaction');
  String get name => languageModel.translate('name');
  String get product => languageModel.translate('product');
  String get orderDate => languageModel.translate('orderDate');
  String get amount => languageModel.translate('amount');
  String get deliveryStatus => languageModel.translate('deliveryStatus');
  String get productName => languageModel.translate('productName');
  String get category => languageModel.translate('category');
  String get expiryDate => languageModel.translate('expiryDate');
  String get unit => languageModel.translate('unit');
  String get image => languageModel.translate('image');
  String get categoryName => languageModel.translate('categoryName');
  String get status => languageModel.translate('status');
  String get emailAndMobile => languageModel.translate('emailAndMobile');
  String get customer => languageModel.translate('customer');
  String get order => languageModel.translate('order');
  String get orderID => languageModel.translate('orderID');
  String get customerName => languageModel.translate('customerName');
  String get orderAmount => languageModel.translate('orderAmount');
  String get phone => languageModel.translate('phone');
  String get dateOfJoin => languageModel.translate('dateOfJoin');
  String get bankName => languageModel.translate('bankName');
  String get bankType => languageModel.translate('bankType');
  String get accountNumberName => languageModel.translate('accountNumberName');
  String get monthlyOrder => languageModel.translate('monthlyOrder');
  String get paidDate => languageModel.translate('paidDate');
  String get totalEarning => languageModel.translate('totalEarning');
  String get totalPendingOrdres =>
      languageModel.translate('totalPendingOrdres');
  String get pendingSettlement => languageModel.translate('pendingSettlement');
  String get returnOrder => languageModel.translate('returnOrder');
  String get returnID => languageModel.translate('returnID');
  String get returnDate => languageModel.translate('returnDate');
  String get coupons => languageModel.translate('coupons');
  String get couponName => languageModel.translate('couponName');
  String get startDate => languageModel.translate('startDate');
  String get endDate => languageModel.translate('endDate');
  String get returnCondition => languageModel.translate('returnCondition');
  String get description => languageModel.translate('description');
  String get unitsInStock => languageModel.translate('unitsInStock');
}

class _ECommerceWeb {
  String get filter => languageModel.translate('filter');
  String get priceRange => languageModel.translate('priceRange');
  String get colors => languageModel.translate('colors');
  String get customerFeedback => languageModel.translate('customerFeedback');
  String get customerReview => languageModel.translate('customerReview');
  String get shipping => languageModel.translate('shipping');
  String get available => languageModel.translate('available');
  String get inStock => languageModel.translate('inStock');
  String get outOfStock => languageModel.translate('outOfStock');
  String get productDescription =>
      languageModel.translate('productDescription');
  String get cartInfo => languageModel.translate('cartInfo');
  String get productPhoto => languageModel.translate('productPhoto');
  String get productName => languageModel.translate('productName');
  String get quantity => languageModel.translate('quantity');
  String get price => languageModel.translate('price');
  String get total => languageModel.translate('total');
  String get priceDetails => languageModel.translate('priceDetails');
  String get subTotal => languageModel.translate('subTotal');
  String get tax => languageModel.translate('tax');
  String get couponInfo => languageModel.translate('couponInfo');
  String get orderDescription => languageModel.translate('orderDescription');
  String get productInformations =>
      languageModel.translate('productInformations');
  String get addYourInformations =>
      languageModel.translate('addYourInformations');
  String get city => languageModel.translate('city');
  String get pincode => languageModel.translate('pincode');
  String get country => languageModel.translate('country');
  String get coupon => languageModel.translate('coupon');
  String get yourInformations => languageModel.translate('yourInformations');
  String get paymentOptions => languageModel.translate('paymentOptions');
  String get creditCard => languageModel.translate('creditCard');
  String get debitCard => languageModel.translate('debitCard');
  String get payPal => languageModel.translate('payPal');
  String get payPalText => languageModel.translate('payPalText');
  String get successLorem1 => languageModel.translate('successLorem1');
  String get successLorem2 => languageModel.translate('successLorem2');
}

class _LandingPage {
  String get compare => languageModel.translate('compare');
  String get wishlist => languageModel.translate('wishlist');
  String get cart => languageModel.translate('cart');
  String get home => languageModel.translate('home');
  String get category => languageModel.translate('category');
  String get blog => languageModel.translate('blog');
  String get brand => languageModel.translate('brand');
  String get offer => languageModel.translate('offer');
  String get login => languageModel.translate('login');
  String get register => languageModel.translate('register');
  String get termsConditions => languageModel.translate('termsConditions');
  String get privacyPolicy => languageModel.translate('privacyPolicy');
  String get deliveryPolicy => languageModel.translate('deliveryPolicy');
  String get cancellationPolicy =>
      languageModel.translate('cancellationPolicy');
  String get aboutUs => languageModel.translate('aboutUs');
  String get orderHistory => languageModel.translate('orderHistory');
  String get myWishlist => languageModel.translate('myWishlist');
  String get trackOrder => languageModel.translate('trackOrder');
  String get contactInfo => languageModel.translate('contactInfo');
  String get address => languageModel.translate('address');
  String get phone => languageModel.translate('phone');
  String get email => languageModel.translate('email');
  String get quickLinks => languageModel.translate('quickLinks');
  String get myAccount => languageModel.translate('myAccount');
  String get offers => languageModel.translate('offers');
  String get allBrand => languageModel.translate('allBrand');
  String get allCategory => languageModel.translate('allCategory');
  String get blogTitle => languageModel.translate('blogTitle');
  String get blogText1 => languageModel.translate('blogText1');
  String get blogText2 => languageModel.translate('blogText2');
  String get blogText3 => languageModel.translate('blogText3');
  String get productDescription =>
      languageModel.translate('productDescription');
  String get featuredProducts => languageModel.translate('featuredProducts');
  String get bestSelling => languageModel.translate('bestSelling');
  String get menAndWomanFashion =>
      languageModel.translate('menAndWomanFashion');
  String get comparison => languageModel.translate('comparison');
  String get resetCompareList => languageModel.translate('resetCompareList');
  String get emptyCompare => languageModel.translate('emptyCompare');
  String get name => languageModel.translate('name');
  String get image => languageModel.translate('image');
  String get price => languageModel.translate('price');
  String get subCategory => languageModel.translate('subCategory');
}
