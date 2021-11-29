import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tako/screens/anime_detail_screen.dart';
import 'package:tako/theme/tako_theme.dart';
import 'package:tako/util/hero_page_route.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.itemWidth,
    required this.itemHeight,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final int id;
  final double itemWidth;
  final int itemHeight;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroPageRoute(
            builder: (context) => AnimeDetailScreen(
              id: id,
              imageUrl: imageUrl,
            ),
          ));
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                fit: BoxFit.cover,
                width: itemWidth,
                imageUrl: imageUrl,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: itemHeight * .25,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              title,
                              style: TakoTheme.darkTextTheme.headline3,
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
  }
}
