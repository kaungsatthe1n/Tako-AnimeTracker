import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:tako/models/anime_model.dart';
import 'package:tako/screens/anime_detail_screen.dart';
import 'package:tako/services/anime_service.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  bool hasValue = false;
  String value = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  _controller.clear();
                  setState(() {
                    hasValue = false;
                  });
                },
              ),
              hintText: 'Search...',
              border: InputBorder.none),
          onSubmitted: (val) {
            setState(() {
              hasValue = true;
            });
            value = val;
          },
        ),
      ),
      body: hasValue
          ? FutureBuilder<Response<APIAnimeResult>>(
              future: AnimeService.create().queryAnime(value),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      // padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: snapshot.data!.body!.results.length,
                      itemBuilder: (context, index) {
                        final body = snapshot.data!.body;
                        final anime = body!.results[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AnimeDetailScreen(
                                    id: anime.id, imageUrl: anime.imageUrl)));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: CachedNetworkImage(
                                        imageUrl: anime.imageUrl,
                                        fit: BoxFit.cover,
                                        width: 150,
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Text(
                                              anime.title,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              anime.rated,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              anime.episodes.toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade900,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })
          : Container(),
    );
  }
}
