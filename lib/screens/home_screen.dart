import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:tako/models/anime_model.dart';
import 'package:tako/screens/anime_detail_screen.dart';
import 'package:tako/services/anime_service.dart';
import 'package:tako/theme/tako_theme.dart';
import 'package:tako/util/constant.dart';
import 'package:tako/util/hero_page_route.dart';

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
    final size = MediaQuery.of(context).size;
    const itemHeight = 300;
    final itemWidth = size.width / 2;
    return FutureBuilder<Response<APISeasonResult>>(
        future: selectedCategory == 1
            ? AnimeService.create().getCurrentSeasonList(
                categoryChanged ? defaultPage : currentPage)
            : AnimeService.create()
                .getUpComingList(categoryChanged ? defaultPage : currentPage),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.statusCode == 404) {
              return Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/not_found.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        --currentPage;
                      });
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Go Back',
                        style: TakoTheme.lightTextTheme.headline6,
                      ),
                    ),
                  )
                ],
              );
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
                      return Hero(
                        tag: list[index].id,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(HeroPageRoute(
                              builder: (context) => Hero(
                                tag: list[index].id,
                                child: AnimeDetailScreen(
                                  id: list[index].id,
                                  imageUrl: list[index].imageUrl,
                                ),
                              ),
                            ));
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: itemWidth,
                                  imageUrl: list[index].imageUrl,
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.zero,
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10, sigmaY: 10),
                                      child: Container(
                                        height: itemHeight * .25,
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Text(
                                                list[index].title,
                                                style: TakoTheme
                                                    .darkTextTheme.headline3,
                                                overflow: TextOverflow.fade,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            currentPage--;
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
}
