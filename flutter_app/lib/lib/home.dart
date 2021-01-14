// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:Shrine/login.dart';
import 'package:flutter/material.dart';
import 'HomeDetail.dart';
import 'search.dart';
import 'Website.dart';
import 'myPage.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/search': (context) => Search(),
        '/favoriteHotel': (context) => FavoriteHotel(),
        '/website': (context) => Website(),
        '/myPage': (context) => MyPage(),
      },
    );
  }
}
Row ratingRow = Row(
  children: [
    Icon(
      Icons.star,
      color: Colors.yellow,
    ),
    Icon(
      Icons.star,
      color: Colors.yellow,
    ),
    Icon(
      Icons.star,
      color: Colors.yellow,
    ),
  ],
);
class Home extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Main'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                semanticLabel: 'search',
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.language,
                semanticLabel: 'website',
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/website');
              },
            ),
          ],
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          return GridView.count(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            padding: EdgeInsets.all(18.0),
            childAspectRatio: 8.0 / 10,
            children: <Widget>[
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset('assets/hotel1.jpeg'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(14.0, 0.0, 4.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ratingRow,
                          Text('Lahan Hotel'),
                          SizedBox(height: 8.0),
                          Text('영일대 앞 바다'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("more", style: TextStyle(fontSize: 15)),
                          onPressed: () {
                            Todo todo = new Todo(
                              Image.asset('assets/hotel1.jpeg'),
                                ratingRow,
                              Text('Lahan Hotel'),
                              Text('영일대 앞 바다'),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail(todo),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset('assets/hotel2.jpeg'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(14.0, 0.0, 4.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ratingRow,
                          Text('Sub Hotel'),
                          SizedBox(height: 8.0),
                          Text('영일대 앞 바다'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("more", style: TextStyle(fontSize: 15)),
                          onPressed: () {
                            Todo todo = new Todo(
                              Image.asset('assets/hotel2.jpeg'),
                                ratingRow,
                              Text('Sub Hotel'),
                              Text('영일대 앞 바다'),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail(todo),
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset('assets/hotel3.jpeg'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(14.0, 0.0, 4.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ratingRow,
                          Text('Plaza Hotel'),
                          SizedBox(height: 8.0),
                          Text('영일대 앞 바다'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("more", style: TextStyle(fontSize: 15)),
                          onPressed: () {
                            Todo todo = new Todo(
                              Image.asset('assets/hotel3.jpeg'),
                                ratingRow,
                              Text('Plaza Hotel'),
                              Text('영일대 앞 바다'),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail(todo),
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset('assets/hotel4.jpeg'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(14.0, 0.0, 4.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ratingRow,
                          Text('Galaxy Hotel'),
                          SizedBox(height: 8.0),
                          Text('영일대 앞 바다'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("more", style: TextStyle(fontSize: 15)),
                          onPressed: () {
                            Todo todo = new Todo(
                              Image.asset('assets/hotel4.jpeg'),
                                ratingRow,
                              Text('Galaxy Hotel'),
                              Text('영일대 앞 바다'),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail(todo),
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset('assets/hotel5.jpeg'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(14.0, 0.0, 4.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ratingRow,
                          Text('Apple Hotel'),
                          SizedBox(height: 8.0),
                          Text('영일대 앞 바다'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("more", style: TextStyle(fontSize: 15)),
                          onPressed: () {
                            Todo todo = new Todo(
                              Image.asset('assets/hotel5.jpeg'),
                                ratingRow,
                              Text('Apple Hotel'),
                              Text('영일대 앞 바다'),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail(todo),
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset('assets/hotel6.jpeg'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(14.0, 0.0, 4.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ratingRow,
                          Text('Mango Hotel'),
                          SizedBox(height: 8.0),
                          Text('영일대 앞 바다'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                          child: Text("more", style: TextStyle(fontSize: 15)),
                          onPressed: () {
                            Todo todo = new Todo(
                              Image.asset('assets/hotel6.jpeg'),
                                ratingRow,
                              Text('Mango Hotel'),
                              Text('영일대 앞 바다'),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail(todo),
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              )
            ], // Changed code
          );
        }),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Pages'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                title: Text('Search'),
                leading: Icon(Icons.search),
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
              ),
              ListTile(
                title: Text('Favorite Hotel'),
                leading: Icon(Icons.location_city),
                onTap: () {
                  Navigator.pushNamed(context, '/favoriteHotel');
                },
              ),
              ListTile(
                title: Text('Website'),
                leading: Icon(Icons.language),
                onTap: () {
                  Navigator.pushNamed(context, '/website');
                },
              ),
              ListTile(
                title: Text('My Page'),
                leading: Icon(Icons.person),
                onTap: () {
                  Navigator.pushNamed(context, '/myPage');
                },
              ),
            ],
          ),
        ));
  }
}


class FavoriteHotel extends StatefulWidget {
  _FavoriteHotelState createState() => _FavoriteHotelState();
}

List<String> hotelnames = [];
int index = 0;

class _FavoriteHotelState extends State<FavoriteHotel> {
  // This will be called each time the + button is pressed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Hotels"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        if (index < hotelnames.length) {
          return Dismissible(
            key: Key(hotelnames[index]),
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                hotelnames.removeAt(index);
              });
            },
            background: Container(color: Colors.red),
            child: ListTile(title: Text(hotelnames[index])),
          );
        }
      }),
    );
  }
}



class Todo {
  Image hotelImg;
  Text hotelName;
  Text hotelLocation;
  Row iconRow;

  Todo(this.hotelImg, this.iconRow, this.hotelName, this.hotelLocation);
}
