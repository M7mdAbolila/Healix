import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';
import 'package:healix/features/family_group/presentation/widgets/copy_family_code_card.dart';
import 'package:healix/features/family_group/presentation/widgets/family_member_card.dart';
import 'package:healix/features/family_group/presentation/widgets/family_name_and_code_column.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/models/family_group_model.dart';

class FamilyGroupMembersScreen extends StatelessWidget {
  const FamilyGroupMembersScreen({super.key, this.familyGroup});
  final FamilyGroupModel? familyGroup;
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
                  FamilyNameAndCodeColumn(
                    familyCode: familyGroup?.code ?? 'Family Code',
                    familyName: familyGroup?.name ?? 'Family Name',
                  ),
                  verticalSpace(24),
                  Expanded(
                    child: ListView.builder(
                      itemCount: familyGroup?.members?.length ?? 0,
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return FamilyMemberCard(
                          member: familyGroup?.members?[index],
                        );
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
