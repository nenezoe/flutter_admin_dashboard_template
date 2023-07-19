// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lekota_users_dashboard/src/widgets/custom_text_field.dart';
// import 'package:lekota_users_dashboard/src/widgets/post_code_validator.dart';


// import '../features/authentication/register/models/address_model.dart';

// class AddAddressBottomSheet extends StatefulWidget {
//   final AddressModel? editAddress;
//   const AddAddressBottomSheet({super.key, this.editAddress});

//   @override
//   State<AddAddressBottomSheet> createState() => _AddAddressBottomSheetState();
// }

// class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
//   final _formKey = GlobalKey<FormState>();
//   final _addressController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _countryController = TextEditingController();
//   final _postcodeController = TextEditingController();
//   final _countyController = TextEditingController();
//   String? _addressStartDate;
//   String? _addressEndDate;

//   @override
//   void initState() {
//     _loadData();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _addressController.dispose();
//     _cityController.dispose();
//     _countryController.dispose();
//     _postcodeController.dispose();
//     _countyController.dispose();
//     super.dispose();
//   }

//   void _loadData() {
//     if (widget.editAddress == null) return;

//     _addressController.text = widget.editAddress!.address!;
//     _cityController.text = widget.editAddress!.city!;
//     _countryController.text = widget.editAddress!.country!;
//     _postcodeController.text = widget.editAddress!.postcode!;
//     _countyController.text = widget.editAddress!.county!;
//     List<String> dates = widget.editAddress!.from!.split(' - ');
//     _addressStartDate = dates[0];
//     _addressEndDate = dates[1];
//   }

//   void _onAdd() {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }

//     if (_addressStartDate == null) {
//       return;
//     }

//     if (_addressEndDate == null) {
//       return;
//     }

//     AddressModel address = AddressModel(
//       address: _addressController.text,
//       county: _countyController.text,
//       city: _cityController.text,
//       postcode: _postcodeController.text,
//       country: _countryController.text,
//       from: '$_addressStartDate - $_addressEndDate',
//     );

//     context.pop(address);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: AnimatedPadding(
//         padding: MediaQuery.of(context).viewInsets,
//         duration: const Duration(milliseconds: 100),
//         curve: Curves.decelerate,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             SafeArea(
//               child: Container(
//                 padding: const EdgeInsets.all(20.0),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15.0),
//                     topRight: Radius.circular(15.0),
//                   ),
//                 ),
//                 child: _buildForm(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildForm() {
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: const [CloseButton()],
//           ),
//           Text(
//             "Add Address",
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//           const SizedBox(height: 10.0),
//           CustomTextField(
//             controller: _addressController,
//             hintText: "Address",
//             validator: (value) {
//               if (value!.isEmpty) return 'Please enter the address';
//               return null;
//             },
//           ),
//           const SizedBox(height: 10.0),
//           Row(
//             children: [
//               Expanded(
//                 child: CustomTextField(
//                   controller: _cityController,
//                   hintText: "City",
//                   validator: (value) {
//                     if (value!.isEmpty) return 'Please enter the city';
//                     return null;
//                   },
//                 ),
//               ),
//               const SizedBox(width: 20.0),
//               Expanded(
//                 child: CustomTextField(
//                   controller: _countyController,
//                   hintText: "County",
//                   validator: (value) {
//                     if (value!.isEmpty) return 'Please enter the county';
//                     return null;
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10.0),
//           Row(
//             children: [
//               Expanded(
//                 child: CustomTextField(
//                   controller: _postcodeController,
//                   hintText: "Postcode",
//                   validator: (value) {
//                     if (!PostcodeValidator.isValidUKPostcode(value!)) {
//                       return "Please enter a valid postcode. it must be six characters. example: PO16 7GZ";
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               const SizedBox(width: 20.0),
//               Expanded(
//                 child: CustomTextField(
//                   controller: _countryController,
//                   hintText: "Country",
//                   validator: (value) {
//                     if (value!.isEmpty) return 'Please enter the country';
//                     return null;
//                   },
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10.0),
          
         
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: PrimaryButton(
//               onPressed: _onAdd,
//               buttonText: "Add",
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
