import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_movies_app/components/cart_button.dart';
import 'package:provider_movies_app/provider/movie_provider.dart';
import 'package:provider_movies_app/pages/my_favorites.dart';
import '../utility/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("Movies Provider",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.indigo[100],
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CartButton(
              onTap: () {
                Utility.goToPage(context, const MyListView());
              },
              counter: context.watch<MovieProvider>().myList.length,
            ),
            const SizedBox(
              height: 20,
            ),
            //Expanded is important to add lv to a Column
            Expanded(
                child: ListView.builder(
                    primary: true, // scrollable : true
                    shrinkWrap: true,
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final currentMovie = movies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: ListTile(
                          trailing: IconButton(
                            iconSize: 30,
                            icon: Icon(
                              Icons.favorite,
                              color: myList.contains(currentMovie)
                                  //===THE UI===
                                  ? Colors.red
                                  : Colors.white,
                            ),
                            onPressed: () {
                              //===THE LOGIC===
                              if (!myList.contains(currentMovie)) {
                                context
                                    .read<MovieProvider>()
                                    .addToList(currentMovie);
                              } else {
                                context
                                    .read<MovieProvider>()
                                    .removeFromList(currentMovie);
                              }
                            },
                          ),
                          tileColor: Colors.white60,
                          leading: const Icon(
                            Icons.movie,
                            color: Colors.black,
                          ),
                          title: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movies[index].title,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "${movies[index].minutes.toString()} minutes",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                  ),
                                )
                              ],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: const BorderSide(color: Colors.indigo)),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
