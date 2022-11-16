import 'package:counter_7/models/budget.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: listBudget
              .map<Column>((data) => Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(200),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Judul: ${data.judul!}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    )),
                                const SizedBox(height: 2),
                                Text("Tanggal: ${data.date.toString()}",
                                    style: const TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 2),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Nominal: ${data.nominal!.toString()}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    // data.tipe! == ?
                                    Text(
                                      data.tipe!,
                                      style: TextStyle(
                                          color: data.tipe == 'Pengeluaran'
                                              ? Colors.redAccent
                                              : Colors.lightGreen,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
