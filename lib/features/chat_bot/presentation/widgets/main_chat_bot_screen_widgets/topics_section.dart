import 'package:flutter/material.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/feature_title_text.dart';
import '../../../../../core/widgets/view_all_button.dart';
import 'topic_card.dart';

class TopicsSection extends StatelessWidget {
  const TopicsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FeatureTitleText(title: 'Topics'),
            ViewAllButton(onTap: () {}),
          ],
        ),
        verticalSpace(12),
        const TopicCard(),
        verticalSpace(8),
        const TopicCard(),
        verticalSpace(8),
        const TopicCard(),
        verticalSpace(8),
      ],
    );
  }
}
