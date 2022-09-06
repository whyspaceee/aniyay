import 'package:aniyay/bloc/main_menu_bloc.dart';
import 'package:aniyay/theme/scheme.dart';
import 'package:aniyay/ui/widgets/scrollable_previews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: lightColorScheme.secondary),
        title: Text(
          "aniyay",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: lightColorScheme.secondary),
        ),
      ),
      drawer: Drawer(
        child: Container(child: const Text("Hello")),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: const EdgeInsets.all(15),
            child: BlocBuilder(
              bloc: BlocProvider.of<MainMenuBloc>(context, listen: false),
              builder: (context, state) {
                if (state is MainMenuLoaded) {
                  return Column(
                    children: [
                      ScrollablePreviews(
                          title: "Trending", models: state.model.trendingModel),
                      ScrollablePreviews(
                          title: "Popular", models: state.model.popularModel),
                      ScrollablePreviews(
                          title: "Highest-Rated",
                          models: state.model.scoreModel),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
