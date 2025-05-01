import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors_manager.dart';
import '../../../../../core/theming/shadows_manager.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../domain/entities/observation.dart';
import '../../screens/observations_screen.dart';

class ObservationsWidget extends StatelessWidget {
  const ObservationsWidget({
    super.key,
    required this.observations,
  });

  final List<Observation>? observations;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorsManager.blue20,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Observations',
            style: AppTextStyles.fontParagraphText(
              color: ColorsManager.grey500,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ObservationsScreen(
                observations: observations,
              ),
            )),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  ShadowsManager.softerShadow(),
                ],
              ),
              child: Text(
                '${observations!.length} observations',
                style: AppTextStyles.fontTextInput(
                  color: ColorsManager.grey800,
                ),
              ),
            ),
          )
        ],
      ),
    );

    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: observations!
    //       .map((obs) => Card(
    //             child: ListTile(
    //               title: Text(obs.condition),
    //               subtitle: Text('${obs.probability}\n${obs.description}'),
    //             ),
    //           ))
    //       .toList(),
    // );
  }
}
