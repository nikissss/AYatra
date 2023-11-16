// import 'package:flutter/material.dart';
// import 'package:yatra1/utilis/Des-Model.dart';
// import 'package:yatra1/utilis/appinfo_list.dart';

// class Search extends StatefulWidget {
//   const Search({super.key});

//   @override
//   State<Search> createState() => SearchState();
// }

// class SearchState extends State<SearchBarTheme> {

//  List<DesModel> Destination = [];
//   @override
//   void initState(){
//     super.initState();
//     Destination=DestinationList;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// appBar: AppBar(
//   title: const Text('Search your Destination'),
// ),
// body:const Column(
//   children:[
//     Padding(
//       padding: EdgeInsets.all(20),
//       child:TextField(
//         decoration: const InputDecoration(
//           hintText: 'Search Your Destination',
//           border:OutlineInputBorder()
//         ),
//         onChanged: (query) {
//           final searchResult = DestinationList.where((element)=>{

//             final Destinationtitle = . element.title.toLowerCase();
//             final queryLowerCase = query.toLowerCase();

//             return Destinationtitle.contains(queryLowerCase);
//           });.toList();

//           Destination = searchResult;
//           setState(() {});
//         },
//         ),
//       ),
// Expanded(
//   child: ListView.builder(
//     itemCount: Destination.length,
//     itemBuilder:(context,index)
//     {
//       return Padding(
//         padding: const EdgeInsets.all(8),
//         child:Row(
//           children:[
//             Container(
//             height:100,
//             width:150,
//             decoration:BoxDecoration(
//               image:DecorationImage(image: NetworkImage(Destination[index].image),
//               fit:BoxFit.cover,
//               ),
//             ),
//             ),
//             Padding(padding: const EdgeInsets.all(15),
//             child:Text(
// Destination[index].title,
// style:const TextStyle(
//   fontSize: 18,
//   fontWeight: FontWeight.w500,
// ),
//             ),
//             ),
//           ],
//         ),
//       );
//     },
//     ),
// )
//   ]
// )
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:yatra1/utilis/Des-Model.dart';
import 'package:yatra1/utilis/appinfo_list.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {
  List<DesModel> destinations = [];

  @override
  void initState() {
    super.initState();
    destinations = DestinationList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search your Destination'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: const InputDecoration(
                  hintText: 'Search Your Destination', border: OutlineInputBorder()),
              onChanged: (query) {
                final searchResult = DestinationList.where((element) {
                  final destinationTitle = element.title.toLowerCase();
                  final queryLowerCase = query.toLowerCase();
                  return destinationTitle.contains(queryLowerCase);
                }).toList();

                setState(() {
                  destinations = searchResult;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: destinations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(destinations[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          destinations[index].title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
