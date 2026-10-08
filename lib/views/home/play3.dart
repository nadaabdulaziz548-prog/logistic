import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class Play3View extends StatefulWidget {
  const Play3View({super.key});

  @override
  State<Play3View> createState() => _Play3ViewState();
}

class _Play3ViewState extends State<Play3View> {
  String? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              child: Container(height: 100.w, width: 100.w, color: Colors.red),
              baseColor:Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
            ),
            SizedBox(height: 20,),
            // Image.file(
            //File(
            // "/data/user/0/com.example.flutter_application_2/cache/7588c0f4-14bf-4de2-bf5a-f1b0eeb84e2e/1000630237.jpg",
            // ),
            // width: 200,
            //height: 200,
            //),
            GestureDetector(
              onTap: () async {
                final result = await ImagePicker().pickImage(
                  source: ImageSource.gallery,
                );
                print("nada ${result?.path}");
                selectedImage = result?.path;
                setState(() {});
              },
              child: CircleAvatar(
                radius: 100.r,
                backgroundImage: selectedImage != null
                    ? FileImage(File(selectedImage!))
                    : null,
              ),
            ),

            SizedBox(height: 20),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () async {
                final result = await ImagePicker().pickImage(
                  source: ImageSource.camera,
                );
                selectedImage = result?.path;
                setState(() {});
              },
              child: Text("Get From Camera"),
            ),
          ],
        ),
      ),
    );
  }
}
