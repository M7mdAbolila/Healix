import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:healix/core/helpers/logging.dart';
import 'package:healix/features/sign_up/domain/usecases/verify_email_usecase.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../data/models/sign_up/sign_up_request_model.dart';
import '../../../data/models/sign_up/sign_up_response_model.dart';
import '../../../domain/usecases/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;
  final VerifyEmailUseCase verifyEmailUseCase;
  SignUpCubit(this.signUpUseCase, this.verifyEmailUseCase)
      : super(const SignUpInitial());

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final nationalIdController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  final createProfileFormKey = GlobalKey<FormState>();
  final physicalInfoFormKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  String selectedUserType = 'Patient';
  int? selectedBloodType;
  int? selectedGender;
  String? locationLat;
  String? locationLong;

  File? profilePhoto;

  Future<void> pickProfileImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        profilePhoto = File(pickedFile.path);
        emit(const PickedProfileImageSuccess());
        Logging.info('Profile image picked: ${profilePhoto!.path}');
      }
    } catch (e) {
      Logging.error('Error picking profile image: $e');
    }
  }

  Future<void> verifyEmail() async {
    final email = emailController.text.trim();
    emit(const SignUpLoading());
    final result = await verifyEmailUseCase.call(email);

    result.fold(
      (error) => emit(SignUpFailure(error.errMessage)),
      (_) => emit(const EmailVerifiedSuccess()),
    );
  }

  Future<void> signUp() async {
    emit(const SignUpLoading());

    final request = SignUpRequestModel(
      fullName: fullNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      userType: selectedUserType,
      locationLat: locationLat!,
      locationLong: locationLong!,
      profilePhoto: profilePhoto,
      phoneNumber: phoneNumberController.text.trim(),
      nationalId: nationalIdController.text.trim(),
      dateOfBirth: dateOfBirthController.text,
      bloodType: selectedBloodType!,
      height: heightController.text.trim(),
      weight: weightController.text.trim(),
      gender: selectedGender!,
    );

    final result = await signUpUseCase.call(request);

    result.fold(
      (error) => emit(
        SignUpFailure(error.errMessage),
      ),
      (response) => emit(
        SignUpSuccess(response),
      ),
    );
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    nationalIdController.dispose();
    heightController.dispose();
    weightController.dispose();
    dateOfBirthController.dispose();
    return super.close();
  }
}
