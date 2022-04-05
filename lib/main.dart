import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;

import 'package:window_manager/window_manager.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_flutter/src/presentation/scale/bloc/scale_bloc.dart';
import 'package:scale_flutter/src/presentation/home/home_page.dart';

import 'src/data/dependency_injection.dart';
import 'src/presentation/home/bloc/home_page_bloc.dart';

/// Checks if the current environment is a desktop environment.
bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  if (isDesktop) {
    await flutter_acrylic.Window.initialize();
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden,
          windowButtonVisibility: false);

      await windowManager.setResizable(true);
      
      
      await windowManager.setMinimumSize(const Size(755, 545));
      await windowManager.center();
      await windowManager.show();
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
    });
  }
  runApp(const ScaleFlutter());
}

class ScaleFlutter extends StatelessWidget {
  const ScaleFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScaleBloc>(
          create: (context) => sl<ScaleBloc>(),
        ),
        BlocProvider<HomePageBloc>(
          create: (context) => sl<HomePageBloc>(),
        ),
      ],
      child: FluentApp(
        title: 'Zenith Scale',
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          visualDensity: VisualDensity.standard,
          focusTheme: FocusThemeData(
            glowFactor: is10footScreen() ? 2.0 : 0.0,
          ),
        ),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.blue,
          iconTheme: const IconThemeData(size: 24),
          visualDensity: VisualDensity.standard,
          focusTheme: FocusThemeData(
            glowFactor: is10footScreen() ? 2.0 : 0.0,
          ),
        ),
        builder: (context, child) {
          return NavigationPaneTheme(
            data: NavigationPaneThemeData(),
            child: child!,
          );
        },
      ),
    );
  }
}
