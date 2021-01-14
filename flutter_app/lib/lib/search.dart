import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'home.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: MyStatefulWidget(),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  DateTime _checkIn;
  DateTime _checkOut;
  var _isNoKids = false;
  var _isPetFriendly = false;
  var _isFreeBreakfast = false;
  var _isFreeWifi = false;
  var _isElectric = false;
  List<Item> _data = generateItems(1);
  List<CheckboxListTile> _checkboxLists = List<CheckboxListTile>();
  List<String> _checkOptions = List<String>();
  String _checkOptionString = " ";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        //스르륵 나오는 리스트
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text("Filter"),
                );
              },
              // 체크박스들
              body: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _isNoKids,
                        onChanged: (value) {
                          setState(() {
                            _isNoKids = value;
                            if (_isNoKids == true) {
                              _checkOptions.add("Pet-Friendly");
                            } else
                              _checkOptions.remove("Pet-Friendly");
                          });
                        },
                      ),
                      Text("No Kids Zone")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isPetFriendly,
                        onChanged: (value) {
                          setState(() {
                            _isPetFriendly = value;
                            if (_isPetFriendly == true) {
                              _checkOptions.add("Pet-Friendly");
                            } else
                              _checkOptions.remove("Pet-Friendly");
                          });
                        },
                      ),
                      Text("Pet-Friendly")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isFreeBreakfast,
                        onChanged: (value) {
                          setState(() {
                            _isFreeBreakfast = value;
                            if (_isFreeBreakfast == true) {
                              _checkOptions.add("Pet-Friendly");
                            } else
                              _checkOptions.remove("Pet-Friendly");
                          });
                        },
                      ),
                      Text("Free breakfast")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isFreeWifi,
                        onChanged: (value) {
                          setState(() {
                            _isFreeWifi = value;
                            if (_isFreeWifi == true) {
                              _checkOptions.add("Pet-Friendly");
                            } else
                              _checkOptions.remove("Pet-Friendly");
                          });
                        },
                      ),
                      Text("Free Wifi")
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isElectric,
                        onChanged: (value) {
                          setState(() {
                            _isElectric = value;
                            if (_isElectric == true) {
                              _checkOptions.add("Pet-Friendly");
                            } else
                              _checkOptions.remove("Pet-Friendly");
                          });
                        },
                      ),
                      Text("Electric Car Charging")
                    ],
                  ),
                ],
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
        SizedBox(
          height: 20,
        ),
        //Date Picker
        Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text("Date"),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  //check-in Box
                  children: [
                    Row(children: [
                      Icon(Icons.calendar_today),
                      Text("check in")
                    ]),
                    Text(_checkIn.toString())
                  ],
                ),
                RaisedButton(
                  child: Text("select data"),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2222))
                        .then((date) {
                      setState(() {
                        _checkIn = date;
                      });
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  //check-in Box
                  children: [
                    Row(children: [
                      Icon(Icons.calendar_today),
                      Text("check out")
                    ]),
                    Text(_checkOut.toString())
                    // 날짜 나오는 곳
                  ],
                ),
                RaisedButton(
                  child: Text("select data"),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2222))
                        .then((date2) {
                      setState(() {
                        _checkOut = date2;
                      });
                    });
                  },
                )
              ],
            ),
          ],
        ),
        RaisedButton(
          child: Text("Search"),
          onPressed: () {
            setState(() {
              for (int i = 0; i < _checkOptions.length; i++) {
                _checkOptionString += _checkOptions[i].toString() + "/";
                _checkOptions.remove(i);
              }
            });

            _showMyDialog();
          },
        )
      ],
    ));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Please Check your choice'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(children: [
                  Icon(Icons.dehaze),
                  SizedBox(
                    width: 30,
                  ),
                  Text(_checkOptionString),
                ]),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_today),
                    Column(children: [
                      Text(_checkIn.toString()),
                      Text(_checkOut.toString()),
                    ]),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text("Search"),
                      color: Colors.blue,
                      onPressed: () {
                        _checkOptionString = " ";
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        _checkOptionString = " ";
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
