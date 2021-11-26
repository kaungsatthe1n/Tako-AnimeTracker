import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:tako/models/anime_model.dart';
import 'package:tako/screens/youtubeview_screen.dart';
import 'package:tako/services/anime_service.dart';
import 'package:tako/theme/tako_theme.dart';
import 'package:tako/util/constant.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
      ),
      body: FutureBuilder<Response<APIVideoResult>>(
        future: AnimeService.create().getPromoVideo(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final videos = snapshot.data!.body!.promo;
            return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 40,
                  );
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  height: 180,
                                  imageUrl: videos[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  YouTubeViewScreen(
                                                      url: videos[index]
                                                          .videoUrl)));
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.black38,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    bottom: 0,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    YouTubeViewScreen(
                                                        url: videos[index]
                                                            .videoUrl)));
                                      },
                                      child: const Icon(
                                        Icons.play_circle,
                                        size: 50,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: tkLightGreen.withOpacity(.8),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              )),
                          alignment: Alignment.center,
                          height: 50,
                          child: Text(
                            videos[index].title,
                            style: TakoTheme.darkTextTheme.headline2,
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
