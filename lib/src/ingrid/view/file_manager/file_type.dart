import 'package:admin_dashboard/src/ingrid/constant/color.dart';
import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';
import 'package:admin_dashboard/src/ingrid/constant/theme.dart';
import 'package:admin_dashboard/src/ingrid/utils/responsive.dart';
import 'package:admin_dashboard/src/ingrid/view/file_manager/file_data.dart';
import 'package:admin_dashboard/src/ingrid/widget/card.dart';
import 'package:admin_dashboard/src/ingrid/widget/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterx/flutterx.dart';

import '../../../admin/widget/svg_icon.dart';

class FileType extends StatefulWidget {
  const FileType({super.key});

  @override
  State<FileType> createState() => _FileTypeState();
}

class _FileTypeState extends State<FileType> {
  int tapIndex = 0;
  String tapName = FileData.fileTypeList[0]['folder_name'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (IngridResponsive.isTablet(context) ||
            IngridResponsive.isMobile(context)) ...[
          Row(
            children: [
              IconButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(72.0, 50.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  backgroundColor: ConstColor.primary,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: _fileTypeBox(),
                      );
                    },
                  );
                },
                icon: const SvgIcon(
                  icon: ConstIcons.folderFile,
                  color: ConstColor.white,
                ),
              ),
              FxBox.w16,
              Text(
                tapName,
                style: ConstTheme.title(context),
              )
            ],
          ),
          FxBox.h24,
          _recentFile(),
        ],
        if (IngridResponsive.isLargeWeb(context) ||
            IngridResponsive.isSmallWeb(context) ||
            IngridResponsive.isMediumWeb(context)) ...[
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _fileTypeBox(),
              ),
              FxBox.w24,
              Expanded(
                flex: 7,
                child: _recentFile(),
              ),
            ],
          ),
        ]
      ],
    );
  }

  Widget _fileTypeBox() {
    return IngridCard(
      child: Column(
        children: [
          _uploadButton(),
          FxBox.h40,
          ListView.separated(
            itemCount: FileData.fileTypeList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  tapIndex = index;
                  if (IngridResponsive.isTablet(context) ||
                      IngridResponsive.isMobile(context)) {
                    Navigator.pop(context);
                    tapName = FileData.fileTypeList[index]['folder_name'];
                  }
                  setState(() {});
                },
                leading: SvgPicture.asset(
                  FileData.fileTypeList[index]['folder_icon'],
                  color: tapIndex == index
                      ? ConstColor.blueAccent
                      : ConstColor.hintColor,
                ),
                title: Text(
                  FileData.fileTypeList[index]['folder_name'],
                  style: ConstTheme.title(context).copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: tapIndex == index
                        ? ConstColor.blueAccent
                        : ConstColor.hintColor,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return FxBox.h20;
            },
          ),
        ],
      ),
    );
  }

  Widget _uploadButton() {
    return MaterialButton(
      onPressed: () {},
      color: ConstColor.blueAccent,
      height: 50.0,
      minWidth: 256.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        ConstString.upload,
        style: ConstTheme.title(context).copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 16.0,
            color: ConstColor.white),
      ),
    );
  }

  Widget _recentFile() {
    return IngridCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ConstString.recentFile,
            style: ConstTheme.title(context)
                .copyWith(fontWeight: FontWeight.w700, fontSize: 24.0),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: (56.0 * 10) + 72.0),
            child: DataTable3(
              showCheckboxColumn: false,
              showBottomBorder: true,
              columnSpacing: 100.0,
              minWidth: 920.0,
              dataRowHeight: 62.0,
              headingRowHeight: 64.0,
              columns: [
                DataColumn2(
                  label: _headerText(title: ConstString.fileName),
                  size: ColumnSize.L,
                ),
                DataColumn2(
                  label: _headerText(title: ConstString.fileItems),
                  size: ColumnSize.M,
                ),
                DataColumn2(
                  label: _headerText(title: ConstString.date),
                  size: ColumnSize.M,
                ),
                DataColumn2(
                  label: _headerText(title: ConstString.fileSIze),
                  size: ColumnSize.M,
                ),
                DataColumn2(
                  label: _headerText(title: ''),
                  size: ColumnSize.S,
                ),
              ],
              rows: FileData.recentTypeList.map((recentFile) {
                return DataRow(cells: [
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgIcon(
                          icon: recentFile['file_icon'],
                          color: _iconColor(recentFile['file_name']),
                          size: 26.0,
                        ),
                        FxBox.w32,
                        Expanded(
                            child: _dataText(title: recentFile['file_name'])),
                      ],
                    ),
                  ),
                  DataCell(_headerText(
                      title: recentFile['file_item'], fontSize: 16.0)),
                  DataCell(_headerText(
                      title: recentFile['file_date'], fontSize: 16.0)),
                  DataCell(_dataText(title: recentFile['file_size'])),
                  const DataCell(
                    SvgIcon(
                      icon: ConstIcons.menu,
                      color: ConstColor.hintColor,
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Color _iconColor(String text) {
    if (text.split('.')[1] == 'jpg' ||
        text.split('.')[1] == 'jpeg' ||
        text.split('.')[1] == 'png') {
      return ConstColor.blueAccent;
    } else if (text.split('.')[1] == 'mp4' ||
        text.split('.')[1] == 'mkv' ||
        text.split('.')[1] == '3gp') {
      return ConstColor.redAccent;
    } else if (text.split('.')[1] == 'mp3' || text.split('.')[1] == 'm4a') {
      return ConstColor.yellow;
    } else if (text.split('.')[1] == 'doc' || text.split('.')[1] == 'zip') {
      return ConstColor.cyan;
    } else {
      return ConstColor.blueAccent;
    }
  }

  Widget _dataText({required String title}) {
    return Text(
      title,
      style: ConstTheme.text(context)
          .copyWith(fontSize: 16.0, fontWeight: FontWeight.w500),
    );
  }

  Widget _headerText({double? fontSize, required String title}) {
    return Text(
      title,
      style: ConstTheme.text(context).copyWith(
        fontSize: fontSize ?? 14.0,
        fontWeight: FontWeight.w500,
        color: ConstColor.hintColor,
      ),
    );
  }
}
