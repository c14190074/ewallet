import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class Cart {
  String id;
  final String nama;
  final int noTelp, jumData;

  Cart({
    this.id = "",
    required this.nama,
    required this.jumData,
    required this.noTelp,
  });

  Map<String, dynamic> toJson() =>
      {'id': id, 'nama': nama, 'jumData': jumData, 'noTelp': noTelp};
}


class _CategoryListState extends State<CategoryList> {
  String nama = "";
  final TextEditingController _namaController = TextEditingController();

  // String? nama;
  int? noTelp;
  int? jumData;

  List<Cart> data = [
    Cart(
      nama: 'test 1',
      jumData: 0,
      noTelp: 031123,
    ),
    Cart(
      nama: 'test 2',
      jumData: 0,
      noTelp: 031123,
    ),
    Cart(
      nama: 'test 3',
      jumData: 0,
      noTelp: 031123,
    ),
    Cart(
      nama: 'test 4',
      jumData: 0,
      noTelp: 031123,
    ),
    Cart(
      nama: 'test 5',
      jumData: 0,
      noTelp: 031123,
    ),
    Cart(
      nama: 'test 6',
      jumData: 0,
      noTelp: 031123,
    ),
    Cart(
      nama: 'test 7',
      jumData: 0,
      noTelp: 031123,
    ),
    Cart(
      nama: 'test 8',
      jumData: 0,
      noTelp: 031123,
    ),
  ];

  // delData() async {
  //   for (var element in data) {}
  // }

  // addData() async {
  //   for (var element in data) {
  //     FirebaseFirestore.instance.collection('Kategori').add(element);
  //   }
  //   print('New Category Added!');
  // }

  void iniState() {
    super.initState();
    // addData();
    // delData();
  }

  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //search by Category Name
    List<Cart> searchlist = data
        .where((element) =>
            element.nama.toLowerCase().contains(nama.toLowerCase()))
        .toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Container(),
          title: Text("Category"),
          bottom: PreferredSize(
            preferredSize: Size(3, 130),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      controller: _namaController,
                      onFieldSubmitted: (covariant) {
                        setState(() {
                          nama = covariant;
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText: "Search ...",
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: double.infinity,
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 3),
                    child: Text(
                      "Search for $nama",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Kategori').snapshots(),
          builder: (context, snapshots) {
            return (snapshots.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshots.data!.docs.length,
                    itemBuilder: (context, index) {
                      var data = snapshots.data!.docs[index].data()
                          as Map<String, dynamic>;

                      if (nama.isEmpty) {
                        return Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 25),
                              height: 61,
                              child: Row(children: <Widget>[
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                          data['nama'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              setState(
                                                () {
                                                  final docUser =
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              "Kategori")
                                                          .doc(nama)
                                                          .delete();
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              size: 20,
                                              // color: Colors.red,
                                            ),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              setState(
                                                () {
                                                  final docUser =
                                                      FirebaseFirestore.instance
                                                          .collection(
                                                              "Kategori")
                                                          .doc(nama)
                                                          .delete();
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            Divider(
                              thickness: 2,
                            )
                          ],
                        );
                      }
                      if (data['nama']
                          .toString()
                          .toLowerCase()
                          .startsWith(nama.toLowerCase())) {
                        return Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 16),
                              height: 100,
                              child: Row(children: <Widget>[
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['nama'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.blue[200],
                                        ),
                                      ),
                                      MaterialButton(
                                          onPressed: () {
                                            setState(() {
                                              // delData();
                                            });
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            Divider(
                              thickness: 2,
                            )
                          ],
                        );
                      }

                      return Container(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: TextFormField(
                                      controller: _namaController,
                                      onFieldSubmitted: (covariant) {
                                        setState(() {
                                          nama = covariant;
                                        });
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.list,
                                        ),
                                        hintText: "Add New Categories",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
          },
        ),
      ),
    );
  }
}
