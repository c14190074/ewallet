import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfile createState() => _MyProfile();
}

class _MyProfile extends State {
  bool panel1 = false;
  bool panel2 = false;
  bool panel3 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Profile"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
                  child: Text(
                    "Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: Color.fromARGB(255, 230, 223, 223)),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 209, 212, 214),
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color.fromARGB(255, 231, 223, 223),
                                width: 5)),
                        child: Icon(
                          Icons.people_rounded,
                        ),
                        padding: EdgeInsets.all(15),
                        //margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        //color: Colors.grey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 3),
                                  child: Text(
                                    "Agung Wibowo",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  //margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    "0813-5811-8511",
                                    textAlign: TextAlign.left,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: ExpansionPanelList(
                    expansionCallback: (panelIndex, isExpanded) {
                      panel1 = !panel1;
                      setState(() {});
                    },
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.lock_clock_rounded),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(15, 0, 0, 0),
                                        child: Text(
                                          "OVO Premier",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                          body: Wrap(
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                                  child: Text(
                                      "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting."))
                            ],
                          ),
                          isExpanded: panel1,
                          canTapOnHeader: true)
                    ],
                  ),
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: ExpansionPanelList(
                    expansionCallback: (panelIndex, isExpanded) {
                      panel2 = !panel2;
                      setState(() {});
                    },
                    children: [
                      ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(Icons.lock_clock_rounded),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(15, 0, 0, 0),
                                        child: Text(
                                          "OVO Points",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                          body: Wrap(
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                                  child: Text(
                                      "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting."))
                            ],
                          ),
                          isExpanded: panel2,
                          canTapOnHeader: true)
                    ],
                  ),
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 8.0,
                          color: Color.fromARGB(255, 230, 223, 223)),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(10, 6, 0, 6),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.edit_note_outlined),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(
                          "Ubah Profil",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(10, 30, 10, 20),
                  child: Text(
                    "OVO ID",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 8.0,
                          color: Color.fromARGB(255, 230, 223, 223)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromARGB(255, 230, 223, 223))),
                        padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: Row(
                          children: [
                            Container(
                              child: Icon(Icons.qr_code),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text("QR Code"),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Color.fromARGB(255, 230, 223, 223))),
                        padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              child: Icon(Icons.qr_code_2),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text("QR Code"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Sign Out")),
                      )
                    ],
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
