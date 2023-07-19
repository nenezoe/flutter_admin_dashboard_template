import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';

class ToDoData {
  static final List<Map<String, dynamic>> todoDrawerList = [
    {
      'folder_icon': ConstIcons.favourite,
      'folder_name': ConstString.important,
    },
    {
      'folder_icon': ConstIcons.read,
      'folder_name': ConstString.completed,
    },
    {
      'folder_icon': ConstIcons.trash,
      'folder_name': ConstString.trash,
    },
    {
      'folder_icon': ConstIcons.menu,
      'folder_name': ConstString.more,
    },
  ];
  static final List<Map<String, dynamic>> todoDrawerLabelList = [
    {
      'folder_icon': ConstIcons.important,
      'folder_name': ConstString.important,
    },
    {
      'folder_icon': ConstIcons.important,
      'folder_name': ConstString.urgent,
    },
    {
      'folder_icon': ConstIcons.important,
      'folder_name': ConstString.high,
    },
    {
      'folder_icon': ConstIcons.important,
      'folder_name': ConstString.low,
    },
  ];

  static const List<Map<String, dynamic>> todotaskList = [
    {
      'date': '2 March 2021,  12:30 PM',
      'task_name': 'Fix Server Trouble',
      'status': [
        ConstString.urgent,
        ConstString.important,
      ],
      'assign_user': 3,
      'isCheck': false,
    },
    {
      'date': '2 March 2021,  12:30 PM',
      'task_name': 'User Research',
      'status': [
        ConstString.team,
        ConstString.high,
      ],
      'assign_user': 3,
      'isCheck': true,
    },
    {
      'date': '2 March 2021,  12:30 PM',
      'task_name': 'Client Meeting',
      'status': [
        ConstString.important,
      ],
      'assign_user': 3,
      'isCheck': false,
    },
    {
      'date': '2 March 2021,  12:30 PM',
      'task_name': 'Add Cart Icon',
      'status': [
        ConstString.low,
      ],
      'assign_user': 1,
      'isCheck': true,
    },
    {
      'date': '2 March 2021,  12:30 PM',
      'task_name': 'Issue Report',
      'status': [
        ConstString.important,
      ],
      'assign_user': 2,
      'isCheck': false,
    },
  ];
}
