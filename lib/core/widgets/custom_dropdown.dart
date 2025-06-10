import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors_manager.dart';
import '../theming/shadows_manager.dart';
import '../theming/text_styles.dart';

class CustomAnimatedDropdown<T> extends StatefulWidget {
  final String label;
  final String placeholder;
  final List<T> items;
  final String Function(T) displayText;
  final void Function(T) onSelectionChanged;
  final T? initialValue;

  const CustomAnimatedDropdown({
    super.key,
    required this.label,
    required this.placeholder,
    required this.items,
    required this.displayText,
    required this.onSelectionChanged,
    this.initialValue,
  });

  @override
  State<CustomAnimatedDropdown<T>> createState() =>
      _CustomAnimatedDropdownState<T>();
}

class _CustomAnimatedDropdownState<T> extends State<CustomAnimatedDropdown<T>>
    with TickerProviderStateMixin {
  T? selectedItem;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialValue;
  }

  void _updateSelection(T item) {
    setState(() {
      selectedItem = item;
      widget.onSelectionChanged(item);
      isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyles.fontTextInput(
            color: ColorsManager.darkGreyText,
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                ShadowsManager.softerShadow(),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      selectedItem != null
                          ? widget.displayText(selectedItem as T)
                          : widget.placeholder,
                      style: AppTextStyles.fontTextInput(
                        color: selectedItem == null
                            ? ColorsManager.grey500
                            : ColorsManager.grey800,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(2.r),
                      decoration: BoxDecoration(
                        color: ColorsManager.lightGreyText,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0.0,
                        duration: const Duration(milliseconds: 550),
                        curve: Curves.easeInOut,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 20.sp,
                          color: ColorsManager.darkGreyText,
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 550),
                  curve: Curves.easeInOut,
                  child: isExpanded
                      ? Column(
                          children: widget.items.map((item) {
                            return _buildMenuItem(item);
                          }).toList(),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(T item) {
    final isFirst = widget.items.indexOf(item) == 0;

    return GestureDetector(
      onTap: () => _updateSelection(item),
      child: Container(
        padding: EdgeInsets.all(8.r),
        margin: EdgeInsets.only(
          bottom: 16.h,
          top: isFirst ? 16.h : 0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            ShadowsManager.softerShadow(),
          ],
        ),
        child: Row(
          children: [
            Text(
              widget.displayText(item),
              style: AppTextStyles.fontTextInput(
                color: ColorsManager.grey800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
