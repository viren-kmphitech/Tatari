import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tatari/app/ui/widgets/custom_text.dart';

class EnableLocationView extends StatelessWidget {
  const EnableLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppText("Location view", style: context.textTheme.headlineSmall),
      ),
    );
  }
}
