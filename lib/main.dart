import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'cyber_services/views/main_holder.dart';

void main() {
  Animate.restartOnHotReload = true;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MainHolder());
  }
}
