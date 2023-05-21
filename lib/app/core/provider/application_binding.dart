import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "package:macieuls_coffee/app/pages/main/controllers/main_controller.dart";

class ApplicationBinding extends StatelessWidget {
  final Widget child;

  const ApplicationBinding({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <Provider>[
        Provider<MainController>(create: (BuildContext context) => MainController())
      ],
      child: this.child
    );
  }
}