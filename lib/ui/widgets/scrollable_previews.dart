import 'package:aniyay/data/models/main_menu_model.dart';
import 'package:aniyay/ui/widgets/main_menu_preview.dart';
import 'package:flutter/material.dart';
import 'package:aniyay/theme/scheme.dart';

class ScrollablePreviews extends StatelessWidget {
  final String title;
  final List<MainMenuModel> models;
  const ScrollablePreviews({required this.title, required this.models});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: lightColorScheme.secondary),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "See all ",
                  style: TextStyle(
                      color: lightColorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              const WidgetSpan(
                  child: Icon(
                Icons.arrow_forward,
                size: 16,
              )),
            ]))
          ],
        ),
        const SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: models.length,
            itemBuilder: (context, i) {
              return MainMenuPreviewImage(model: models[i]);
            },
            separatorBuilder: (context, i) {
              return const SizedBox(
                width: 15,
              );
            },
          ),
        )
      ]),
    );
  }
}
