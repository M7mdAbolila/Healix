import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/widgets/custom_screen_app_bar.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';
import '../../family_group.dart';

class MyFamilyScreen extends StatefulWidget {
  const MyFamilyScreen({super.key});

  @override
  State<MyFamilyScreen> createState() => _MyFamilyScreenState();
}

class _MyFamilyScreenState extends State<MyFamilyScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetFamilyGroupCubit>().getFamilyGroup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const CustomScreenAppBar(title: 'My Family'),
          verticalSpace(24),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: BlocBuilder<GetFamilyGroupCubit, GetFamilyGroupState>(
                buildWhen: (p, c) =>
                    c is GetFamilyGroupSuccess ||
                    c is GetFamilyGroupFailure ||
                    c is GetFamilyGroupLoading,
                builder: (context, state) {
                  if (state is GetFamilyGroupSuccess) {
                    final familyGroup = state.response.familyGroup;
                    return MyFamilyGroupData(familyGroup: familyGroup);
                  } else if (state is GetFamilyGroupFailure) {
                    /// This means the user has no family group (issue form backend response)
                    return state.errorMessage ==
                            'Object reference not set to an instance of an object.'
                        ? const EmptyFamilyGroup()
                        : Center(
                            child: Text(
                              state.errorMessage,
                              style: AppTextStyles.fontBodyText(
                                color: ColorsManager.alertColor,
                              ),
                            ),
                          );
                  } else {
                    return const LoadingFamilyGroup();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
