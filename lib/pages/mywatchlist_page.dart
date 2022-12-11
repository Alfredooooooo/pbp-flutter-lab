import 'package:counter_7/models/mywatchlist.dart';
import 'package:counter_7/pages/detailmywatchlist_page.dart';
import 'package:counter_7/services/fetch_watch_list.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/widgets/drawer_widget.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({super.key});

  @override
  State<MyWatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
  List<MyWatchList> listWatchlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: const DrawerWidget(),
        body: FutureBuilder(
            future: fetchWatchlist(),
            builder: ((context, snapshot) {
              // return Container(
              //   child: Text("HAHA"),
              // );
              if (snapshot.data != null) {
                if (snapshot.hasData) {
                  if (listWatchlist.isEmpty) {
                    listWatchlist = snapshot.data!;
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        listWatchlist[index].fields?.watched !=
                                                    null &&
                                                listWatchlist[index]
                                                        .fields
                                                        ?.watched ==
                                                    true
                                            ? Colors.green
                                            : Colors.red,
                                    blurRadius: 2.5)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "${listWatchlist[index].fields?.title}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailMyWatchListPage(
                                                    currentMovie:
                                                        listWatchlist[index])),
                                      );
                                    },
                                    style: ButtonStyle(overlayColor:
                                        MaterialStateProperty.resolveWith<
                                            Color?>((states) {
                                      if (states
                                          .contains(MaterialState.hovered)) {
                                        return listWatchlist[index]
                                                        .fields
                                                        ?.watched !=
                                                    null &&
                                                listWatchlist[index]
                                                        .fields
                                                        ?.watched ==
                                                    true
                                            ? Colors.green
                                            : Colors.red;
                                      }
                                      return null;
                                    }), foregroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) {
                                      if (states
                                          .contains(MaterialState.hovered)) {
                                        return Colors.white;
                                      }
                                      return listWatchlist[index]
                                                      .fields
                                                      ?.watched !=
                                                  null &&
                                              listWatchlist[index]
                                                      .fields
                                                      ?.watched ==
                                                  true
                                          ? Colors.green
                                          : Colors.red;
                                    })),
                                    child: const Text(
                                      "See Detail!",
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor: MaterialStateProperty.all(
                                        listWatchlist[index].fields?.watched !=
                                                    null &&
                                                listWatchlist[index]
                                                        .fields
                                                        ?.watched ==
                                                    true
                                            ? Colors.green
                                            : Colors.red),
                                    value: listWatchlist[index].fields?.watched,
                                    shape: const CircleBorder(),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        listWatchlist[index].fields?.watched =
                                            value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return Column(
                    children: [
                      RichText(
                          text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Did not found any ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.movie,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )),
                    ],
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })));
  }
}
