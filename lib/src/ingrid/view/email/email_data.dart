import 'package:admin_dashboard/src/ingrid/constant/icons.dart';
import 'package:admin_dashboard/src/ingrid/constant/string.dart';

class EmailData {
  static final List<Map<String, dynamic>> emailDrawerList = [
    {
      'folder_icon': ConstIcons.inbox,
      'folder_name': ConstString.inbox,
    },
    {
      'folder_icon': ConstIcons.send,
      'folder_name': ConstString.send,
    },
    {
      'folder_icon': ConstIcons.favourite,
      'folder_name': ConstString.favourite,
    },
    {
      'folder_icon': ConstIcons.draft,
      'folder_name': ConstString.draft,
    },
    {
      'folder_icon': ConstIcons.important,
      'folder_name': ConstString.important,
    },
    {
      'folder_icon': ConstIcons.menu,
      'folder_name': ConstString.more,
    },
  ];

  static final List<Map<String, dynamic>> emailData = [
    {
      'sender_name': 'Samantha William',
      'isImporatant': false,
      'mail_title': 'Server Trouble',
      'mail_des':
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ',
      'isFavourite': false,
      'receive_time': '2 hour ago',
    },
    {
      'sender_name': 'Karen Hope',
      'isImporatant': true,
      'mail_title': 'Meeting Schedule Weekly',
      'mail_des':
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ',
      'isFavourite': false,
      'receive_time': '2 hour ago',
    },
    {
      'sender_name': 'Jordan Nico',
      'isImporatant': false,
      'mail_title': 'Server Maintenance Scheldule',
      'mail_des':
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ',
      'isFavourite': false,
      'receive_time': '2 hour ago',
    },
    {
      'sender_name': 'Tony Soap',
      'isImporatant': false,
      'mail_title': 'Server Trouble',
      'mail_des':
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ',
      'isFavourite': false,
      'receive_time': '2 hour ago',
    },
    {
      'sender_name': 'Jordan Nico',
      'isImporatant': false,
      'mail_title': 'Memory Need Backup',
      'mail_des':
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ',
      'isFavourite': true,
      'receive_time': '2 hour ago',
    },
    {
      'sender_name': 'Tony Soap',
      'isImporatant': false,
      'mail_title': 'Check User Review',
      'mail_des':
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ',
      'isFavourite': false,
      'receive_time': '2 hour ago',
    },
  ];
}
