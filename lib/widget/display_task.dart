import 'package:flutter/material.dart';

import 'package:todolist/data/data.dart';
import 'package:todolist/utils/utils.dart';
import 'package:todolist/widget/widgets.dart';

class DisplayTask extends StatelessWidget {
  const DisplayTask(
      {super.key, required this.tasks, this.isCompletedTasks = false});

  final List<Task> tasks;
  final bool isCompletedTasks;
  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final emptyMessageTask = isCompletedTasks
        ? 'There is no complated task yet'
        : 'There is no task todo!';
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    return CommandContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyMessageTask,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {},
                  onTap: () async {
                    await showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return TaskDetail(
                            task: task,
                          );
                        });
                  },
                  child: TaskList(
                    task: task,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
