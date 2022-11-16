import 'package:counter_7/pages/data_page.dart';
import 'package:flutter/material.dart';

import '../pages/form_page.dart';
import '../pages/home_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Menambahkan clickable menu
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('counter_7'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Tambah Budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FormPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.show_chart),
            title: const Text('Data Budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DataPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
