import 'dart:ui';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tako/components/anime_card.dart';
import 'package:tako/models/anime_model.dart';
import 'package:tako/services/anime_service.dart';
import 'package:tako/theme/tako_theme.dart';
import 'package:tako/util/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  int defaultPage = 1;
  bool categoryChanged = false;
  int selectedCategory = 1;

  @override
  Widget build(BuildContext context) {
    final animeService = Provider.of<AnimeService>(context);
    const itemHeight = 300;
    final itemWidth = 100.w / 2;
    return FutureBuilder<Response<APISeasonResult>>(
        future: selectedCategory == 1
            ? animeService.getCurrentSeasonList(
                categoryChanged ? defaultPage : currentPage)
            : animeService
                .getUpComingList(categoryChanged ? defaultPage : currentPage),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.statusCode == 404) {
              return NoMoreResult(onTap: () {
                setState(() {
                  --currentPage;
                });
              });
            }

            final list = snapshot.data!.body!.top;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular',
                        style: TakoTheme.darkTextTheme.headline1,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            dropdownColor: tkDarkBlue,
                            value: selectedCategory,
                            onChanged: (int? newCategory) {
                              setState(() {
                                selectedCategory = newCategory!;
                                categoryChanged = true;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                child: Text(
                                  'Trending',
                                  style: TakoTheme.darkTextTheme.headline3!
                                      .copyWith(color: Colors.grey),
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text(
                                  'Upcoming',
                                  style: TakoTheme.darkTextTheme.headline3!
                                      .copyWith(color: Colors.grey),
                                ),
                                value: 2,
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimeCard(
                          id: list[index].id,
                          imageUrl: list[index].imageUrl,
                          title: list[index].title,
                          itemWidth: itemWidth,
                          itemHeight: itemHeight);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (currentPage == 1) {
                              currentPage = 1;
                            } else {
                              currentPage--;
                            }

                            categoryChanged = false;
                          });
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_left_outlined,
                          size: 25,
                          color: tkLightGreen,
                        )),
                    const SizedBox(
                      width: 80,
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            currentPage++;
                            categoryChanged = false;
                          });
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 25,
                          color: tkLightGreen,
                        )),
                  ],
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  void goPrevPage(int index) {
    if (index <= 0) {
      index = 1;
      setState(() {
        currentPage = index;
      });
    }
  }
}

class NoMoreResult extends StatelessWidget {
  const NoMoreResult({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no-results.png',
            fit: BoxFit.cover,
            width: 200,
            height: 200,
          ),
          Text(
            'No More Result ',
            style: TakoTheme.darkTextTheme.subtitle2,
          ),
          SizedBox(
            height: 15.h,
          ),
          MaterialButton(
            onPressed: onTap,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: tkLightGreen,
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
