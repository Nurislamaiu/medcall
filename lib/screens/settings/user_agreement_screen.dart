import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:medcall/widgets/custom_banner.dart';

import '../../util/color.dart';


class UserAgreementScreen extends StatefulWidget {
  @override
  _UserAgreementScreenState createState() => _UserAgreementScreenState();
}

class _UserAgreementScreenState extends State<UserAgreementScreen> {
  String userAgreement = "";

  @override
  void initState() {
    super.initState();
    _loadUserAgreement();
  }

  Future<void> _loadUserAgreement() async {
    final String agreementText = await rootBundle.loadString('assets/user_agreement.txt');
    setState(() {
      userAgreement = agreementText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: userAgreement.isEmpty
          ? Center(child: CircularProgressIndicator(color: ScreenColor.color6,))
          : Column(
            children: [
              CustomBannerOur(title: 'ПОЛЬЗОВАТЕЛЬСКОЕ \nСОГЛАШЕНИЕ', subTitle: 'Прочитайте'),
              Expanded(
                child: SingleChildScrollView(
                        padding: EdgeInsets.all(16.0),
                        child: Text(userAgreement),
                      ),
              ),
            ],
          ),
    );
  }
}
