import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/custom_text.dart';
import 'package:admin_dashboard/src/admin/constant/text.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:auto_route/annotations.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class DropDownScreen extends StatefulWidget {
  const DropDownScreen({super.key});

  @override
  State<DropDownScreen> createState() => _DropDownScreenState();
}

// for City
List<String> _cityList = [
  'Ahmedabad',
  'Surat',
  'Gandhinagar',
  'Navsari',
  'Vadodara',
  'Anand',
];
String? _cityValue;

// for State

List<String> _stateList = [
  'Gujarat',
  'Goa',
  'Andhra Pradesh',
  'Bihar',
  'Vadodara',
  'Chhattisgarh',
];
String? _stateValue;

// for Country

List<String> _countryList = [
  'India',
  'United States',
  'Canada',
  'Netherlands',
  'Australia',
  'Japan',
];
String? _countryValue;

class _DropDownScreenState extends State<DropDownScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: _simpleDropDown()),
          FxBox.w24,
          Expanded(child: _searchDropDown()),
        ],
      ),
    );
  }

  Widget _simpleDropDown() {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstText.lightText(
              text: languageModel.widget.simpleDropdown,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h24,
            ConstText.lightText(
              text: languageModel.widget.city,
              fontWeight: FontWeight.w400,
            ),
            FxBox.h10,
            _normalDrop(
              dataList: _cityList,
              hintText: 'Select Your City',
              dataValue: _cityValue,
              onChanged: (cityValue) {
                _cityValue = cityValue;
                setState(() {});
              },
            ),
            FxBox.h24,
            ConstText.lightText(
              text: languageModel.form.state,
              fontWeight: FontWeight.w400,
            ),
            FxBox.h10,
            _normalDrop(
              dataList: _stateList,
              hintText: 'Select Your State',
              dataValue: _stateValue,
              onChanged: (stateValue) {
                _stateValue = stateValue;
                setState(() {});
              },
            ),
            FxBox.h24,
            ConstText.lightText(
              text: languageModel.widget.country,
              fontWeight: FontWeight.w400,
            ),
            FxBox.h10,
            _normalDrop(
              dataList: _countryList,
              hintText: 'Select Your Country',
              dataValue: _countryValue,
              onChanged: (countryValue) {
                _countryValue = countryValue;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchDropDown() {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: Container(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstText.lightText(
              text: languageModel.widget.searchDropDown,
              fontWeight: FontWeight.bold,
            ),
            FxBox.h24,
            ConstText.lightText(
              text: languageModel.widget.country,
              fontWeight: FontWeight.w400,
            ),
            FxBox.h10,
            _dropDown(
              list: _cityList,
              selectedItem: _cityValue,
              hintText: 'Select Your City',
              onChanged: (cityValue) {
                _cityValue = cityValue;
                setState(() {});
              },
            ),
            FxBox.h24,
            ConstText.lightText(
              text: languageModel.form.state,
              fontWeight: FontWeight.w400,
            ),
            FxBox.h10,
            _dropDown(
              list: _stateList,
              selectedItem: _stateValue,
              hintText: 'Select Your State',
              onChanged: (stateValue) {
                _stateValue = stateValue;
                setState(() {});
              },
            ),
            FxBox.h24,
            ConstText.lightText(
              text: languageModel.widget.country,
              fontWeight: FontWeight.w400,
            ),
            FxBox.h10,
            _dropDown(
              list: _countryList,
              selectedItem: _countryValue,
              hintText: 'Select Your Country',
              onChanged: (countryValue) {
                _countryValue = countryValue;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _dropDown({
    String? selectedItem,
    void Function(String?)? onChanged,
    required List<String> list,
    String? hintText,
  }) {
    return DropdownSearch<String>(
      selectedItem: selectedItem == '' ? null : selectedItem,
      autoValidateMode: AutovalidateMode.always,
      onChanged: onChanged,
      items:
          List<String>.generate(list.length, (index) => list[index].toString()),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          isDense: true,
        ),
      ),
      popupProps: PopupProps.menu(
        showSearchBox: true,
        fit: FlexFit.loose,
        showSelectedItems: true,
        itemBuilder: (_, item, isSelected) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: ColorConst.stepperBackGround.withOpacity(0.8),
              border: Border.all(color: ColorConst.stepperBackGround),
            ),
            child: Text(
              item,
              style: const TextStyle(color: ColorConst.black),
            ),
          );
        },
        searchFieldProps: TextFieldProps(
          controller: TextEditingController(),
          keyboardType: TextInputType.name,
          focusNode: FocusNode()..requestFocus(),
          style: const TextStyle(fontSize: 15, color: ColorConst.black),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Search..',
            labelStyle: TextStyle(fontSize: 15, color: ColorConst.black),
            contentPadding: EdgeInsets.all(8),
            isDense: true,
            filled: true,
            fillColor: ColorConst.white,
          ),
        ),
        emptyBuilder: (context, _) {
          return const SizedBox(
            height: 80,
            child: Center(
              child: CustomText(
                title: 'No Data Found',
                textColor: ColorConst.black,
                fontSize: 15,
              ),
            ),
          );
        },
        menuProps: const MenuProps(
          backgroundColor: ColorConst.stepperBackGround,
        ),
      ),
    );
  }

  Widget _normalDrop({
    required List<String> dataList,
    String? dataValue,
    required String hintText,
    required void Function(String?)? onChanged,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: ColorConst.greyChartColor,
        ),
      ),
      child: DropdownButton<String>(
        value: dataValue,
        icon: FxBox.shrink,
        borderRadius: BorderRadius.circular(10),
        underline: FxBox.shrink,
        hint: ConstText.lightText(
          text: '  $hintText',
        ),
        items: dataList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text('  $value'),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
