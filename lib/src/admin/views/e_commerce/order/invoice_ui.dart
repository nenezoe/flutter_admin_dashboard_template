// import 'package:admin_dashboard/src/constant/image.dart';
// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart';
// // ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;

// class GenerateInvoice {
//   Future<void> printInvoice() async {
//     final pdf = Document();
//     var assetImage = MemoryImage(
//       (await rootBundle.load(Images.smLogo)).buffer.asUint8List(),
//     );

//     List<Map<String, dynamic>> userList = [
//       {
//         'item': 'Your Item1',
//         'price': '\$9.99',
//         'quantity': '1',
//         'total': '\$9.99',
//       },
//       {
//         'item': 'Your Item2',
//         'price': '\$15.00',
//         'quantity': '3',
//         'total': '\$45.00',
//       },
//       {
//         'item': 'Your Item3',
//         'price': '\$599.99',
//         'quantity': '1',
//         'total': '\$599.99',
//       },
//       {
//         'item': '',
//         'price': '',
//         'quantity': 'Subtotal',
//         'total': '\$654.98',
//       },
//       {
//         'item': '',
//         'price': '',
//         'quantity': 'Shipping',
//         'total': '\$20.00',
//       },
//       {
//         'item': '',
//         'price': '',
//         'quantity': 'Total',
//         'total': '\$674.98',
//       },
//     ];

//     pdf.addPage(
//       Page(build: (Context context) {
//         return Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     height: 25,
//                     width: 30,
//                     child: Image(assetImage),
//                   ),
//                   Spacer(),
//                   Text(
//                     'Invoice No : 00001',
//                     style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//               Divider(
//                 height: 34,
//                 color: PdfColors.grey,
//                 thickness: 0.2,
//               ),
//               Row(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Billed To:",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 12,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text('123 Your street'),
//                       Text('Your area'),
//                       Text('Address'),
//                       Text('Your contry'),
//                       SizedBox(height: 32),
//                       Text(
//                         "Payment Method:",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//                       Text("Visa ending ****4242"),
//                       Text("Your@gmail.com"),
//                     ],
//                   ),
//                   Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 30),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           "Shipped To:",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text('Purcheser'),
//                         Text('Home'),
//                         Text('Address'),
//                         Text('His Contry Name'),
//                         SizedBox(height: 32),
//                         Text(
//                           "Order Date:",
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text("Shiping@date"),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: 32),
//               Text(
//                 'Order summary',
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 16),
//               Table.fromTextArray(
//                   context: context,
//                   headerAlignment: Alignment.centerLeft,
//                   data: <List<String>>[
//                     <String>['Item', 'Price', 'Quantity', 'Totals'],
//                     ...userList.map((user) => [
//                           user['item'],
//                           user['price'],
//                           user['quantity'],
//                           user['total'],
//                         ])
//                       ..toList()
//                   ],
//                   border: const TableBorder(
//                       bottom: BorderSide.none,
//                       top: BorderSide.none,
//                       right: BorderSide.none,
//                       left: BorderSide.none,
//                       horizontalInside: BorderSide(color: PdfColors.grey300))),
//             ],
//           ),
//         );
//       }),
//     );

//     Uint8List saveData = await pdf.save();
//     download(
//       blobName: 'application/pdf',
//       bytes: saveData,
//       fileName: '${DateTime.now().millisecondsSinceEpoch}.pdf',
//     );
//   }

//   void download(
//       {required Uint8List bytes,
//       required String blobName,
//       required String fileName}) {
//     final blob = html.Blob([bytes], 'application/pdf');
//     final url = html.Url.createObjectUrlFromBlob(blob);
//     final anchor = html.document.createElement('a') as html.AnchorElement
//       ..href = url
//       ..style.display = 'none'
//       ..download = fileName;
//     html.document.body?.children.add(anchor);
//     anchor.click();
//   }
// }
