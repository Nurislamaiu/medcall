import 'package:flutter/material.dart';
import 'package:medcall/screens/requests/widgets/requests_list_widget.dart';
import 'package:medcall/widgets/custom_banner.dart';
import '../../util/color.dart';
import '../../util/size.dart';

class RequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: ScreenColor.white,
      body: Column(
        children: [
          CustomBannerOur(
            title: 'Ваши заявки на \nближайшие дни',
            subTitle: 'Не болейте :)',
            isButton: false,
          ),
          SizedBox(height: ScreenSize(context).height * 0.025),
          Expanded(
            child: RequestList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ScreenColor.color6,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/requestsNew');
        },
      ),
    );
  }
}