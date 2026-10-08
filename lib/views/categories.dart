import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  bool isLoading = false;

  List<Categories> categoriesList = [];

  void getData() async {
    isLoading = true;
    setState(() {});

    Dio dio = Dio();
    final resp = await dio.get("https://cosmatics.growfet.com/api/Categories");

    List details = resp.data as List;
    categoriesList = details.map((e) => Categories.fromJson(e)).toList();

    for (var category in categoriesList) {
      print("ID: ${category.id}");
      print("Title EN: ${category.titleEn}");
      print("Title AR: ${category.titleAr}");
      print("Image URL: ${category.imageUrl}");
    }

    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: categoriesList.length,
                itemBuilder: (context, index) {
                  final category = categoriesList[index];
                  return ListTile(
                    // عرض صورة القسم مع حماية لو الرابط فيه مشكلة
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        category.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.category, size: 40),
                      ),
                    ),
                    // الاسم بالعربي
                    title: Text(
                      category.titleAr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // الاسم بالإنجليزي
                    subtitle: Text(category.titleEn),
                  );
                },
              ),
      ),
    );
  }
}

class Categories {
  Categories({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.imageUrl,
  });
  late final int id;
  late final String titleEn;
  late final String titleAr;
  late final String imageUrl;

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title_en'] = titleEn;
    _data['title_ar'] = titleAr;
    _data['image_url'] = imageUrl;
    return _data;
  }
}
