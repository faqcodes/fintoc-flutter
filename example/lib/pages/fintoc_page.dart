import 'package:fintoc/main.dart';
import 'package:fintoc_example/services/fintoc_setup.dart';
import 'package:flutter/material.dart';

class FintocPage extends StatefulWidget {
  const FintocPage({super.key});

  @override
  State<FintocPage> createState() => _FintocPageState();
}

class _FintocPageState extends State<FintocPage> {
  var fintocSetup = FintocSetup();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: FintocWidgetView(
            options: fintocSetup.widgetOptions,
            handlers: fintocSetup.widgetHandlers,
          ),
        ),
      ],
    );
  }
}
