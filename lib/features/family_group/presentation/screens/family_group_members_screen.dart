import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/features/family_group/presentation/widgets/copy_family_code_card.dart';
import 'package:healix/features/family_group/presentation/widgets/family_member_card.dart';
import 'package:healix/features/family_group/presentation/widgets/family_name_and_code_column.dart';

import '../../../../core/helpers/spacing.dart';

class FamilyGroupMembersScreen extends StatelessWidget {
  const FamilyGroupMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'Family Group'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(24),
                  const FamilyNameAndCodeColumn(),
                  verticalSpace(24),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 8,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return const FamilyMemberCard();
                      },
                    ),
                  ),
                  verticalSpace(16),
                  const CopyFamilyCodeCard(),
                  verticalSpace(16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
