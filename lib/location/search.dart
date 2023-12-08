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
import 'package:intl/intl.dart';


// class Search extends StatefulWidget {
//  const Search({Key? key, required TextEditingController controller}) : super(key: key);


//   @override
//   State<Search> createState() => SearchState();
// }

// class SearchState extends State<Search> {
//   TextEditingController _datecontroller = TextEditingController();
//   List<DesModel> destinations = [];

//   @override
//   void initState() {
//     super.initState();
//     destinations = DestinationList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search your Destination'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: TextField(
//   controller: _datecontroller,
//   decoration: const InputDecoration(
//     labelText: 'Date',
//     filled: true,
//     prefixIcon: Icon(Icons.calendar_today),
//     enabledBorder: OutlineInputBorder(
//       borderSide: BorderSide.none,
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: Colors.blue),
//     ),
//     hintText: 'Search Your Destination',
//     border: OutlineInputBorder(),
//   ),
//   onTap: () {
//     _selectDate();
//   },
//                   // hintText: 'Search Your Destination', border: OutlineInputBorder()),
//               onChanged: (query) {
//                 final searchResult = DestinationList.where((element) {
//                   final destinationTitle = element.title.toLowerCase();
//                   final queryLowerCase = query.toLowerCase();
//                   return destinationTitle.contains(queryLowerCase);
//                 }).toList();

//                 setState(() {
//                   destinations = searchResult;
//                 });
//               },
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: destinations.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 100,
//                         width: 200, //aagadi 150 thiyo
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(destinations[index].image),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15),
//                         child: Text(
//                           destinations[index].title,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> _selectDate() async{
//     DateTime? _picked = await  showDatePicker(
//       context: context,
//        initialDate: DateTime.now(),
//         firstDate: DateTime(2000), 
//         lastDate: DateTime(2100)
//         );

// if(_picked !=null){
//   setState(() {
//     _datecontroller.text = _picked.toString().split('')[0];
//   });
// }

//   }
// }


class Search extends StatefulWidget {
  const Search({Key? key, required TextEditingController searchController, required TextEditingController dateController, required TextEditingController controller})
      : _searchController = searchController,
        _dateController = dateController,
        super(key: key);

  final TextEditingController _searchController;
  final TextEditingController _dateController;

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
      // padding: EdgeInsets.symmetric(vertical:5),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
  controller: widget._searchController,
  decoration: const InputDecoration(
    labelText: 'Search',
    filled: true,
    prefixIcon: Icon(Icons.search),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    hintText: 'Search Your Destination',
    border: OutlineInputBorder(),
  ),
  onChanged: (query) {
    final searchResult = DestinationList.where((element) {
      final destinationTitle = element.title.toLowerCase();
      final queryLowerCase = query.toLowerCase();

      // Check if the title contains the search query
      // Add additional conditions here if needed
      return destinationTitle.contains(queryLowerCase);
    }).toList();

    setState(() {
      destinations = searchResult;
    });
  },
),

          ),
            const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: widget._dateController,
              decoration: const InputDecoration(
                labelText: 'Date',
                filled: true,
                prefixIcon: Icon(Icons.calendar_today),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                hintText: 'Select Date',
                border: OutlineInputBorder(),
              ),
              onTap: () {
                _selectDate();
              },
            ),
          ),
          Expanded(
            child:
            // ListView.builder(
            //   itemCount: destinations.length,
            //   itemBuilder: (context, index) {
            //     return Padding(
            //       padding: const EdgeInsets.all(8),
            //       child: Row(
            //         children: [
            //           Container(
            //             height: 100,
            //             width: 200,
            //             decoration: BoxDecoration(
            //               image: DecorationImage(
            //                 image: NetworkImage(destinations[index].image),
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(15),
            //             child: Text(
            //               destinations[index].title,
            //               style: const TextStyle(
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
            ListView.separated(
  itemCount: destinations.length,
  separatorBuilder: (context, index) => SizedBox(height: 8),
  itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
              image: destinations[index].image.isNotEmpty
                  ? DecorationImage(
          image: AssetImage(destinations[index].image),
          fit: BoxFit.cover,
        )
                  : null, // No image if the path is empty
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child:Container(
              width:120,
              child: Text(
                destinations[index].title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                          textAlign: TextAlign.center,
              ),
            ),
          ),
// Padding(
//  padding: EdgeInsetsDirectional.only(start: 24, end: 24, top: 8),
//   child:Row(
//     children: [
//       Expanded(child: Text(
//         AppLocalizations(context).of("Last_search"),
//         style:TextStyle(
//           fontWeight: FontWeight.w600,
//           fontSize: 16,
//           letterSpacing: 0.5,
//         ),
//       ),
//         ),
//         Material(
//           color:Colors.transparent,
//           child:InkWell(
//             borderRadius: BorderRadius.all(Radius.circular(4.0)),
//             onTap:(){
//               setState(() {
//                 myController.text = '';
//               });
//               child:Padding(
//                 padding: EdgeInsets.all(8),
//                 child:Row(
//                   children: [
//                     Text(
//                       AppLocalizations(context).of('clear_all'),
//                       textAlign: TextAlign.left,
//                       style:TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14,
//                         color:Theme.of(context).primaryColor,
//                       ),
//                     )
//                   ],
//                 )
//                 );
//             }
//           )
//         )
        
//     ],))
        ],
      ),
    );
  },
)


          )
        ],
      ),
    );
  }

Future<void> _selectDate() async {
  DateTime? _picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (_picked != null) {
    // Format the date using intl package
    String formattedDate = DateFormat('yyyy-MM-dd').format(_picked);

    setState(() {
      widget._dateController.text = formattedDate;
    });
  }
}

  // AppLocalizations(BuildContext context) {}

}
