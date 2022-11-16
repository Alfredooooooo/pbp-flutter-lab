import 'package:counter_7/models/budget.dart';
import 'package:counter_7/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'data_page.dart';
import 'home_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  bool _keteranganJam = false;
  int _nominal = 0;
  String? jenis;
  List<String> listJenis = ["Pemasukan", "Pengeluaran"];
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: const DrawerWidget(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: const Text(
                    "Judul",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  prefixIcon: const Icon(Icons.input_rounded),
                  prefixIconColor: Colors.black,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
                onChanged: (value) => {
                  setState(
                    () => {_judul = value},
                  )
                },
                onSaved: (newValue) => {
                  setState(
                    () => {
                      _judul = newValue!,
                    },
                  )
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Judul tidak boleh kosong!";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: const Text(
                    "Nominal",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  prefixIcon: const Icon(Icons.money_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) => {
                  setState(
                    () => {
                      _nominal = int.parse(value),
                    },
                  )
                },
                onSaved: (newValue) => {
                  setState(
                    () => {
                      _nominal = int.parse(newValue!),
                    },
                  )
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nominal tidak boleh kosong!";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                ),
                value: jenis,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                alignment: AlignmentDirectional.center,
                borderRadius: BorderRadius.circular(20),
                isExpanded: true,
                elevation: 16,
                hint: const Text(
                  "Pilih jenis budget",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                items: listJenis
                    .map<DropdownMenuItem<String>>((item) => DropdownMenuItem(
                        value: item,
                        child: RichText(
                          text: TextSpan(children: [
                            const WidgetSpan(child: Icon(Icons.price_change)),
                            const TextSpan(
                                text: " ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                )),
                            TextSpan(
                                text: item,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                )),
                          ]),
                        )))
                    .toList(),
                onChanged: (value) => {
                  setState(
                    () => {
                      jenis = value,
                    },
                  )
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Jenis tidak boleh kosong!";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate:
                                date.subtract(const Duration(days: 1000)),
                            lastDate: date.add(const Duration(days: 1000)))
                        .then((selectedDate) {
                      setState(() {
                        if (selectedDate != null) {
                          date = selectedDate;
                          _keteranganJam = true;
                        }
                      });
                    });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.all(18),
                    ),
                  ),
                  icon: const Icon(Icons.date_range),
                  label: _keteranganJam
                      ? Text(date.toString())
                      : const Text("Pilih Tanggal")),
            ],
          ),
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
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      listBudget.add(Budget(_judul, _nominal, jenis!, date));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DataPage()),
                      );
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Simpan',
                      style: TextStyle(fontSize: 15),
                    ),
                  )))),
    );
  }
}
