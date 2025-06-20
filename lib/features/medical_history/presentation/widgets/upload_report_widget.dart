import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/dialogs/setup_dialog.dart';
import 'package:healix/core/helpers/logging.dart';
import 'package:healix/features/medical_history/presentation/state_management/add_medical_record_cubit/add_medical_record_cubit.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class UploadAReportWidget extends StatefulWidget {
  const UploadAReportWidget({super.key});

  @override
  State<UploadAReportWidget> createState() => _UploadAReportWidgetState();
}

class _UploadAReportWidgetState extends State<UploadAReportWidget> {
  List<PlatformFile> selectedFiles = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            allowMultiple: true,
            type: FileType.any,
          );
          if (result != null) {
            setState(() {
              selectedFiles = result.files;
              final files = result.files
                  .where((file) => file.path != null)
                  .map((file) => File(file.path!))
                  .toList();

              // Set files in the cubit if available
              final cubit = context.read<AddMedicalRecordCubit>();
              cubit.setFiles(files);

              Logging.info(
                'Selected files: ${files.map((file) => file.path).join(', ')}',
              );
            });
          }
        } catch (e) {
          showAwesomeSnackbar(
            context,
            title: 'Error',
            message: e.toString(),
            isError: true,
          );
          Logging.log('File selection error: $e');
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: ColorsManager.lightGreyText,
          ),
        ),
        child: Row(
          spacing: 8.w,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                spacing: 8.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upload a Report',
                    style: AppTextStyles.fontBodyText(
                      color: ColorsManager.darkerGreyText,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  selectedFiles.isNotEmpty
                      ? Row(
                          spacing: 8.w,
                          children: [
                            Assets.svgs.documentUpload.svg(
                              height: 24.h,
                              width: 24.w,
                            ),
                            if (selectedFiles.length > 1)
                              Text(
                                '${selectedFiles.length} file(s) selected',
                                style: AppTextStyles.fontBodyText(
                                  color: ColorsManager.darkGreyText,
                                ),
                              ),
                          ],
                        )
                      : Text(
                          'Lab results, Medical reports, etc. Image/ PDF',
                          style: AppTextStyles.fontBodyText(
                            color: ColorsManager.darkGreyText,
                          ),
                        ),
                ],
              ),
            ),
            Assets.svgs.rightArrow.svg(
              height: 24.h,
              width: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
