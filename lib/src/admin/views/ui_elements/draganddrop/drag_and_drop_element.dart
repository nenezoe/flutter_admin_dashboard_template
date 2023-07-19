import 'package:admin_dashboard/src/admin/utils/localization/multi_language.dart';
import 'package:admin_dashboard/src/admin/utils/responsive.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@RoutePage()
class DragAndDrop extends StatefulWidget {
  const DragAndDrop({super.key});

  @override
  State<DragAndDrop> createState() => _DragAndDropState();
}

class _DragAndDropState extends State<DragAndDrop> {
  @override
  Widget build(BuildContext context) {
    List<String> temp = [
      'A Task',
      'B Task',
      'C Task',
      'D Task',
      'E Task',
      'F Task',
      'G Task',
      'H Task',
      'I Task',
      'J Task'
    ];

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              languageModel.widget.dragAndDrop,
              style:
                  const TextStyle(fontWeight: FontWeight.w500, fontSize: 24.0),
            ),
            const Divider(),
            Responsive.isMobile(context)
                ? ReorderableListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemExtent: 50,
                    buildDefaultDragHandles: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        key: ValueKey(index),
                        children: [
                          ReorderableDragStartListener(
                            index: index,
                            child: const Icon(Icons.drag_handle),
                          ),
                          Text(
                            temp[index],
                            style: textStyle(),
                          ),
                          Text(
                            'Sarvadhi@gmail.com',
                            style: textStyle(),
                          ),
                          const Icon(
                            Icons.delete,
                          )
                        ],
                      );
                    },
                    itemCount: temp.length,
                    onReorder: (oldIndex, newIndex) {
                      final item = temp.removeAt(oldIndex);
                      temp.insert(
                          newIndex > oldIndex ? newIndex - 1 : newIndex, item);
                    },
                  )
                : Responsive.isTablet(context)
                    ? ReorderableListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemExtent: 50,
                        buildDefaultDragHandles: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            key: ValueKey(index),
                            children: [
                              ReorderableDragStartListener(
                                index: index,
                                child: const Icon(Icons.drag_handle),
                              ),
                              Text(
                                temp[index],
                                style: textStyle(),
                              ),
                              Text(
                                'Sarvadhi@gmail.com',
                                style: textStyle(),
                              ),
                              Text(
                                DateFormat("MMMM dd, yyyy").format(
                                  DateTime.now(),
                                ),
                                style: textStyle(),
                              ),
                              const Icon(
                                Icons.delete,
                              )
                            ],
                          );
                        },
                        itemCount: temp.length,
                        onReorder: (oldIndex, newIndex) {
                          final item = temp.removeAt(oldIndex);
                          temp.insert(
                              newIndex > oldIndex ? newIndex - 1 : newIndex,
                              item);
                        },
                      )
                    : ReorderableListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemExtent: 50,
                        buildDefaultDragHandles: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            key: ValueKey(index),
                            children: [
                              ReorderableDragStartListener(
                                index: index,
                                child: const Icon(Icons.drag_handle),
                              ),
                              Text(
                                temp[index],
                                style: textStyle(),
                              ),
                              Text(
                                'Sarvadhi@gmail.com',
                                style: textStyle(),
                              ),
                              Text(
                                'Business Development',
                                style: textStyle(),
                              ),
                              Text(
                                'All Developer',
                                style: textStyle(),
                              ),
                              Text(
                                DateFormat("MMMM dd, yyyy").format(
                                  DateTime.now(),
                                ),
                                style: textStyle(),
                              ),
                              const Icon(
                                Icons.delete,
                              )
                            ],
                          );
                        },
                        itemCount: temp.length,
                        onReorder: (oldIndex, newIndex) {
                          final item = temp.removeAt(oldIndex);
                          temp.insert(
                            newIndex > oldIndex ? newIndex - 1 : newIndex,
                            item,
                          );
                        },
                      ),
          ],
        ),
      ),
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
    );
  }
}
