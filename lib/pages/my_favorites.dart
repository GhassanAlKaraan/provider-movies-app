import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_movies_app/provider/movie_provider.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text("Favorites",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.indigo[100],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final currentFavMovie = favorites[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ListTile(
                  trailing: GestureDetector(
                    onTap: (){
                      context
                          .read<MovieProvider>()
                          .removeFromList(currentFavMovie);
                    },
                    child: const Text(
                      "REMOVE",
                      style: TextStyle(color: Colors.red),
                    ),
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
                          favorites[index].title,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${favorites[index].minutes.toString()} minutes",
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
            }),
      ),
    );
  }
}
