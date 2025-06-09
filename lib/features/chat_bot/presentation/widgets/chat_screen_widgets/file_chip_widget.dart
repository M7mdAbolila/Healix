import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/helpers/spacing.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';

import '../../../../../core/helpers/file_info_helpers.dart';

class FileChipWidget extends StatelessWidget {
  final String fileName;
  final int? fileSize;
  final VoidCallback? onRemove;
  final bool isInMessage;
  final bool isUserMessage;

  const FileChipWidget({
    super.key,
    required this.fileName,
    this.fileSize,
    this.onRemove,
    this.isInMessage = false,
    this.isUserMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    final fileExtension = getFileExtension(fileName);
    final displayName = formatFileName(fileName);

    Color backgroundColor;
    Color textColor;
    Color iconColor;

    if (isInMessage) {
      if (isUserMessage) {
        backgroundColor = ColorsManager.primaryColor.withValues(alpha: 0.1);
        textColor = ColorsManager.primaryColor;
        iconColor = ColorsManager.primaryColor;
      } else {
        backgroundColor = Colors.white.withValues(alpha: 0.2);
        textColor = Colors.white;
        iconColor = Colors.white;
      }
    } else {
      backgroundColor = ColorsManager.primaryColor;
      textColor = Colors.white;
      iconColor = Colors.white;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6.r),
        border: isInMessage && isUserMessage
            ? Border.all(color: ColorsManager.primaryColor, width: 1)
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            getFileTypeIcon(fileExtension),
            size: 16.sp,
            color: iconColor,
          ),
          horizontalSpace(4),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  displayName,
                  style: AppTextStyles.fontSmallerText(
                    color: textColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                if (fileSize != null)
                  Text(
                    formatFileSize(fileSize!),
                    style: AppTextStyles.fontSmallerText(
                      color: textColor.withValues(alpha: 0.7),
                    ),
                  ),
              ],
            ),
          ),
          if (onRemove != null) ...[
            horizontalSpace(4),
            GestureDetector(
              onTap: onRemove,
              child: Icon(
                Icons.close,
                size: 16.sp,
                color: iconColor,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
