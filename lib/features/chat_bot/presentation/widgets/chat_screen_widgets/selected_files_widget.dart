import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';

import 'file_chip_widget.dart';

class SelectedFilesWidget extends StatelessWidget {
  final List<PlatformFile> selectedFiles;
  final Function(PlatformFile) onRemoveFile;
  final VoidCallback onClearAll;
  final VoidCallback onAddMoreFiles;
  final String? totalSize;

  const SelectedFilesWidget({
    super.key,
    required this.selectedFiles,
    required this.onRemoveFile,
    required this.onClearAll,
    required this.onAddMoreFiles,
    this.totalSize,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedFiles.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selected Files (${selectedFiles.length})${totalSize != null ? ' • $totalSize' : ''}',
                style: AppTextStyles.fontParagraphText(
                  color: ColorsManager.primaryColor,
                ).copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: onClearAll,
                child: Text(
                  'Clear All',
                  style: AppTextStyles.fontSmallerText(
                    color: ColorsManager.alertColor,
                  ).copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Wrap(
            spacing: 8.w,
            runSpacing: 4.h,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ...selectedFiles.map((file) => _buildFileChip(file)),
              _buildAddMoreFilesButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFileChip(PlatformFile file) {
    return FileChipWidget(
      fileName: file.name,
      fileSize: file.size,
      onRemove: () => onRemoveFile(file),
    );
  }

  Widget _buildAddMoreFilesButton() {
    return InkWell(
      onTap: onAddMoreFiles,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: ColorsManager.primaryColor.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(
          Icons.add,
          size: 18.sp,
          color: ColorsManager.primaryColor,
        ),
      ),
    );
  }
}
