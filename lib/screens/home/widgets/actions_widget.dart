import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../util/color.dart';
import 'home_action_button_widget.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ActionButton(
            icon: Icons.medical_information_outlined,
            label: 'Услуги',
            color: ScreenColor.color6,
            onTap: () {
              Navigator.pushNamed(context, '/service');
            },
          ),
          ActionButton(
            icon: Iconsax.emoji_normal,
            label: 'Maccaж',
            color: ScreenColor.color6,
            onTap: () {
              Navigator.pushNamed(context, '/service');
            },
          ),
          ActionButton(
            icon: Iconsax.chart,
            label: 'Доктор',
            color: ScreenColor.color6,
            onTap: () {
              Navigator.pushNamed(context, '/consultation');
            },
          ),
          ActionButton(
            icon: Iconsax.shop,
            label: 'Аптека',
            color: ScreenColor.color6,
            onTap: () {
              Navigator.pushNamed(context, '/consultation');
            },
          ),
        ],
      ),
    );
  }
}