import 'package:flutter/material.dart';
import 'package:healix/core/helpers/extensions.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/routing/routes.dart';
import 'home_feature_card.dart';

class HomeFeaturesButtonsRow extends StatelessWidget {
  const HomeFeaturesButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeFeatureCard(
          title: 'Med Hist',
          description: 'Your Medical\nHistory',
          iconPath: Assets.svgs.navActivity2.path,
        ),
        HomeFeatureCard(
          title: 'My Family',
          description: 'My Family\nMembers',
          iconPath: Assets.svgs.myFamily.path,
        ),
        HomeFeatureCard(
          title: 'Consult',
          description: 'Book An\nAppointment',
          iconPath: Assets.svgs.consultDoc.path,
          onTap: () => context.pushNamed(Routes.chooseSpecialtyScreen),
        ),
      ],
    );
  }
}
