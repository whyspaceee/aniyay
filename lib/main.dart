import 'package:aniyay/bloc/main_menu_bloc.dart';
import 'package:aniyay/data/providers/api_provider.dart';
import 'package:aniyay/data/repositories/main_menu.repository.dart';
import 'package:aniyay/ui/view/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:aniyay/theme/scheme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => MainMenuRepository(ApiProvider()))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => MainMenuBloc(
                  RepositoryProvider.of<MainMenuRepository>(_, listen: false)))
        ],
        child: MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: lightColorScheme,
            textTheme: GoogleFonts.interTextTheme(),
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
