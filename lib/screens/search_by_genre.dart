// import 'package:flutter/material.dart';

// class SearchByGenreScreen extends StatelessWidget {
//   const SearchByGenreScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final  size = MediaQuery.of(context).size;
//     const itemHeight = 100;
//     final itemWidth = size.width/2;
//     print(itemWidth/itemHeight);

//     print(genreList.length);
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: (itemWidth/itemHeight),
//         mainAxisSpacing: 5,
//         crossAxisSpacing: 5,
//       ),
//       itemCount: genreList.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Stack(
//           // alignment: Alignment.center,
//           // fit: StackFit.expand,
//           children: [
//             Container(
//               alignment: Alignment.center,
//               width: MediaQuery.of(context).size.width * .5,
//               height: 100,
//               child: Text(
//                 genreList[index].name,
//                 style: const TextStyle(color: Colors.red, fontSize: 16),
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width * .5,
//               height: 100,
//               decoration: BoxDecoration(color: Colors.blue.withOpacity(.5)),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
