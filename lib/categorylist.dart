import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CategoryList extends StatefulWidget {
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
  final TextEditingController _jumDataController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();

  final CollectionReference _kategori =
      FirebaseFirestore.instance.collection('Kategori');

  String? noTelp;
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

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
                // TextField(
                //   keyboardType:
                //   const TextInputType.numberWithOptions(decimal: true),
                //   controller: _jumDataController,
                //   decoration: const InputDecoration(
                //     labelText: 'Jumlah Data',
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    final String nama = _namaController.text;
                    // final int? jumData = _jumDataController.text;
                    if (nama != null) {
                      await _kategori.add({
                        "nama": nama,
                        // "jumData": jumData
                      });

                      _namaController.text = '';
                      // _jumDataController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  // _CategoryListState(this.CartList);
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _namaController.text = documentSnapshot['nama'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String nama = _namaController.text;
                    if (nama != null) {
                      await _kategori
                          .doc(documentSnapshot!.id)
                          .update({"nama": nama});
                      _namaController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String kategoriId) async {
    await _kategori.doc(kategoriId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a category')));
  }

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
          body: StreamBuilder(
            stream: _kategori.snapshots(), // connect to fire
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return (snapshot.connectionState == ConnectionState.waiting)
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        var data = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;

                        if (nama.isEmpty) {
                          return Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 25),
                                height: 73,
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
                                            // Press this button to edit a single product
                                            IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () =>
                                                    _update(documentSnapshot)),
                                            // This icon button is used to delete a single product
                                            IconButton(
                                                icon: const Icon(Icons.delete),
                                                onPressed: () => _delete(
                                                    documentSnapshot.id)),
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

                        //search by categori
                        if (data['nama']
                            .toString()
                            .toLowerCase()
                            .startsWith(nama.toLowerCase())) {
                          return Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 25),
                                height: 73,
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
                                            // Press this button to edit a single product
                                            IconButton(
                                                icon: const Icon(Icons.edit),
                                                onPressed: () =>
                                                    _update(documentSnapshot)),
                                            // This icon button is used to delete a single product
                                            IconButton(
                                                icon: const Icon(Icons.delete),
                                                onPressed: () => _delete(
                                                    documentSnapshot.id)),
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

                        return Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
          // Add new product
          floatingActionButton: FloatingActionButton(
            onPressed: () => _create(),
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat),
    );
  }
}
