import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../util/color.dart';
import 'home_advantage_tile_widget.dart';

class Advertising extends StatelessWidget {
  const Advertising({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Почему выбирают нас:',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ScreenColor.color1,
            ),
          ),
          SizedBox(height: 10),
          AdvantageTile(
            icon: Iconsax.award,
            text: 'Квалифицированные специалисты',
          ),
          AdvantageTile(
            icon: Iconsax.shield_tick,
            text: 'Стерильность и безопастность',
          ),
          AdvantageTile(
            icon: Iconsax.location,
            text: 'Доступность 24/7',
          ),
          AdvantageTile(
            icon: Iconsax.truck_fast,
            text: 'Быстрая доставка медикаментов',
          ),
        ],
      ),
    );
  }
}