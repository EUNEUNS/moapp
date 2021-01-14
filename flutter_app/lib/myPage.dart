import 'package:flutter/material.dart';
import 'home.dart';
import 'HomeDetail.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<Image> imgList = [
  Image.asset('assets/hotel1.jpeg'),
  Image.asset('assets/hotel2.jpeg'),
  Image.asset('assets/hotel3.jpeg'),
  Image.asset('assets/hotel4.jpeg'),
  Image.asset('assets/hotel5.jpeg'),
  Image.asset('assets/hotel6.jpeg')
];
List<String> _hotelNames = [
  'Lahan Hotel',
  'Sub Hotel',
  'Plaza Hotel',
  'Galaxy Hotel',
  'Apple Hotel',
  'Mango Hotel'
];

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Page')),
      body: Container(
          child: Column(
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            items: imgList
                .map((item) => Container(
                      child: Container(
                        margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: InkWell(
                            child: Stack(
                              children: <Widget>[
                                item,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  child: Text(
                                    _hotelNames[imgList.indexOf(item)],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Todo todo = new Todo(
                                item,
                                ratingRow,
                                Text(_hotelNames[imgList.indexOf(item)]),
                                Text('영일대 앞 바다'),
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) => Detail(todo),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      )),
    );
  }
}
