import 'package:flutter/material.dart';
import 'package:medcall/widgets/custom_banner.dart';

import '../../util/color.dart';


class TeamScreen extends StatelessWidget {
  final List<TeamMember> teamMembers = [
    TeamMember(
      name: 'Ильясов Нурислам',
      role: 'Flutter Программист',
      description: 'Специализируется на разработке кросс-платформенных мобильных приложений с использованием Flutter.',
      imagePath: 'https://yt3.googleusercontent.com/REq4rTSQRwbsLk1v3PfreNf8creu9lhpox9R86w9BcExM1LEolkPFphZuIbwh_JYCi8B-ENQMSI=s900-c-k-c0x00ffffff-no-rj',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomBannerOur(title: 'О команде', subTitle: 'Все информация о команде.'),
          Expanded(
            child: ListView.builder(
              itemCount: teamMembers.length,
              itemBuilder: (context, index) {
                final member = teamMembers[index];
                return Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [ScreenColor.background, Colors.white70],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(member.imagePath),
                      radius: 30,
                    ),
                    title: Text(member.name, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(member.role, style: TextStyle(fontSize: 16.0, color: Colors.grey[700])),
                        SizedBox(height: 4.0),
                        Text(member.description, style: TextStyle(fontSize: 12.0, color: Colors.grey[600])),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TeamMember {
  final String name;
  final String role;
  final String description;
  final String imagePath;

  TeamMember({required this.name, required this.role, required this.description, required this.imagePath});
}
