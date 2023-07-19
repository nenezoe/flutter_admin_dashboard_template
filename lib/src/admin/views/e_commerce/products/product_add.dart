import 'dart:math';
import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/icons.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/constant/theme.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/views/e_commerce/products/product.dart';
import 'package:admin_dashboard/src/admin/widget/datatable.dart';
import 'package:admin_dashboard/src/admin/widget/svg_icon.dart';
import 'package:admin_dashboard/src/admin/widget/textformfield.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  // final FormUploadFileBloc _formUploadFileBloc = FormUploadFileBloc();
  // late DropzoneViewController _controller;
  // final List<XFile> _filesList = [];
  bool isExcelFile = false;
  Uint8List bytes = Uint8List(0);

  final TextEditingController _productName = TextEditingController();
  final TextEditingController _expriryDate = TextEditingController();
  final TextEditingController _unitStock = TextEditingController();
  final ValueNotifier<String> _categorySelected = ValueNotifier('');

  final List<ProductModel> _productItem = [
    ProductModel(
      id: 1,
      product: 'i phone 14',
      category: 'mobile',
      expiryDate: '02/10/2024',
      unit: 2,
    ),
    ProductModel(
      id: 2,
      product: 'samsung galaxy',
      category: 'mobile',
      expiryDate: '02/10/2024',
      unit: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FxButton(
            onPressed: () {
              FxModal.showModel(
                context: context,
                title: languageModel.eCommerceAdmin.productAdd.trim(),
                content: _productForm(),
                trailingIcon: const SvgIcon(icon: IconlyBroken.closeSquare),
                actions: [
                  FxButton(
                    onPressed: () => Navigator.pop(context),
                    text: Strings.close,
                    buttonType: ButtonType.secondary,
                  ),
                  ValueListenableBuilder<String>(
                    valueListenable: _categorySelected,
                    builder: (context, value, child) {
                      return FxButton(
                        onPressed: () {
                          Navigator.pop(context);

                          setState(
                            () {
                              _productItem.add(
                                ProductModel(
                                  id: 3,
                                  product: _productName.text,
                                  category: value,
                                  expiryDate: _expriryDate.text,
                                  unit: int.parse(_unitStock.text),
                                ),
                              );

                              _productName.clear();
                              _unitStock.clear();
                            },
                          );
                        },
                        text: Strings.saveChange,
                      );
                    },
                  ),
                ],
                modelType: ModalType.normal,
              );
            },
            icon: const Icon(Icons.add),
            text: 'Add New Product',
            borderRadius: 4.0,
          ),
          FxBox.h10,
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: DataTable3(
              minWidth: 1100,
              columns: _productColum(),
              rows: _productRow(),
            ),
          ),
        ],
      ),
    );

    //   return BlocProvider(
    //     create: (context) => _formUploadFileBloc,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           padding: const EdgeInsets.symmetric(
    //             vertical: 32.0,
    //             horizontal: 24.0,
    //           ),
    //           decoration: BoxDecoration(
    //             // color: !isDark ? ColorConst.white : ColorConst.black,
    //             color: Theme.of(context).brightness == Brightness.dark
    //                 ? Colors.black
    //                 : Colors.white,
    //             borderRadius: BorderRadius.circular(8.0),
    //           ),
    //           child: Responsive.isWeb(context)
    //               ? Row(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Expanded(child: _productForm()),
    //                     Expanded(child: _pickDropContainer(size)),
    //                   ],
    //                 )
    //               : Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     _pickDropContainer(size),
    //                     FxBox.h16,
    //                     _productForm()
    //                   ],
    //                 ),
    //         ),
    //       ],
    //     ),
    //   );
    // }
  }

  List<DataColumn> _productColum() {
    List<String> column = [
      languageModel.eCommerceAdmin.id,
      languageModel.eCommerceAdmin.productName,
      languageModel.eCommerceAdmin.category,
      languageModel.eCommerceAdmin.expiryDate,
      languageModel.eCommerceAdmin.unit,
      ''
    ];
    return [
      for (int i = 0; i < column.length; i++) ...[
        DataColumn(
          label: Text(
            column[i],
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
      ]
    ];
  }

  List<DataRow2> _productRow() {
    return [
      for (int i = 0; i < _productItem.length; i++) ...[
        DataRow2(
          cells: [
            DataCell(Text(_productItem[i].id.toString())),
            DataCell(Text(_productItem[i].product)),
            DataCell(Text(_productItem[i].category)),
            DataCell(Text(_productItem[i].expiryDate)),
            DataCell(
              Text(
                _productItem[i].unit.toString(),
                textAlign: TextAlign.center,
              ),
            ),
            DataCell(Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _productItem.removeWhere(
                          (element) => element.id == _productItem[i].id);
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                )
              ],
            ))
          ],
        )
      ]
    ];
  }

  // Widget _emptyView() {
  //   return Column(
  //     mainAxisSize: MainAxisSize.min,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       const Icon(
  //         Icons.cloud_upload_sharp,
  //         size: 60,
  //         color: Colors.grey,
  //       ),
  //       FxBox.h20,
  //       const Text(
  //         "Drop files here or click to upload.",
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //             fontWeight: FontWeight.w600, fontSize: 22, color: Colors.grey),
  //       ),
  //     ],
  //   );
  // }

  Widget _productForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _formTitle(languageModel.eCommerceAdmin.productName),
        FxBox.h6,
        CustomTextField(
          controller: _productName,
          contentPadding: const EdgeInsets.all(12.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        FxBox.h16,
        _formTitle(languageModel.eCommerceAdmin.description),
        FxBox.h6,
        CustomTextField(
          maxLines: 6,
          contentPadding: const EdgeInsets.all(12.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        FxBox.h16,
        _formTitle(languageModel.eCommerceAdmin.category),
        FxBox.h6,
        _categoryDropDown(),
        FxBox.h16,
        _expiryRow(),
      ],
    );
  }

  // Widget _pickDropContainer(Size size) {
  //   return GestureDetector(
  //     onTap: () async {
  //       FilePickerResult? file =
  //           await FilePicker.platform.pickFiles(allowMultiple: false);
  //       if (file != null) {
  //         XFile files = XFile(file.files.first.path!);
  //         _dropFile(files);
  //       }
  //     },
  //     child: Container(
  //       margin: Responsive.isWeb(context)
  //           ? const EdgeInsets.all(24.0)
  //           : EdgeInsets.zero,
  //       height: size.height * 0.30,
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(12.0),
  //         color: Theme.of(context).brightness == Brightness.dark
  //             ? Colors.black
  //             : Colors.white,
  //         boxShadow: [
  //           BoxShadow(
  //             color: Theme.of(context).brightness == Brightness.dark
  //                 ? Colors.white.withOpacity(0.4)
  //                 : Colors.black.withOpacity(0.1),
  //             spreadRadius: 0.0,
  //             blurRadius: 3.0,
  //             // offset: const Offset(5.0, 5.0),
  //           ),
  //         ],
  //       ),
  //       child: BlocBuilder<FormUploadFileBloc, FormUploadFileState>(
  //         builder: (context, state) {
  //           return Stack(
  //             alignment: Alignment.center,
  //             clipBehavior: Clip.antiAlias,
  //             children: [
  //               DropTarget(
  //                 // operation: DragOperation.copy,
  //                 // onCreated: (controller) =>
  //                 //     _controller = controller,
  //                 // onLoaded: () {},
  //                 // onHover: () {},
  //                 // onLeave: () {},
  //                 // onDropMultiple: (value) async {
  //                 //   _dropFile(value!);
  //                 // },
  //                 child: SingleChildScrollView(
  //                   controller: ScrollController(),
  //                   child: state.when(
  //                     initial: () => _emptyView(),
  //                     fileSuccess: (filesList) => filesList.isEmpty
  //                         ? _emptyView()
  //                         : _hasDataView(filesList),
  //                   ),
  //                 ),
  //                 onDragDone: (details) {
  //                   _dropFile(details.files.first);
  //                 },
  //               ),
  //             ],
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Widget _hasDataView(List<dynamic> fileData) {
  //   return Wrap(
  //     runSpacing: 30.0,
  //     spacing: 30.0,
  //     children: fileData.map(
  //       (e) {
  //         return FutureBuilder<Map<String, dynamic>>(
  //           future: _fileData(e),
  //           builder: (context, snapshot) {
  //             if (!snapshot.hasData) {
  //               return FxBox.shrink;
  //             }
  //             final size = snapshot.data!['size'];
  //             final fileType = snapshot.data!['mime'];
  //             final isImage = fileType!.startsWith('image') ? true : false;
  //             return FxHover(builder: (isHover) {
  //               return Stack(
  //                 clipBehavior: Clip.none,
  //                 children: [
  //                   Container(
  //                     height: 120,
  //                     width: 120,
  //                     decoration: BoxDecoration(
  //                       image: isImage
  //                           ? DecorationImage(
  //                               image: MemoryImage(snapshot.data!['bytes']),
  //                               fit: BoxFit.cover,
  //                             )
  //                           : null,
  //                       color: isDark
  //                           ? ColorConst.lightFontColor
  //                           : ColorConst.file,
  //                       borderRadius: BorderRadius.circular(20.0),
  //                     ),
  //                     child: isImage
  //                         ? ClipRRect(
  //                             borderRadius: BorderRadius.circular(20.0),
  //                             child: BackdropFilter(
  //                                 filter: isHover
  //                                     ? ImageFilter.blur(sigmaX: 10, sigmaY: 10)
  //                                     : ImageFilter.blur(
  //                                         sigmaX: 0.1, sigmaY: 0.1),
  //                                 child: isHover
  //                                     ? _fileDetailView(
  //                                         size,
  //                                         snapshot.data!['name'],
  //                                       )
  //                                     : null),
  //                           )
  //                         : _fileDetailView(size, snapshot.data!['name']),
  //                   ),
  //                   Positioned(
  //                     right: 0.0,
  //                     child: InkWell(
  //                       hoverColor: Colors.transparent,
  //                       splashColor: Colors.transparent,
  //                       highlightColor: Colors.transparent,
  //                       onTap: () {
  //                         isExcelFile = false;
  //                         List<XFile> tempList = _filesList.toList();
  //                         tempList.removeAt(fileData.indexOf(e));
  //                         _filesList = tempList;
  //                         _formUploadFileBloc
  //                             .add(FormUploadFileEvent.addFile(_filesList));
  //                       },
  //                       child: Container(
  //                         padding: const EdgeInsets.all(4.0),
  //                         decoration: const BoxDecoration(
  //                           shape: BoxShape.circle,
  //                         ),
  //                         child: const SvgIcon(
  //                           icon: IconlyBroken.closeSquare,
  //                           size: 14.0,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               );
  //             });
  //           },
  //         );
  //       },
  //     ).toList(),
  //   );
  // }

  // Widget _fileDetailView(String size, String name) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         padding: const EdgeInsets.symmetric(
  //           horizontal: 6.4,
  //         ),
  //         color: ColorConst.white.withOpacity(0.4),
  //         child: Text(
  //           size,
  //           style: const TextStyle(
  //             fontSize: 17,
  //             fontWeight: FontWeight.w500,
  //             color: ColorConst.black,
  //           ),
  //         ),
  //       ),
  //       FxBox.h12,
  //       Container(
  //         margin: const EdgeInsets.symmetric(
  //           horizontal: 13.0,
  //         ),
  //         padding: const EdgeInsets.symmetric(
  //           horizontal: 5.2,
  //         ),
  //         color: ColorConst.white.withOpacity(0.4),
  //         child: Text(
  //           name,
  //           overflow: TextOverflow.ellipsis,
  //           style: const TextStyle(
  //             fontSize: 14,
  //             color: ColorConst.black,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Future<void> _dropFile(XFile files) async {
  //   isExcelFile = false;
  //   _filesList.clear();

  //   await _fileData(files);
  //   _filesList.add(files);

  //   bytes = await files.readAsBytes();
  //   if (files.path.split('.').last == 'xlsx') {
  //     isExcelFile = true;

  //     _formUploadFileBloc.add(FormUploadFileEvent.addFile(_filesList));
  //   }
  // }

  // Future<Map<String, dynamic>> _fileData(XFile file) async {
  //   return {
  //     'name': file.path.split('/').last,
  //     'size': await _getFileSize(file),
  //     'mime': lookupMimeType(file.path),
  //     'bytes': await file.readAsBytes(),
  //   };
  // }

  // Future<String> _getFileSize(XFile file) async {
  //   if (await file.length() / 1024 <= 1000) {
  //     return '${(await file.length() / 1024).toStringAsFixed(2)} KB';
  //   } else {
  //     return '${((await file.length() / 1024) / 1024).toStringAsFixed(2)} MB';
  //   }
  // }

  Widget _categoryDropDown() {
    return DropdownButtonFormField(
      hint: const Text(
        'Select Category',
        style: TextStyle(
          color: ColorConst.black,
        ),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: !isDark
                ? ColorConst.black
                : ColorConst.white.withOpacity(
                    0.5,
                  ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color:
                !isDark ? ColorConst.black : ColorConst.white.withOpacity(0.5),
          ),
        ),
      ),
      onChanged: (value) {
        _categorySelected.value = value['category'];
        _categorySelected.notifyListeners();
      },
      items: productList.map<DropdownMenuItem>(
        (e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e['category'].toString()),
          );
        },
      ).toList(),
    );
  }

  Widget _expiryRow() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formTitle(languageModel.eCommerceAdmin.expiryDate),
              FxBox.h6,
              CustomTextField(
                controller: _expriryDate,
                keyboardType: TextInputType.datetime,
                contentPadding: const EdgeInsets.all(12.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  CustomDateTextFormatter(),
                ],
              ),
            ],
          ),
        ),
        FxBox.w12,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formTitle(languageModel.eCommerceAdmin.unitsInStock),
              FxBox.h6,
              CustomTextField(
                controller: _unitStock,
                contentPadding: const EdgeInsets.all(12.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

_formTitle(String text) {
  return Text(
    text,
    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
  );
}

//

class ProductModel {
  int id;
  String product;
  String category;
  String expiryDate;
  int unit;

  ProductModel(
      {required this.id,
      required this.product,
      required this.category,
      required this.expiryDate,
      required this.unit});
}

class CustomDateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/', oldValue);
    return newValue.copyWith(
        text: text, selection: _updateCursorPosition(text, oldValue));
  }
}

String _format(String value, String seperator, TextEditingValue old) {
  var finalString = '';
  var dd = '';
  var mm = '';
  var yyy = '';
  var oldVal = old.text;

  var tempOldval = oldVal;
  var tempValue = value;
  if (!oldVal.contains(seperator) ||
      oldVal.isEmpty ||
      seperator.allMatches(oldVal).length < 2) {
    oldVal += '///';
  }
  if (!value.contains(seperator) || _backSlashCount(value) < 2) {
    value += '///';
  }
  var splitArrOLD = oldVal.split(seperator);
  var splitArrNEW = value.split(seperator);

  for (var i = 0; i < 3; i++) {
    splitArrOLD[i] = splitArrOLD[i].toString().trim();
    splitArrNEW[i] = splitArrNEW[i].toString().trim();
  }
  // block erasing
  if ((splitArrOLD[0].isNotEmpty &&
          splitArrOLD[2].isNotEmpty &&
          splitArrOLD[1].isEmpty &&
          tempValue.length < tempOldval.length &&
          splitArrOLD[0] == splitArrNEW[0] &&
          splitArrOLD[2].toString().trim() ==
              splitArrNEW[1].toString().trim()) ||
      (_backSlashCount(tempOldval) > _backSlashCount(tempValue) &&
          splitArrNEW[1].length > 2) ||
      (splitArrNEW[0].length > 2 && _backSlashCount(tempOldval) == 1) ||
      (_backSlashCount(tempOldval) == 2 &&
          _backSlashCount(tempValue) == 1 &&
          splitArrNEW[0].length > splitArrOLD[0].length)) {
    finalString = tempOldval; // making the old date as it is
  } else {
    if (splitArrNEW[0].length > splitArrOLD[0].length) {
      if (splitArrNEW[0].length < 3) {
        dd = splitArrNEW[0];
      } else {
        for (var i = 0; i < 2; i++) {
          dd += splitArrNEW[0][i];
        }
      }
      if (dd.length == 2 && !dd.contains(seperator)) {
        dd += seperator;
      }
    } else if (splitArrNEW[0].length == splitArrOLD[0].length) {
      if (oldVal.length > value.length && splitArrNEW[1].isEmpty) {
        dd = splitArrNEW[0];
      } else {
        dd = splitArrNEW[0] + seperator;
      }
    } else if (splitArrNEW[0].length < splitArrOLD[0].length) {
      if (oldVal.length > value.length &&
          splitArrNEW[1].isEmpty &&
          splitArrNEW[0].isNotEmpty) {
        dd = splitArrNEW[0];
      } else if (tempOldval.length > tempValue.length &&
          splitArrNEW[0].isEmpty &&
          _backSlashCount(tempValue) == 2) {
        dd += seperator;
      } else {
        if (splitArrNEW[0].isNotEmpty) {
          dd = splitArrNEW[0] + seperator;
        }
      }
    }

    if (dd.isNotEmpty) {
      finalString = dd;
      if (dd.length == 2 &&
          !dd.contains(seperator) &&
          oldVal.length < value.length &&
          splitArrNEW[1].isNotEmpty) {
        if (seperator.allMatches(dd).isEmpty) {
          finalString += seperator;
        }
      } else if (splitArrNEW[2].isNotEmpty &&
          splitArrNEW[1].isEmpty &&
          tempOldval.length > tempValue.length) {
        if (seperator.allMatches(dd).isEmpty) {
          finalString += seperator;
        }
      } else if (oldVal.length < value.length &&
          (splitArrNEW[1].isNotEmpty || splitArrNEW[2].isNotEmpty)) {
        if (seperator.allMatches(dd).isEmpty) {
          finalString += seperator;
        }
      }
    } else if (_backSlashCount(tempOldval) == 2 && splitArrNEW[1].isNotEmpty) {
      dd += seperator;
    }

    if (splitArrNEW[0].length == 3 && splitArrOLD[1].isEmpty) {
      mm = splitArrNEW[0][2];
    }

    if (splitArrNEW[1].length > splitArrOLD[1].length) {
      if (splitArrNEW[1].length < 3) {
        mm = splitArrNEW[1];
      } else {
        for (var i = 0; i < 2; i++) {
          mm += splitArrNEW[1][i];
        }
      }
      if (mm.length == 2 && !mm.contains(seperator)) {
        mm += seperator;
      }
    } else if (splitArrNEW[1].length == splitArrOLD[1].length) {
      if (splitArrNEW[1].isNotEmpty) {
        mm = splitArrNEW[1];
      }
    } else if (splitArrNEW[1].length < splitArrOLD[1].length) {
      if (splitArrNEW[1].isNotEmpty) {
        mm = splitArrNEW[1] + seperator;
      }
    }

    if (mm.isNotEmpty) {
      finalString += mm;
      if (mm.length == 2 && !mm.contains(seperator)) {
        if (tempOldval.length < tempValue.length) {
          finalString += seperator;
        }
      }
    }

    if (splitArrNEW[1].length == 3 && splitArrOLD[2].isEmpty) {
      yyy = splitArrNEW[1][2];
    }

    if (splitArrNEW[2].length > splitArrOLD[2].length) {
      if (splitArrNEW[2].length < 5) {
        yyy = splitArrNEW[2];
      } else {
        for (var i = 0; i < 4; i++) {
          yyy += splitArrNEW[2][i];
        }
      }
    } else if (splitArrNEW[2].length == splitArrOLD[2].length) {
      if (splitArrNEW[2].isNotEmpty) {
        yyy = splitArrNEW[2];
      }
    } else if (splitArrNEW[2].length < splitArrOLD[2].length) {
      yyy = splitArrNEW[2];
    }

    if (yyy.isNotEmpty) {
      if (_backSlashCount(finalString) < 2) {
        if (splitArrNEW[0].isEmpty && splitArrNEW[1].isEmpty) {
          finalString = seperator + seperator + yyy;
        } else {
          finalString = finalString + seperator + yyy;
        }
      } else {
        finalString += yyy;
      }
    } else {
      if (_backSlashCount(finalString) > 1 && oldVal.length > value.length) {
        var valueUpdate = finalString.split(seperator);
        finalString = valueUpdate[0] + seperator + valueUpdate[1];
      }
    }
  }

  return finalString;
}

TextSelection _updateCursorPosition(String text, TextEditingValue oldValue) {
  var endOffset = max(
    oldValue.text.length - oldValue.selection.end,
    0,
  );
  var selectionEnd = text.length - endOffset;
  // print('My log ---> $selectionEnd');
  return TextSelection.fromPosition(TextPosition(offset: selectionEnd));
}

int _backSlashCount(String value) {
  return '/'.allMatches(value).length;
}
