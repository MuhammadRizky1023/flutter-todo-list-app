import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/config/config.dart';
import 'package:todolist/provider/task/task.dart';
import 'package:todolist/utils/utils.dart';
import 'package:todolist/widget/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState = ref.watch(taskProvider);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayText(
                      text: "Nov 27, 2023",
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    Gap(20),
                    DisplayText(
                      text: "My Todo App",
                      fontSize: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DisplayTask(tasks: taskState.tasks),
                  Text(
                    'Completed',
                    style: context.textTheme.headlineMedium,
                  ),
                  const Gap(20),
                  DisplayTask(
                    tasks: taskState.tasks,
                    isCompletedTasks: true,
                  ),
                  const Gap(20),
                  ElevatedButton(
                      onPressed: () =>
                          context.push(RouteLocation.createTaskScreen),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DisplayText(
                          text: "Add New Task",
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
