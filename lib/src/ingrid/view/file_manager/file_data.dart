import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';

class FileData {
  static final List<Map<String, dynamic>> fileTypeList = [
    {
      'folder_icon': ConstIcons.folderFile,
      'folder_name': ConstString.allFile,
    },
    {
      'folder_icon': ConstIcons.image,
      'folder_name': ConstString.images,
    },
    {
      'folder_icon': ConstIcons.video,
      'folder_name': ConstString.video,
    },
    {
      'folder_icon': ConstIcons.music,
      'folder_name': ConstString.music,
    },
    {
      'folder_icon': ConstIcons.document,
      'folder_name': ConstString.documents,
    },
    {
      'folder_icon': ConstIcons.menu,
      'folder_name': ConstString.more,
    },
  ];
  static final List<Map<String, dynamic>> recentTypeList = [
    {
      'file_icon': ConstIcons.image,
      'file_name': 'Scenery.jpg',
      'file_item': '1 File',
      'file_date': '28/2/2021',
      'file_size': '1.0 MB',
    },
    {
      'file_icon': ConstIcons.video,
      'file_name': 'Scenery.mp4',
      'file_item': '1 File',
      'file_date': '28/2/2021',
      'file_size': '25.0 MB',
    },
    {
      'file_icon': ConstIcons.image,
      'file_name': 'Scenery.jpg',
      'file_item': '1 File',
      'file_date': '28/2/2021',
      'file_size': '1.02 MB',
    },
    {
      'file_icon': ConstIcons.music,
      'file_name': 'Scenery.mp3',
      'file_item': '1 File',
      'file_date': '28/2/2021',
      'file_size': '21.0 MB',
    },
    {
      'file_icon': ConstIcons.image,
      'file_name': 'Scenery.jpg',
      'file_item': '1 File',
      'file_date': '28/2/2021',
      'file_size': '1.20 MB',
    },
    {
      'file_icon': ConstIcons.document,
      'file_name': 'Scenery.doc',
      'file_item': '1 File',
      'file_date': '28/2/2021',
      'file_size': '10.0 MB',
    },
  ];
}
