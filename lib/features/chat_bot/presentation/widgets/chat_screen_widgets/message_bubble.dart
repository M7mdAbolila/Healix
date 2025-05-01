import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healix/core/theming/colors_manager.dart';
import 'package:healix/core/theming/text_styles.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/observation.dart';
import 'observations_widget.dart';
import 'options_widget.dart';

class MessageBubble extends StatelessWidget {
  final bool isUser;
  final String message;
  final DateTime date;
  final List<String>? images;
  final List<String>? options;
  final bool hasObservations;
  final List<Observation>? observations;
  final Function(String) onOptionSelected;

  const MessageBubble({
    super.key,
    required this.isUser,
    required this.message,
    required this.date,
    this.images,
    this.options,
    this.hasObservations = false,
    this.observations,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(
          (options != null && options!.isNotEmpty) ||
                  hasObservations && observations != null
              ? 16.r
              : 8.r,
        ),
        margin: EdgeInsets.fromLTRB(
          isUser ? 40.w : 16.w,
          8.h,
          isUser ? 16.w : 40.w,
          8.h,
        ),
        decoration: BoxDecoration(
          color: isUser ? Colors.white : ColorsManager.botMessageColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isUser ? 16.r : 0.r),
            topRight: Radius.circular(isUser ? 0.r : 16.r),
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
          border: const Border(
            bottom: BorderSide(
              color: ColorsManager.blue100,
            ),
          ),
        ),
        child: Column(
          spacing: 8.h,
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: AppTextStyles.fontTextInput(
                color: isUser ? ColorsManager.grey800 : ColorsManager.blue100,
              ),
            ),
            if (options != null && options!.isNotEmpty)
              OptionsWidget(
                options: options,
                onOptionSelected: onOptionSelected,
              ),
            if (hasObservations && observations != null)
              ObservationsWidget(
                observations: observations,
              ),
            Text(
              DateFormat.jm().format(date),
              style: AppTextStyles.fontSmallerText(
                color: isUser ? ColorsManager.grey500 : ColorsManager.grey700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
