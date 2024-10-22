import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sr_ui/core/start/widget/app_startup_widget.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}
