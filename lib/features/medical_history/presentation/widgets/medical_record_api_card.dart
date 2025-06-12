import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healix/core/gen/assets.gen.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/medical_record_entity.dart';
import 'categoreis_grid_view.dart';

class MedicalRecordApiCard extends StatelessWidget {
  const MedicalRecordApiCard({
    super.key,
    required this.record,
    required this.categoryIndex,
  });

  final MedicalRecordEntity record;
  final int categoryIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: ColorsManager.lightGreyText,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            _getIconPath(categoryIndex),
            height: 48.h,
            width: 48.w,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getTitle(),
                  style: AppTextStyles.fontTextInput(
                    color: ColorsManager.darkerGreyText,
                  ).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Text(
                  _getFormattedDate(),
                  style: AppTextStyles.fontSmallerText(
                    color: ColorsManager.darkGreyText,
                  ),
                ),
              ],
            ),
          ),
          // Arrow icon
          Assets.svgs.rightArrow.svg(
            height: 20.h,
            width: 20.w,
          ),
        ],
      ),
    );
  }

  String _getIconPath(int categoryIndex) {
    if (categoryIndex < categories.length) {
      return categories[categoryIndex].imagePath;
    }
    return Assets.svgs.allergy.path;
  }

  String _getTitle() {
    final recordDto = record.recordDto as Map<String, dynamic>;

    switch (record.recordType) {
      case 0: // Medical Visit
        return recordDto['doctorName'] ?? 'Medical Visit';
      case 1: // Lab Test
        return recordDto['testName'] ?? 'Lab Test';
      case 2: // X-Ray
        return recordDto['scanName'] ?? 'X-Ray Scan';
      case 3: // Surgery
        return recordDto['procedureName'] ?? 'Surgery';
      case 4: // Allergy
        return recordDto['allergen'] ?? 'Allergy';
      case 5: // Logs
        return recordDto['logType'] ?? 'Medical Log';
      case 6: // Chronic Disease
        return recordDto['diseaseName'] ?? 'Chronic Disease';
      case 7: // Hereditary Disease
        return recordDto['diseaseName'] ?? 'Hereditary Disease';
      default:
        return 'Medical Record';
    }
  }

  String _getFormattedDate() {
    final recordDto = record.recordDto as Map<String, dynamic>;
    final dateStr = recordDto['date'];

    if (dateStr == null) return 'No date available';

    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return dateStr.toString();
    }
  }
}
