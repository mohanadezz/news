import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:news/core/gen/assets.gen.dart';
import 'package:news/models/category_data_model.dart';
import 'package:news/modules/category_news.dart';
import 'package:news/modules/home_view_model.dart';
import 'package:news/modules/widgets/category_card_widget.dart';
import 'package:news/modules/widgets/padding_extention.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryDataModel> categoryList = [
    CategoryDataModel(
      id: 'general',
      title: 'General',
      image: Assets.images.generalDark.path,
    ),
    CategoryDataModel(
      id: 'business',
      title: 'Business',
      image: Assets.images.busniessDark.path,
    ),
    CategoryDataModel(
      id: 'sports',
      title: 'Sports',
      image: Assets.images.sportDark.path,
    ),
    CategoryDataModel(
      id: 'technology',
      title: 'Technology',
      image: Assets.images.technologyDark.path,
    ),
    CategoryDataModel(
      id: 'entertainment',
      title: 'Entertainment',
      image: Assets.images.entertainmentDark.path,
    ),
    CategoryDataModel(
      id: 'health',
      title: 'Health',
      image: Assets.images.helthDark.path,
    ),
    CategoryDataModel(
      id: 'science',
      title: 'Science',
      image: Assets.images.scienceDark.path,
    ),
  ];
  CategoryDataModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedCategory?.title ?? 'News App'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.black,
            child: Column(
              spacing: 24,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 240,
                  width: double.infinity,
                  color: Colors.white,
                  child: Text(
                    'News App',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                  ),
                ),
                Bounceable(
                  onTap: _goToHome,
                  child:
                      Row(
                        spacing: 8,
                        children: [
                          Icon(CupertinoIcons.home, color: Colors.white),
                          Text(
                            'Go To Home',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ).setMDQHorizontalPadding(
                        context: context,
                        withMedia: false,
                        value: 16,
                      ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.white70,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ),
          ),
        ),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Text(
                        'Good Morning\nHere is Some News For You',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ...List.generate(categoryList.length, (index) {
                        return CategoryCardWidget(
                          categoryDataModel: categoryList[index],
                          isLeft: index % 2 == 0,
                          onTap: _onCategoryTap,
                        );
                      }),
                    ],
                  ),
                ),
              )
            : CategoryNews(categoryDataModel: selectedCategory!),
      ),
    );
  }

  void _goToHome() {
    setState(() {
      selectedCategory = null;
      Navigator.pop(context);
    });
  }

  void _onCategoryTap(CategoryDataModel category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
