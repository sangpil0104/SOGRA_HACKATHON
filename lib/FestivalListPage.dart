import 'package:flutter/material.dart';
import 'package:sogra_application/Festival.dart';
import 'DetailScreen.dart';

class FestivalListPage extends StatelessWidget {
  List<Festival> festivals = [
    Festival(
      title: '대전 0시 축제',
      ageGroup: '전 연령',
      cost: '무료',
      location: '대전',
      slot: '밤',
      time: '20:00 PM - 00:00 AM',
      imagePath: 'assets/대전 0시 축제.jpg',
    ),
    // 추가적인 축제 정보를 여기에 추가하세요.
  ];

  void addFestival(
      String title, String ageGroup, String cost,
      String location, String slot, String time, String imagePath) {
    festivals.add(Festival(title: title, ageGroup: ageGroup, cost: cost, location: location,
        slot: slot, time: time, imagePath: imagePath));
  }

  FestivalListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('축제 리스트'),
      ),
      body: ListView.builder(
        itemCount: festivals.length,
        itemBuilder: (context, index) {
          final festival = festivals[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(
                festival.imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text(festival.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('연령: ${festival.ageGroup}'),
                  Text('가격: ${festival.cost}'),
                  Text('지역: ${festival.location}'),
                  Text('시간대: ${festival.slot}'),
                  Text('시간: ${festival.time}'),
                ],
              ),
              onTap: () {
                // 축제 상세 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}