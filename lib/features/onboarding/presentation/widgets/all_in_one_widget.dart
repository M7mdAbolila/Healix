import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/helpers/spacing.dart';

class AllInOneWidget extends StatelessWidget {
  const AllInOneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.svgs.allInOne.svg(),
        verticalSpace(30),
      ],
    );
  }
}
