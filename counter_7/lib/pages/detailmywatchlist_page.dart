import 'package:counter_7/models/mywatchlist.dart';
import 'package:counter_7/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class DetailMyWatchListPage extends StatelessWidget {
  final MyWatchList currentMovie;

  const DetailMyWatchListPage(
      {Key? key,
      required this.currentMovie}) // Key? berarti bisa nullable, this.mywatchlist has to be given tho
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Detail")),
        drawer: const DrawerWidget(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView(
            children: [
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    const WidgetSpan(
                        child: Icon(
                      Icons.movie,
                      size: 20,
                    )),
                    const TextSpan(
                      text: "  ",
                    ),
                    TextSpan(
                      text: currentMovie.fields?.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Release Date: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "${currentMovie.fields?.releaseDate}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Rating: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "${currentMovie.fields?.rating}/10",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Status: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        currentMovie.fields?.watched != null &&
                                currentMovie.fields?.watched == true
                            ? "Watched"
                            : "Not yet watched",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Review: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    "${currentMovie.fields?.review}",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomSheet: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SizedBox(
                width: double.maxFinite,
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrangeAccent),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        'Back',
                        style: TextStyle(fontSize: 15),
                      ),
                    )))));
  }
}
