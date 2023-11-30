import 'package:flutter/material.dart';
import 'package:todolist/utils/utils.dart';

class AppAlert {
  AppAlert._();

  static displaySnacBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.surface,
        ),
      ),
      backgroundColor: context.colorScheme.primary,
    ));
  }
}
