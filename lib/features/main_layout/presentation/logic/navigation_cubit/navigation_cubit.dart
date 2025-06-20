import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationInitial());

  int _selectedIndex = 0;
  final PageController pageController = PageController();

  int get selectedIndex => _selectedIndex;
  void changeTab(int index) {
    if (index >= 0 && index <= 3 && index != _selectedIndex) {
      _selectedIndex = index;
      if (pageController.hasClients) {
        pageController.jumpToPage(index);
      }
      emit(NavigationChanged(index));
    }
  }

  previousPage() {
    if (pageController.hasClients) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToHome() => changeTab(0);
  void goToMedicalHistory() => changeTab(1);
  void goToMyActivity() => changeTab(2);
  void goToSettings() => changeTab(3);

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
