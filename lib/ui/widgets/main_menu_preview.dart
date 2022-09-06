import 'package:flutter/material.dart';
import 'package:aniyay/data/models/main_menu_model.dart';

class MainMenuPreviewImage extends StatelessWidget {
  final MainMenuModel model;
  const MainMenuPreviewImage({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => {},
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(model.mediaURL), fit: BoxFit.cover))),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: 125,
            height: 40,
            child: Container(
              child: Text(
                model.title.trim(),
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          Container(
              width: 125,
              height: 20,
              child: Container(
                child: Text(
                  model.genres[0].trim(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
        ]),
      ),
    );
  }
}
