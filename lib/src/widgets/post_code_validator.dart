class PostcodeValidator {

  static bool isValidUKPostcode(String postcode) {

    RegExp regex = RegExp(

      r'^[A-Z]{1,2}[0-9][A-Z0-9]? [0-9][A-Z]{2}$',

      caseSensitive: false,

      multiLine: false,

    );

    return regex.hasMatch(postcode.trim());

  }

}