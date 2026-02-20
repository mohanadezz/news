import 'package:flutter/material.dart';
import 'package:news/models/article_data.dart';
import 'package:news/models/category_data_model.dart';
import 'package:news/modules/home_view_model.dart';
import 'package:provider/provider.dart';

class CategoryNews extends StatefulWidget {
  final CategoryDataModel categoryDataModel;

  const CategoryNews({super.key, required this.categoryDataModel});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  late final HomeViewModel homeViewModel;
  ArticleData? articleData;

  @override
  void initState() {
    super.initState();
    homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    Future.wait([
      homeViewModel.getAllSources(widget.categoryDataModel.id),
    ]).then((_) {
      homeViewModel.getAllArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (BuildContext context, viewModel, _) {
        return Column(
          children: [
            DefaultTabController(
              length: viewModel.sourcesList.length,
              child: TabBar(
                onTap: viewModel.selectedIndex,
                tabs: List.generate(viewModel.sourcesList.length, (index) {
                  return Text(viewModel.sourcesList[index].name);
                }),
                isScrollable: true,
                indicatorColor: Colors.black,
                dividerColor: Colors.transparent,
                labelPadding: EdgeInsets.symmetric(horizontal: 16),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                tabAlignment: TabAlignment.start,
              ),
            ),
            SizedBox.shrink(),

            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(16),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onLongPress: () {
                      viewModel.openUrl(viewModel.articlesList[index]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusGeometry.circular(16),
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Column(
                        spacing: 8,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(16),
                            child: Image.network(
                              viewModel.articlesList[index].urlToImage,
                            ),
                          ),
                          Text(
                            viewModel.articlesList[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                viewModel.articlesList[index].author.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                viewModel.articlesList[index].publishedAt,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 16);
                },
                itemCount: viewModel.articlesList.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
