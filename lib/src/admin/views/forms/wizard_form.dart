import 'package:admin_dashboard/src/admin/constant/color.dart';
import 'package:admin_dashboard/src/admin/constant/string.dart';
import 'package:admin_dashboard/src/admin/provider/form/form_wizard/bloc/form_wizard_bloc.dart';
import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:admin_dashboard/src/admin/widget/textformfield.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class WizardForm extends StatefulWidget {
  const WizardForm({Key? key}) : super(key: key);

  @override
  State<WizardForm> createState() => _WizardFormState();
}

class _WizardFormState extends State<WizardForm> {
  final FormWizardBloc _formWizardBloc = FormWizardBloc();
  final List<TextEditingController> _controllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final TextEditingController _cardController = TextEditingController();
  final List<String> _cardList = [
    'American Express',
    'Visa',
    'MasterCard',
    'Discover'
  ];
  int _index = 0;
  int _clickCount = 0;
  bool _isFinish = false;
  bool _isCheck = false;
  String? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _formWizardBloc,
      child: BlocConsumer<FormWizardBloc, FormWizardState>(
        listener: (context, state) {
          state.whenOrNull(
            nextSuccess: (nextIndex, clickCounter) {
              _index = nextIndex;
              _clickCount = clickCounter;
            },
            finishSuccess: (isFinished) {
              _isFinish = isFinished;
            },
            previousSuccess: (previousIndex) {
              _index = previousIndex;
            },
            stepperSuccess: (stepperIndex) {
              _index = stepperIndex;
            },
          );
        },
        builder: (context, state) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    languageModel.form.wizardForm,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  FxBox.h24,
                  Responsive.isWeb(context)
                      ? Row(
                          children: [
                            Expanded(
                              child: _stepperTitle(
                                  1, languageModel.form.sellerDetails),
                            ),
                            FxBox.w8,
                            Expanded(
                              child: _stepperTitle(
                                  2, languageModel.form.companyDocument),
                            ),
                            FxBox.w8,
                            Expanded(
                              child: _stepperTitle(
                                  3, languageModel.form.bankDetails),
                            ),
                            FxBox.w8,
                            Expanded(
                              child: _stepperTitle(
                                  4, languageModel.form.confirmDetails),
                            ),
                          ],
                        )
                      : Responsive.isTablet(context)
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: _stepperTitle(
                                          1, languageModel.form.sellerDetails),
                                    ),
                                    FxBox.w8,
                                    Expanded(
                                      child: _stepperTitle(2,
                                          languageModel.form.companyDocument),
                                    ),
                                  ],
                                ),
                                FxBox.h8,
                                Row(
                                  children: [
                                    Expanded(
                                      child: _stepperTitle(
                                          3, languageModel.form.bankDetails),
                                    ),
                                    FxBox.w8,
                                    Expanded(
                                      child: _stepperTitle(
                                          4, languageModel.form.confirmDetails),
                                    ),
                                  ],
                                )
                              ],
                            )
                          : Column(
                              children: [
                                _stepperTitle(
                                    1, languageModel.form.sellerDetails),
                                FxBox.h8,
                                _stepperTitle(
                                    2, languageModel.form.companyDocument),
                                FxBox.h8,
                                _stepperTitle(
                                    3, languageModel.form.bankDetails),
                                FxBox.h8,
                                _stepperTitle(
                                    4, languageModel.form.confirmDetails),
                              ],
                            ),
                  FxBox.h24,
                  if (_index == 0) _sellerDetailData(),
                  if (_index == 1) _companyDocumentsData(),
                  if (_index == 2) _bankDetailsData(),
                  if (_index == 3) _confirmDetailData(),
                  FxBox.h24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FxButton(
                        borderRadius: 15.0,
                        onPressed: _index == 0
                            ? null
                            : () {
                                if (_isFinish) {
                                  _formWizardBloc.add(
                                    const FormWizardEvent.finishClick(false),
                                  );
                                }
                                _formWizardBloc.add(
                                  FormWizardEvent.previousClick(_index - 1),
                                );
                              },
                        text: _index == 0 ? '' : Strings.previous,
                      ),
                      FxBox.w16,
                      FxButton(
                        borderRadius: 15.0,
                        onPressed: () {
                          if (_index < 3) {
                            _formWizardBloc.add(
                              FormWizardEvent.nextClick(
                                _index + 1,
                                _index == _clickCount
                                    ? _clickCount + 1
                                    : _clickCount,
                              ),
                            );
                          } else if (_index == 3) {
                            _formWizardBloc.add(
                              const FormWizardEvent.finishClick(true),
                            );
                          }
                        },
                        text: _index != 3 ? Strings.next : Strings.finish,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _stepperTitle(int number, String title) {
    final isSelected = _index == number - 1;
    final tapIndex = number - 1;

    return GestureDetector(
      onTap: () {
        if (_clickCount >= tapIndex) {
          _formWizardBloc.add(FormWizardEvent.stepperClick(tapIndex));
        }

        if (_isFinish && tapIndex < 3) {
          _formWizardBloc.add(const FormWizardEvent.finishClick(false));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: isSelected && !_isFinish
              ? ColorConst.primary
              : ColorConst.stepperBackGround,
        ),
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            // Container(
            //   alignment: Alignment.center,
            //   height: 38,
            //   width: 38,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     border: Border.all(
            //       width: 2.0,
            //       color: isSelected && !_isFinish
            //           ? ColorConst.white
            //           : ColorConst.primary,
            //     ),
            //   ),
            //   child: Text(
            //     '$number.',
            //     style: TextStyle(
            //       fontSize: 17.0,
            //       fontWeight: FontWeight.w500,
            //       color: isSelected && !_isFinish
            //           ? ColorConst.white
            //           : ColorConst.primary,
            //     ),
            //   ),
            // ),
            FxBox.w10,
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected && !_isFinish
                      ? ColorConst.white
                      : ColorConst.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _commonTitle(String text, {TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(fontWeight: FontWeight.w500),
    );
  }

  Widget _commonTextField(String hintText, TextEditingController controller,
      {int? maxLines = 1}) {
    return CustomTextField(
      controller: controller,
      maxLines: maxLines,
      border: const OutlineInputBorder(),
      hintText: hintText,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 12,
      ),
    );
  }

  Widget _sellerDetailData() {
    return Responsive.isWeb(context)
        ? Column(
            children: [
              _dataViewWebCommon(
                languageModel.form.sellerName,
                'Enter your name',
                languageModel.form.mobileNo,
                'Enter your number',
                null,
                _controllerList[0],
                _controllerList[1],
              ),
              FxBox.h24,
              _dataViewWebCommon(
                '${languageModel.form.address} 1',
                'Enter Your address',
                '${languageModel.form.address} 2',
                'Enter Work address',
                3,
                _controllerList[4],
                _controllerList[5],
              ),
              FxBox.h24,
              _dataViewWebCommon(
                languageModel.form.companyName,
                'Enter your company name',
                languageModel.form.liveMarketAccount,
                'Enter A/C number',
                null,
                _controllerList[6],
                _controllerList[7],
              ),
              FxBox.h24,
              _dataViewWebCommon(
                languageModel.form.productCategory,
                '',
                languageModel.form.productSubCategory,
                '',
                null,
                _controllerList[8],
                _controllerList[9],
              ),
            ],
          )
        : Responsive.isTablet(context)
            ? Column(
                children: [
                  _dataViewTabCommon(
                    languageModel.form.contactPerson,
                    'Enter your name',
                    languageModel.form.mobileNo,
                    'Enter your number',
                    null,
                    _controllerList[0],
                    _controllerList[1],
                  ),
                  FxBox.h24,
                  _dataViewTabCommon(
                    '${languageModel.form.address} 1',
                    'Enter your address',
                    '${languageModel.form.address} 2',
                    'Enter work address',
                    3,
                    _controllerList[4],
                    _controllerList[5],
                  ),
                  FxBox.h24,
                  _dataViewTabCommon(
                    languageModel.form.companyName,
                    'Enter your company name',
                    languageModel.form.liveMarketAccount,
                    'Enter A/C number',
                    null,
                    _controllerList[6],
                    _controllerList[7],
                  ),
                  FxBox.h24,
                  _dataViewTabCommon(
                    languageModel.form.productCategory,
                    '',
                    languageModel.form.productSubCategory,
                    '',
                    null,
                    _controllerList[8],
                    _controllerList[9],
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _commonTitle(languageModel.form.sellerName),
                  FxBox.h8,
                  _commonTextField('Enter your name', _controllerList[0]),
                  FxBox.h24,
                  _commonTitle(languageModel.form.mobileNo),
                  FxBox.h8,
                  _commonTextField('Enter your number', _controllerList[1]),
                  FxBox.h24,
                  _commonTitle(languageModel.form.emailID),
                  FxBox.h8,
                  _commonTextField('Enter your email', _controllerList[3]),
                  FxBox.h24,
                  _commonTitle('${languageModel.form.address} 1'),
                  FxBox.h8,
                  _commonTextField(
                    'Enter your address',
                    _controllerList[4],
                    maxLines: 3,
                  ),
                  FxBox.h24,
                  _commonTitle('${languageModel.form.address} 2'),
                  FxBox.h8,
                  _commonTextField(
                    'Enter work address',
                    _controllerList[5],
                    maxLines: 3,
                  ),
                  FxBox.h24,
                  _commonTitle(languageModel.form.companyName),
                  FxBox.h8,
                  _commonTextField(
                    'Enter your company name',
                    _controllerList[6],
                  ),
                  FxBox.h24,
                  _commonTitle(languageModel.form.liveMarketAccount),
                  FxBox.h8,
                  _commonTextField('Enter A/C number', _controllerList[7]),
                  FxBox.h24,
                  _commonTitle(languageModel.form.productCategory),
                  FxBox.h8,
                  _commonTextField('', _controllerList[8]),
                  FxBox.h24,
                  _commonTitle(languageModel.form.productSubCategory),
                  FxBox.h8,
                  _commonTextField('', _controllerList[9]),
                ],
              );
  }

  Widget _companyDocumentsData() {
    return Responsive.isWeb(context)
        ? Column(
            children: [
              _dataViewWebCommon(
                languageModel.form.panCard,
                'Enter pancard number',
                languageModel.form.vatTinNo,
                'Enter tin number',
                null,
                _controllerList[10],
                _controllerList[11],
              ),
              FxBox.h24,
              _dataViewWebCommon(
                languageModel.form.cstNo,
                'Enter cst number',
                languageModel.form.serviceTaxNo,
                'Service tax number',
                null,
                _controllerList[12],
                _controllerList[13],
              ),
              FxBox.h24,
              _dataViewWebCommon(
                languageModel.form.companyUIN,
                'Enter uin pin',
                languageModel.form.declaration,
                '',
                null,
                _controllerList[14],
                _controllerList[15],
              ),
            ],
          )
        : Responsive.isTablet(context)
            ? Column(
                children: [
                  _dataViewTabCommon(
                    languageModel.form.panCard,
                    'Enter pancard number',
                    languageModel.form.vatTinNo,
                    'Enter tin number',
                    null,
                    _controllerList[10],
                    _controllerList[11],
                  ),
                  FxBox.h24,
                  _dataViewTabCommon(
                    languageModel.form.cstNo,
                    'Enter cst number',
                    languageModel.form.serviceTaxNo,
                    'Service tax number',
                    null,
                    _controllerList[12],
                    _controllerList[13],
                  ),
                  FxBox.h24,
                  _dataViewTabCommon(
                    languageModel.form.companyUIN,
                    'Enter uin pin',
                    languageModel.form.declaration,
                    '',
                    null,
                    _controllerList[14],
                    _controllerList[15],
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _commonTitle(languageModel.form.panCard),
                  FxBox.h8,
                  _commonTextField('Enter pancard number', _controllerList[10]),
                  FxBox.h24,
                  _commonTitle(languageModel.form.vatTinNo),
                  FxBox.h8,
                  _commonTextField('Enter tin number', _controllerList[11]),
                  FxBox.h24,
                  _commonTitle(languageModel.form.cstNo),
                  FxBox.h8,
                  _commonTextField('Enter cst number', _controllerList[12]),
                  FxBox.h24,
                  _commonTitle(languageModel.form.serviceTaxNo),
                  FxBox.h8,
                  _commonTextField('Service tax number', _controllerList[13]),
                  FxBox.h24,
                  _commonTitle(languageModel.form.companyUIN),
                  FxBox.h8,
                  _commonTextField('Enter uin pin', _controllerList[14]),
                  FxBox.h24,
                  _commonTitle(languageModel.form.declaration),
                  FxBox.h8,
                  _commonTextField('', _controllerList[15]),
                ],
              );
  }

  Widget _bankDetailsData() {
    return Responsive.isWeb(context)
        ? Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _commonTitle(
                      languageModel.form.nameOnCard,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  FxBox.w16,
                  Expanded(
                    flex: 4,
                    child: _commonTextField(
                      'Enter card name',
                      _controllerList[16],
                    ),
                  ),
                  FxBox.w24,
                  Expanded(
                    child: _commonTitle(
                      languageModel.form.creditCardType,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  FxBox.w16,
                  Expanded(flex: 4, child: _creditCardTextField())
                ],
              ),
              FxBox.h24,
              _dataViewWebCommon(
                languageModel.form.creditCardNumber,
                'Enter credit card number',
                languageModel.form.cardVerificationNumber,
                'Enter verification number',
                null,
                _controllerList[17],
                _controllerList[18],
              ),
              FxBox.h24,
              Row(
                children: [
                  Expanded(
                    child: _commonTitle(
                      languageModel.form.expirationDate,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  FxBox.w16,
                  Expanded(
                    flex: 4,
                    child: _commonTextField(
                      'DD /MM /YYYY',
                      _controllerList[19],
                    ),
                  ),
                  FxBox.w24,
                  const Expanded(child: SizedBox()),
                  FxBox.w16,
                  const Expanded(flex: 4, child: SizedBox()),
                ],
              ),
            ],
          )
        : Responsive.isTablet(context)
            ? Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _commonTitle(languageModel.form.nameOnCard),
                            FxBox.h8,
                            _commonTextField(
                              'Enter card name',
                              _controllerList[16],
                            )
                          ],
                        ),
                      ),
                      FxBox.w24,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _commonTitle(languageModel.form.creditCardType),
                            FxBox.h8,
                            _creditCardTextField(),
                          ],
                        ),
                      )
                    ],
                  ),
                  FxBox.h24,
                  _dataViewTabCommon(
                    languageModel.form.creditCardNumber,
                    'Enter credit card number',
                    languageModel.form.cardVerificationNumber,
                    'Enter verification number',
                    null,
                    _controllerList[17],
                    _controllerList[18],
                  ),
                  FxBox.h24,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _commonTitle(languageModel.form.expirationDate),
                            FxBox.h8,
                            _commonTextField(
                              'DD /MM /YYYY',
                              _controllerList[19],
                            )
                          ],
                        ),
                      ),
                      FxBox.w24,
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(),
                            FxBox.h8,
                            const SizedBox(),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _commonTitle(languageModel.form.nameOnCard),
                  FxBox.h8,
                  _commonTextField('Enter card number', _controllerList[16]),
                  FxBox.h24,
                  _commonTitle(languageModel.form.creditCardType),
                  FxBox.h8,
                  _creditCardTextField(),
                  FxBox.h24,
                  _commonTitle(languageModel.form.creditCardNumber),
                  FxBox.h8,
                  _commonTextField(
                    'Enter credit card number',
                    _controllerList[17],
                  ),
                  FxBox.h24,
                  _commonTitle(languageModel.form.cardVerificationNumber),
                  FxBox.h8,
                  _commonTextField(
                      'Enter verification number', _controllerList[18]),
                  FxBox.h24,
                  _commonTitle(languageModel.form.expirationDate),
                  FxBox.h8,
                  _commonTextField('DD /MM/ YYYY', _controllerList[19]),
                ],
              );
  }

  Widget _confirmDetailData() {
    return Column(
      children: [
        FxBox.h24,
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              BlocBuilder<FormWizardBloc, FormWizardState>(
                builder: (context, state) {
                  state.whenOrNull(
                    checkSuccess: (value) {
                      _isCheck = value;
                    },
                  );
                  return SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      value: _isCheck,
                      onChanged: (value) {
                        _formWizardBloc.add(FormWizardEvent.check(value!));
                      },
                    ),
                  );
                },
              ),
              FxBox.w8,
              Expanded(
                child: Text(
                  languageModel.form.confirmText,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
        FxBox.h24,
      ],
    );
  }

  Widget _dataViewWebCommon(
    String title1,
    String hint1,
    String title2,
    String hint2,
    int? maxLines,
    TextEditingController controller1,
    TextEditingController controller2,
  ) {
    return Row(
      crossAxisAlignment:
          maxLines == 3 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Expanded(
          child: _commonTitle(
            title1,
            textAlign: TextAlign.end,
          ),
        ),
        FxBox.w16,
        Expanded(
          flex: 4,
          child: _commonTextField(
            hint1,
            controller1,
            maxLines: maxLines,
          ),
        ),
        FxBox.w24,
        Expanded(
          child: _commonTitle(
            title2,
            textAlign: TextAlign.end,
          ),
        ),
        FxBox.w16,
        Expanded(
          flex: 4,
          child: _commonTextField(
            hint2,
            controller2,
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }

  Widget _dataViewTabCommon(
    String title1,
    String hint1,
    String title2,
    String hint2,
    int? maxLines,
    TextEditingController controller1,
    TextEditingController controller2,
  ) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _commonTitle(title1),
              FxBox.h8,
              _commonTextField(hint1, controller1, maxLines: maxLines)
            ],
          ),
        ),
        FxBox.w24,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _commonTitle(title2),
              FxBox.h8,
              _commonTextField(hint2, controller2, maxLines: maxLines),
            ],
          ),
        )
      ],
    );
  }

  Widget _creditCardTextField() {
    return BlocConsumer<FormWizardBloc, FormWizardState>(
      listener: (context, state) {
        state.whenOrNull(
          dropDownSuccess: (value) {
            _dropDownValue = value;
            _cardController.text = value;
          },
        );
      },
      builder: (context, state) {
        return CustomTextField(
          suffixIcon: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton(
                hint: const Text('--Please Select--'),
                borderRadius: BorderRadius.circular(4),
                elevation: 0,
                isExpanded: true,
                isDense: true,
                focusColor: ColorConst.transparent,
                value: _dropDownValue,
                items: _cardList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (value) {
                  _formWizardBloc.add(
                    FormWizardEvent.dropDown(value.toString()),
                  );
                },
              ),
            ),
          ),
          controller: _cardController,
          border: const OutlineInputBorder(),
          isDense: true,
          readOnly: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 12,
          ),
        );
      },
    );
  }
}
