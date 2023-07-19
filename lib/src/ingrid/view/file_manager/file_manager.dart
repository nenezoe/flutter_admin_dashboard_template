import 'package:admin_dashboard/src/ingrid/view/file_manager/file_type.dart';
import 'package:admin_dashboard/src/ingrid/view/file_manager/storage_card.dart';
import 'package:admin_dashboard/src/ingrid/widget/title.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

@RoutePage()
class FileManager extends StatefulWidget {
  const FileManager({super.key});

  @override
  State<FileManager> createState() => _FileManagerState();
}

class _FileManagerState extends State<FileManager> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FxBox.h24,
            const RouteTitle(),
            FxBox.h24,
             const StorageCard(),
            FxBox.h24,
            const FileType(),
            SafeArea(child: FxBox.h24),
          ],
        ),
      ),
    );
  }
}
