import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import 'database/dbservices.dart';

class History extends StatefulWidget {
  @override
  _History createState() => _History();
}

class _History extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("History"),
        ),
        body: FutureBuilder<List<dynamic>>(
            future: DatabaseHistory.getGroupedData(),
            builder: (context, future) {
              if (future.hasData || future.data != null) {
                return GroupedListView<dynamic, String>(
                  elements: future.data!,
                  groupBy: (element) => element['TanggalTransaksi'],
                  groupComparator: (value1, value2) => value2.compareTo(value1),
                  itemComparator: (item1, item2) =>
                      item1['Nama'].compareTo(item2['Nama']),
                  order: GroupedListOrder.DESC,
                  useStickyGroupSeparators: true,
                  groupSeparatorBuilder: (String value) => Container(
                    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 230, 223, 223)),
                    child: Text(
                      value,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  itemBuilder: (c, element) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 230, 223, 223)),
                      )),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(element["Nama"],
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  element["Kategori"].toUpperCase(),
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  NumberFormat.currency(locale: 'id')
                                      .format(element["Nominal"]),
                                  style: TextStyle(color: Colors.orange),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Text('Error');
              }
            }),
      ),
    );
  }
}
