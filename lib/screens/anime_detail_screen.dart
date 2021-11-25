import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tako/models/anime_model.dart';
import 'package:tako/provider/navmanager.dart';
import 'package:tako/screens/video_list_screen.dart';
import 'package:tako/screens/voice_actor_screen.dart';
import 'package:tako/services/anime_service.dart';
import 'package:tako/theme/tako_theme.dart';
import 'package:tako/util/constant.dart';

class AnimeDetailScreen extends StatefulWidget {
  const AnimeDetailScreen({
    Key? key,
    required this.id,
    required this.imageUrl,
  }) : super(key: key);
  final int id;
  final String imageUrl;

  @override
  State<AnimeDetailScreen> createState() => _AnimeDetailScreenState();
}

class _AnimeDetailScreenState extends State<AnimeDetailScreen> {
  late final ScrollController _scrollController = ScrollController();

  void _goToElement(int index) {
    _scrollController.animateTo((100.0 * index),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCirc);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<NavManager>(context, listen: false).goToNav(0);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Anime Detail'),
        ),
        body: FutureBuilder<Response<Anime>>(
            future: AnimeService.create().getAnimeById(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                final anime = snapshot.data!.body!;

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      child: CachedNetworkImage(
                        imageUrl: widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 8,
                        sigmaY: 8,
                      ),
                      child: Container(
                        color: Colors.black87,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 30,
                      right: 30,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            anime.title,
                            style: TakoTheme.darkTextTheme.headline1,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconBox(
                                title: 'Rating',
                                iconData: Icons.star,
                                value: anime.score.toString(),
                              ),
                              IconBox(
                                title: 'Rank',
                                iconData: FontAwesomeIcons.trophy,
                                value: anime.rank.toString(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconBox(
                                title: 'Duration',
                                iconData: Icons.access_time_filled_sharp,
                                value: anime.duration,
                              ),
                              IconBox(
                                title: 'Episodes',
                                iconData: FontAwesomeIcons.film,
                                value: anime.episodes.toString(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Wrap(
                            spacing: 10,
                            children: anime.genres
                                .map((genre) => Chip(
                                      label: Text(genre.name),
                                      // backgroundColor: tkDarkGreen,
                                    ))
                                .toList(),
                          ),
                          const Divider(),
                          Consumer<NavManager>(
                            builder: (BuildContext context, navManager,
                                Widget? child) {
                              return SizedBox(
                                height: 40,
                                child: ListView(
                                  controller: _scrollController,
                                  restorationId: 'more',
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    NavItem(
                                      index: 0,
                                      onTap: () {
                                        navManager.goToNav(0);
                                        _goToElement(0);
                                      },
                                      name: 'Synopsis',
                                      selectedIndex: navManager.selectedIndex,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    NavItem(
                                      index: 1,
                                      onTap: () {
                                        navManager.goToNav(1);
                                        _goToElement(1);
                                      },
                                      name: 'Premiered',
                                      selectedIndex: navManager.selectedIndex,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    NavItem(
                                      index: 2,
                                      onTap: () {
                                        navManager.goToNav(2);
                                        _goToElement(2);
                                      },
                                      name: 'Studio',
                                      selectedIndex: navManager.selectedIndex,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    NavItem(
                                      index: 3,
                                      onTap: () {
                                        navManager.goToNav(3);
                                        _goToElement(3);
                                      },
                                      name: 'Theme Songs',
                                      selectedIndex: navManager.selectedIndex,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    NavItem(
                                      index: 4,
                                      onTap: () {
                                        navManager.goToNav(4);
                                        _goToElement(4);
                                      },
                                      name: 'More',
                                      selectedIndex: navManager.selectedIndex,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Consumer<NavManager>(
                              builder: (context, navManager, child) {
                                if (navManager.selectedIndex == 0) {
                                  return SingleChildScrollView(
                                    child: Text(
                                      anime.synopsis,
                                    ),
                                  );
                                } else if (navManager.selectedIndex == 1) {
                                  return Text(anime.toString());
                                } else if (navManager.selectedIndex == 2) {
                                  return ListView.builder(
                                      itemCount: anime.studios.length,
                                      itemBuilder: (context, index) {
                                        return Text(anime.studios[index].name);
                                      });
                                } else if (navManager.selectedIndex == 3) {
                                  return ListView.builder(
                                      itemCount: getThemeSongs(anime).length,
                                      itemBuilder: (context, index) {
                                        return Text(
                                            getThemeSongs(anime)[index]);
                                      });
                                } else if (navManager.selectedIndex == 4) {
                                  return ListView(
                                    children: [
                                      BrowseItem(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VoiceActorScreen(
                                                        id: anime.id,
                                                      )));
                                        },
                                        title: 'Voice Actors',
                                        iconData:
                                            FontAwesomeIcons.microphoneAlt,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      BrowseItem(
                                        onTap: () {},
                                        title: 'Pictures',
                                        iconData: FontAwesomeIcons.image,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      BrowseItem(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      VideoListScreen(
                                                        id: anime.id,
                                                      )));
                                        },
                                        title: 'Videos',
                                        iconData: FontAwesomeIcons.video,
                                      ),
                                    ],
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 8,
                        sigmaY: 8,
                      ),
                      child: Container(
                        color: Colors.black87,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    required this.onTap,
    required this.name,
    required this.index,
    required this.selectedIndex,
    Key? key,
  }) : super(key: key);

  final Function()? onTap;
  final int selectedIndex;
  final int index;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: selectedIndex == index ? tkDarkGreen : Colors.transparent,
          width: 4,
        ))),
        duration: const Duration(milliseconds: 300),
        child: Text(
          name,
          style: TakoTheme.darkTextTheme.headline6,
        ),
      ),
    );
  }
}

class BrowseItem extends StatelessWidget {
  const BrowseItem({
    required this.onTap,
    required this.title,
    required this.iconData,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shadowColor: Colors.black54,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        splashColor: tkDarkGreen,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(iconData),
              const SizedBox(
                width: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> getThemeSongs(Anime anime) {
  List<String> totalResult = [];
  if (anime.openingThemes.isNotEmpty) {
    totalResult.add('Opening Theme');
    totalResult.add('');
    for (var val in anime.openingThemes) {
      totalResult.add(val);
    }
    totalResult.add('');
  }
  if (anime.endingThemes.isNotEmpty) {
    totalResult.add('Ending Theme');
    totalResult.add('');
    for (var val in anime.endingThemes) {
      totalResult.add(val);
    }
  }

  return totalResult;
}

class IconBox extends StatelessWidget {
  const IconBox({
    Key? key,
    required this.iconData,
    required this.title,
    required this.value,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            title,
            style: TakoTheme.darkTextTheme.headline6,
          ),
          const SizedBox(
            height: 5,
          ),
          Icon(
            iconData,
            semanticLabel: 'Score',
            color: tkLightGreen,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
