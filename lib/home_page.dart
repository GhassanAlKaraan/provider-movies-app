import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_movies_app/cart_button.dart';
import 'package:provider_movies_app/movie_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;

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
          children: [
            CartButton(
              onTap: () {
                //todo: add button function.
              },
              counter: 0, //todo: add button variable
            ),
            const SizedBox(
              height: 20,
            ),
            //Expanded is important to add lv to a Column
            Expanded(
                child: ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        tileColor: Colors.white60,
                          leading: const Icon(Icons.list),
                          trailing: const Text(
                            "ICON",
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ),
                          title: Text(movies[index].title));
                    })


                // child: MyListView(), //todo: add provider list

            ),
          ],
        ),
      ),
    );
  }
}
