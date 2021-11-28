import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tako/models/anime_model.dart';
import 'package:tako/services/anime_service.dart';
import 'package:tako/theme/tako_theme.dart';
import 'package:tako/util/constant.dart';

class VoiceActorScreen extends StatelessWidget {
  const VoiceActorScreen({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Actors'),
      ),
      body: FutureBuilder<Response<APICharactersResult>>(
          future: Provider.of<AnimeService>(context).getCharacterList(id),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            if (snapshot.connectionState == ConnectionState.done) {
              final characters = snapshot.data!.body!.characters;

              return ListView.builder(
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width * .4,
                            fit: BoxFit.cover,
                            // ignore: unnecessary_null_comparison
                            imageUrl: characters[index].voiceActors.isEmpty
                                ? 'https://cdn.myanimelist.net/r/42x62/images/questionmark_23.gif?s=f7dcbc4a4603d18356d3dfef8abd655c'
                                : characters[index].voiceActors[0].imageUrl,
                          ),
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  width: double.infinity,
                                  imageUrl: characters[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(.75),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  left: 10,
                                  child: Text(
                                    // ignore: unnecessary_null_comparison
                                    characters[index].voiceActors.isEmpty
                                        ? ''
                                        : characters[index].voiceActors[0].name,
                                    style: TakoTheme.darkTextTheme.headline4,
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: tkLightGreen.withAlpha(170),
                                      ),
                                      child: Text(
                                        characters[index].name,
                                        style:
                                            TakoTheme.darkTextTheme.headline2,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(),
                      ],
                    ),
                  );
                },
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
