String upperCase(String text) {
  if (text == '/FAQs') {
    return text.replaceAll('/', '');
  } else if (text == '/products/products-detail') {
    String tempText = '';
    for (String element in text.split('/')[2].split('-')) {
      tempText =
          '$tempText ${element.substring(0, 1).toUpperCase()}${element.substring(1).toLowerCase()}';
    }
    return tempText.trim();
  } else if (text == '/category/sub-category') {
    String tempText = '';
    for (String element in text.split('/')[2].split('-')) {
      tempText =
          '$tempText ${element.substring(0, 1).toUpperCase()}${element.substring(1).toLowerCase()}';
    }
    return tempText.trim();
  } else if (text == '/landing-page/blog') {
    String tempText = '';
    for (String element in text.split('/')[1].split('-')) {
      tempText =
          '$tempText ${element.substring(0, 1).toUpperCase()}${element.substring(1).toLowerCase()}';
    }
    return tempText.trim();
  } else if (text == '/payment/success') {
    String tempText = '';
    for (String element in text.split('/')[2].split('-')) {
      tempText =
          '$tempText ${element.substring(0, 1).toUpperCase()}${element.substring(1).toLowerCase()}';
    }
    return tempText.trim();
  } else if (text == '/vendor/vendor-detail') {
    String tempText = '';
    for (String element in text.split('/')[2].split('-')) {
      tempText =
          '$tempText ${element.substring(0, 1).toUpperCase()}${element.substring(1).toLowerCase()}';
    }
    return tempText.trim();
  } else if (text == '/return-order/return-order-invoice') {
    String tempText = '';
    for (String element in text.split('/')[2].split('-')) {
      tempText =
          '$tempText ${element.substring(0, 1).toUpperCase()}${element.substring(1).toLowerCase()}';
    }
    return tempText.trim();
  } else if (text == '/order/order-invoice') {
    String tempText = '';
    for (String element in text.split('/')[2].split('-')) {
      tempText =
          '$tempText ${element.substring(0, 1).toUpperCase()}${element.substring(1).toLowerCase()}';
    }
    return tempText.trim();
  } else if (text.contains('-')) {
    String tempText = '';
    for (String element in text.replaceAll('/', '').split('-')) {
      tempText =
          '$tempText ${element.substring(0, 1).toUpperCase()}${element.substring(1).toLowerCase()}';
    }
    return tempText.trim();
  } else if (text == '/') {
    return 'Dashboard';
  } else {
    return text.replaceAll('/', '').substring(0, 1).toUpperCase() +
        text.replaceAll('/', '').substring(1).toLowerCase();
  }
}
