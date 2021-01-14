import 'package:flutter/material.dart';
import 'home.dart';

class Detail extends StatefulWidget {
  Todo todo;

  Detail(this.todo);

  _DetailState createState() => _DetailState(this.todo);
}

class _DetailState extends State<Detail> {
  Todo todo;

  _DetailState(this.todo);

  int num = 0;
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    String hotelname = (todo.hotelName).data;
    return Scaffold(
      appBar: AppBar(
        title: Text("detail"),
      ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              GestureDetector(
                child: Hero(
                  tag: 'imageHero',
                  child: todo.hotelImg,
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return PhotoHero(todo);
                  }));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: (_isFavorited
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border)),
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        if (_isFavorited) {
                          _isFavorited = false;
                          index = hotelnames.length - 1;
                          hotelnames.remove(hotelname);
                        } else {
                          _isFavorited = true;
                          index = hotelnames.length;
                          hotelnames.add(hotelname);
                        }
                      });
                    },
                  )
                ],
              ),
            ],
          ),
          todo.iconRow,
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [todo.hotelName]),
          Row(
            children: [
              Icon(Icons.location_on),
              todo.hotelLocation,
            ],
          ),
          Row(
            children: [
              Icon(Icons.phone),
              Text(hotelDescription[hotelname][0]),
            ],
          ),
          Text(hotelDescription[hotelname][1])
        ],
      ),
    );
  }
}

Map hotelDescription = {
  "Lahan Hotel": [
    "054-123-1231",
    "라한호텔은 대한민국 최대규모 호텔그룹입니다.이제 아시아를 넘어 세계로 뻗어가는 글로벌 호텔로서 전세계 어디에서나 한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 브랜드를 지향하고 있습니다.균형 있는 라이프스타일을 추구하며 품격의 가치를 아는 고객을 위해 세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다. 또한 롯데호텔만의 감각적인 오트 퀴진과 다양한 경험을 제공하는 호텔시설은 감동을 더해드립니다. 롯데호텔에서 품격 있는 휴식으로 삶의 균형을 완성해가시길 바랍니다."
  ],
  "Sub Hotel": [
    "054-123-1231",
    "Sub Hotel 대한민국 최대규모 호텔그룹입니다.이제 아시아를 넘어 세계로 뻗어가는 글로벌 호텔로서 전세계 어디에서나 한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 브랜드를 지향하고 있습니다.균형 있는 라이프스타일을 추구하며 품격의 가치를 아는 고객을 위해 세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다. 또한 롯데호텔만의 감각적인 오트 퀴진과 다양한 경험을 제공하는 호텔시설은 감동을 더해드립니다. 롯데호텔에서 품격 있는 휴식으로 삶의 균형을 완성해가시길 바랍니다."
  ],
  "Plaza Hotel": [
    "054-123-1231",
    "Plaza hotel 대한민국 최대규모 호텔그룹입니다.이제 아시아를 넘어 세계로 뻗어가는 글로벌 호텔로서 전세계 어디에서나 한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 브랜드를 지향하고 있습니다.균형 있는 라이프스타일을 추구하며 품격의 가치를 아는 고객을 위해 세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다. 또한 롯데호텔만의 감각적인 오트 퀴진과 다양한 경험을 제공하는 호텔시설은 감동을 더해드립니다. 롯데호텔에서 품격 있는 휴식으로 삶의 균형을 완성해가시길 바랍니다."
  ],
  "Galaxy Hotel": [
    "054-123-1231",
    "Galaxy Hotel 대한민국 최대규모 호텔그룹입니다.이제 아시아를 넘어 세계로 뻗어가는 글로벌 호텔로서 전세계 어디에서나 한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 브랜드를 지향하고 있습니다.균형 있는 라이프스타일을 추구하며 품격의 가치를 아는 고객을 위해 세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다. 또한 롯데호텔만의 감각적인 오트 퀴진과 다양한 경험을 제공하는 호텔시설은 감동을 더해드립니다. 롯데호텔에서 품격 있는 휴식으로 삶의 균형을 완성해가시길 바랍니다."
  ],
  "Apple Hotel": [
    "054-123-1231",
    "Apple Hotel 대한민국 최대규모 호텔그룹입니다.이제 아시아를 넘어 세계로 뻗어가는 글로벌 호텔로서 전세계 어디에서나 한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 브랜드를 지향하고 있습니다.균형 있는 라이프스타일을 추구하며 품격의 가치를 아는 고객을 위해 세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다. 또한 롯데호텔만의 감각적인 오트 퀴진과 다양한 경험을 제공하는 호텔시설은 감동을 더해드립니다. 롯데호텔에서 품격 있는 휴식으로 삶의 균형을 완성해가시길 바랍니다."
  ],
  "Mango Hotel": [
    "054-123-1231",
    "Mango Hotel은 대한민국 최대규모 호텔그룹입니다.이제 아시아를 넘어 세계로 뻗어가는 글로벌 호텔로서 전세계 어디에서나 한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 브랜드를 지향하고 있습니다.균형 있는 라이프스타일을 추구하며 품격의 가치를 아는 고객을 위해 세련되고 모던한 감각을 지닌 안락한 객실과 세심한 배려가 묻어나는 서비스를 준비합니다. 또한 롯데호텔만의 감각적인 오트 퀴진과 다양한 경험을 제공하는 호텔시설은 감동을 더해드립니다. 롯데호텔에서 품격 있는 휴식으로 삶의 균형을 완성해가시길 바랍니다."
  ]
};

class PhotoHero extends StatelessWidget {
  Todo todo;

  PhotoHero(this.todo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Hero(
          tag: 'imageHero',
          child: todo.hotelImg,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
