import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tako/models/anime_model.dart';
import 'package:tako/screens/anime_detail_screen.dart';
import 'package:tako/services/anime_service.dart';
import 'package:tako/theme/tako_theme.dart';
import 'package:tako/util/constant.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  bool hasValue = false;
  String value = '';
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          key: _formKey,
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
          ? FutureBuilder<Response<APIAnimeQueryResult>>(
              future: Provider.of<AnimeService>(context).queryAnime(value),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Search :  ',
                              style: TakoTheme.darkTextTheme.headline1,
                            ),
                            TextSpan(
                              text: value,
                              style: TakoTheme.darkTextTheme.headline4,
                            ),
                          ]),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            // padding: const EdgeInsets.symmetric(vertical: 10),
                            itemCount: snapshot.data!.body!.results.length,
                            itemBuilder: (context, index) {
                              final body = snapshot.data!.body;
                              final anime = body!.results[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => AnimeDetailScreen(
                                          id: anime.id,
                                          imageUrl: anime.imageUrl)));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.7),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                    gradient: const LinearGradient(
                                        colors: [
                                          tkDarkGreen,
                                          tkDarkBlue,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CachedNetworkImage(
                                              imageUrl: anime.imageUrl,
                                              fit: BoxFit.cover,
                                              width: 100,
                                              height: 150,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    anime.title,
                                                    style: TakoTheme
                                                        .darkTextTheme
                                                        .headline2,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        color: tkLightGreen,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Rating : ${anime.score.toString()}',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
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
