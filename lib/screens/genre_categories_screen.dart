import 'package:flutter/material.dart';
import 'package:tako/models/genre.dart';
import 'package:tako/screens/search_by_genre.dart';
import 'package:tako/theme/tako_theme.dart';
import 'package:tako/util/constant.dart';

class GenreCategoriesScreen extends StatefulWidget {
  const GenreCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<GenreCategoriesScreen> createState() => _GenreCategoriesScreenState();
}

class _GenreCategoriesScreenState extends State<GenreCategoriesScreen> {
  bool selected = false;
  bool searchFieldTapped = false;
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<Genre> newList = genreList;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<Genre> getSelectedItems() {
    return genreList.where((genre) => genre.selected).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: searchFieldTapped ? tkLightGreen : tkwhite.withOpacity(.5),
            ),
          ),
          child: TextField(
            key: _formKey,
            onTap: () {
              setState(() {
                searchFieldTapped = true;
              });
            },
            onChanged: (val) {
              setState(() {
                newList = genreList
                    .where((genre) =>
                        genre.name.toLowerCase().contains(val.toLowerCase()))
                    .toList();
              });
            },
            controller: _controller,
            cursorColor: tkLightGreen,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _controller.clear();
                    newList = genreList;
                    FocusScope.of(context).unfocus();
                  });
                },
              ),
              hintText: 'Search Genre',
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              itemCount: newList.length,
              itemBuilder: (context, index) {
                return GenreItem(
                  onChanged: (val) {
                    setState(() {
                      newList[index].selected = val!;
                    });
                  },
                  genre: newList[index],
                );
              }),
        ),
        GestureDetector(
          onTap: () {
            getSelectedItems();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchByGenreScreen(
                      choices: getSelectedItems(),
                    )));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            height: 50,
            child: Text(
              'Submit',
              style: TakoTheme.darkTextTheme.headline2,
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
              color: tkLightGreen,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ],
    );
  }
}

class GenreItem extends StatelessWidget {
  const GenreItem({Key? key, required this.onChanged, required this.genre})
      : super(key: key);
  final Function(bool?)? onChanged;
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1.2,
          child: Checkbox(
            onChanged: onChanged,
            value: genre.selected,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          genre.name,
          style: TakoTheme.darkTextTheme.headline6!.copyWith(
            color: genre.selected
                ? tkLightGreen.withAlpha(200)
                : Colors.white.withAlpha(200),
          ),
        ),
      ],
    );
  }
}
