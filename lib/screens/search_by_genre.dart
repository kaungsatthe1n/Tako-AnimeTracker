import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tako/components/anime_card.dart';
import 'package:tako/models/anime_model.dart';
import 'package:tako/models/genre.dart';
import 'package:tako/services/anime_service.dart';
import 'package:tako/theme/tako_theme.dart';
import 'package:tako/util/constant.dart';

class SearchByGenreScreen extends StatefulWidget {
  const SearchByGenreScreen({Key? key, required this.choices})
      : super(key: key);
  final List<Genre> choices;
  @override
  State<SearchByGenreScreen> createState() => _SearchByGenreScreenState();
}

class _SearchByGenreScreenState extends State<SearchByGenreScreen> {
  List<int> getGenreIds() {
    return widget.choices.map((e) => e.id).toList();
  }

  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    const itemHeight = 300;
    final itemWidth = 100.w / 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        centerTitle: true,
      ),
      body: FutureBuilder<Response<APIAnimeQueryResult>>(
          future: Provider.of<AnimeService>(context)
              .getAnimeListByGenres(currentPage, getGenreIds()),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              final list = snapshot.data!.body!.results;
              return Column(
                children: [
                  Wrap(
                    spacing: 15,
                    children: widget.choices
                        .map((genre) => Chip(
                              label: Text(
                                genre.name,
                                style: TakoTheme.darkTextTheme.subtitle1,
                              ),
                            ))
                        .toList(),
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
                      itemCount: list!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimeCard(
                          itemWidth: itemWidth,
                          itemHeight: itemHeight,
                          id: list[index].id!,
                          imageUrl: list[index].imageUrl!,
                          title: list[index].title!,
                        );
                      },
                    ),
                  ),
                  Container(
                    color: tkDarkBlue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Prev',
                          style: TakoTheme.darkTextTheme.subtitle1,
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (currentPage == 1) {
                                  currentPage = 1;
                                } else {
                                  currentPage--;
                                }
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
                              });
                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_right_outlined,
                              size: 25,
                              color: tkLightGreen,
                            )),
                        Text(
                          'Next',
                          style: TakoTheme.darkTextTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
