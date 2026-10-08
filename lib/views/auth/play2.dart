import 'package:flutter/material.dart';

class Play2View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
         ClipRRect(
        child:Image.network("https://media.shafaq.com/media/arcella/1756491094641.webp",),
        borderRadius: BorderRadius.circular(24),
         ),
        ],
      )),

    );
  }
}
