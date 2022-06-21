import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class transferOWO extends StatefulWidget {
  const transferOWO({Key? key}) : super(key: key);

  @override
  State<transferOWO> createState() => _transferOWOState();
}

class _transferOWOState extends State<transferOWO> {
  String noTelp = "";
  String msg = "";
  int balance = 50000;
  int nominaltf = 0;

  final List<String> contoh = [
    "David",
    "Riski",
    "Tanoto",
  ];
  String? menuItem;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Transfer Sesama OWO",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transfer Sesama OWO"),
        ),
        body: Container(
          child: Wrap(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.blueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      //onPressed: Navigator.of(context).pop,
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      color: Colors.blueAccent,
                    ),
                    Text(
                      "Ke Sesama OWO",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  textDirection: TextDirection.ltr,
                                  decoration: InputDecoration(
                                    //border: OutlineInputBorder(),
                                    labelText: "Masukkan nomor ponsel",
                                  ),
                                  onChanged: (inputtelp) {
                                    noTelp = inputtelp;
                                  },
                                ),
                              ),
                              Container(
                                child: Icon(Icons.note_alt_outlined),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Sumber Dana",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 25),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Expanded(
                          child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Icon(Icons.timelapse_rounded),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Text(
                                    "OWO Cash",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ),
                                Text("Balance IDR 5.000")
                              ],
                            ),
                          )
                        ],
                      )),
                      // child: Wrap(
                      //   spacing: 25,
                      //   alignment: WrapAlignment.center,
                      //   children: [
                      //     Icon(
                      //       Icons.access_alarm_outlined,
                      //       color: Colors.black,
                      //     ),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: [
                      //         Text(
                      //           "Owo Cash",
                      //           style: TextStyle(
                      //               color: Colors.black,
                      //               fontWeight: FontWeight.bold,
                      //               fontSize: 18),
                      //         ),
                      //         Text(
                      //           "Balance Rp. ${balance}",
                      //           style: TextStyle(
                      //             color: Colors.grey,
                      //             fontSize: 18,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ),
                    // SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 20, 16, 30),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 235, 227, 227),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nominal Transfer",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Rp. ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width: 200,
                                child: TextField(
                                  textDirection: TextDirection.ltr,
                                  decoration: InputDecoration(
                                    hintText: "${nominaltf}",
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onChanged: (nominal) {
                                    nominaltf = int.parse(nominal);
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("Pilih Kategori:"),
                              ),
                              Container(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  items: contoh.map(buildMenuItem).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      menuItem = value;
                                    });
                                  },
                                  value: menuItem,
                                ),
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                    // Text("Pilih Kategori:"),
                    // DropdownButton<String>(
                    //   items: contoh.map(buildMenuItem).toList(),
                    //   onChanged: (value) {
                    //     setState(() {
                    //       menuItem = value;
                    //     });
                    //   },
                    //   value: menuItem,
                    // ),
                    // SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: TextField(
                        textDirection: TextDirection.ltr,
                        decoration: InputDecoration(
                          hintText: "Pesan (opstional)",
                        ),
                        minLines: 1,
                        maxLines: 5,
                        onChanged: (pesan) {
                          msg = pesan;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Kirim Sekarang"),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.lightGreenAccent,
                            fixedSize: Size.fromWidth(350),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
