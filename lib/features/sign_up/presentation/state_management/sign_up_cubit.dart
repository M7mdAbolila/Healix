import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../../core/domain/services/input_validation_service.dart';
import '../../../../core/presentation/form/form_manager.dart';
import '../../domain/entities/sign_up_request_entity.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../../domain/usecases/verify_email_usecase.dart';
import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;
  final VerifyEmailUseCase _verifyEmailUseCase;
  final InputValidationService _validationService;
  final SignUpFormManager _signUpFormManager;
  final CreateProfileFormManager _profileFormManager;
  final PhysicalInfoFormManager _physicalFormManager;

  SignUpCubit({
    required SignUpUseCase signUpUseCase,
    required VerifyEmailUseCase verifyEmailUseCase,
    required InputValidationService validationService,
    required SignUpFormManager signUpFormManager,
    required CreateProfileFormManager profileFormManager,
    required PhysicalInfoFormManager physicalFormManager,
  })  : _signUpUseCase = signUpUseCase,
        _verifyEmailUseCase = verifyEmailUseCase,
        _validationService = validationService,
        _signUpFormManager = signUpFormManager,
        _profileFormManager = profileFormManager,
        _physicalFormManager = physicalFormManager,
        super(const SignUpInitial());

  SignUpFormManager get signUpFormManager => _signUpFormManager;
  CreateProfileFormManager get profileFormManager => _profileFormManager;
  PhysicalInfoFormManager get physicalFormManager => _physicalFormManager;

  String selectedUserType = 'Patient';
  int? selectedBloodType;
  int? selectedGender;
  String? locationLat;
  String? locationLong;
  File? profilePhoto;

  final ImagePicker _picker = ImagePicker();

  String? validateEmail(String? email) =>
      _validationService.validateEmail(email);
  String? validatePassword(String? password) =>
      _validationService.validatePassword(password);
  String? validateConfirmPassword(String? password, String? confirmPassword) =>
      _validationService.validateConfirmPassword(password, confirmPassword);
  String? validateFullName(String? fullName) =>
      _validationService.validateFullName(fullName);
  String? validatePhoneNumber(String? phoneNumber) =>
      _validationService.validatePhoneNumber(phoneNumber);
  String? validateNationalId(String? nationalId) =>
      _validationService.validateNationalId(nationalId);
  String? validateNumericField(String? value, String fieldName) =>
      _validationService.validateNumericField(value, fieldName);

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
        emit(const ProfileImagePickedSuccess());
      }
    } catch (e) {
      emit(SignUpFailure('Error picking profile image: ${e.toString()}'));
    }
  }

  Future<void> verifyEmail() async {
    final validationErrors = _validateEmailForm();
    if (validationErrors.isNotEmpty) {
      emit(SignUpValidationError(validationErrors));
      return;
    }

    emit(const EmailVerificationLoading());

    try {
      final result = await _verifyEmailUseCase.call(
        _signUpFormManager.emailController.value,
      );

      result.fold(
        (error) => emit(EmailVerificationFailure(error.errMessage)),
        (_) => emit(const EmailVerifiedSuccess()),
      );
    } catch (e) {
      emit(const EmailVerificationFailure(
          'An unexpected error occurred. Please try again.'));
    }
  }

  Future<void> signUp() async {
    final validationErrors = _validateAllForms();
    if (validationErrors.isNotEmpty) {
      emit(SignUpValidationError(validationErrors));
      return;
    }

    emit(const SignUpLoading());

    try {
      final request = _buildSignUpRequest();
      final result = await _signUpUseCase.call(request);

      result.fold(
        (error) => emit(SignUpFailure(error.errMessage)),
        (authResponse) => emit(SignUpSuccess(authResponse)),
      );
    } catch (e) {
      emit(const SignUpFailure(
          'An unexpected error occurred. Please try again.'));
    }
  }

  void setLocation(String lat, String long) {
    locationLat = lat;
    locationLong = long;
  }

  void setBloodType(int bloodType) {
    selectedBloodType = bloodType;
  }

  void setGender(int gender) {
    selectedGender = gender;
  }

  void setUserType(String userType) {
    selectedUserType = userType;
  }

  Map<String, String> _validateEmailForm() {
    final errors = <String, String>{};

    final emailError = _validationService.validateEmail(
      _signUpFormManager.emailController.value,
    );
    if (emailError != null) {
      errors['email'] = emailError;
    }

    final passwordError = _validationService.validatePassword(
      _signUpFormManager.passwordController.value,
    );
    if (passwordError != null) {
      errors['password'] = passwordError;
    }

    final confirmPasswordError = _validationService.validateConfirmPassword(
      _signUpFormManager.passwordController.value,
      _signUpFormManager.confirmPasswordController.value,
    );
    if (confirmPasswordError != null) {
      errors['confirmPassword'] = confirmPasswordError;
    }

    return errors;
  }

  Map<String, String> _validateAllForms() {
    final errors = <String, String>{};

    errors.addAll(_validateEmailForm());

    final fullNameError = _validationService.validateFullName(
      _profileFormManager.fullNameController.value,
    );
    if (fullNameError != null) {
      errors['fullName'] = fullNameError;
    }

    final phoneError = _validationService.validatePhoneNumber(
      _profileFormManager.phoneNumberController.value,
    );
    if (phoneError != null) {
      errors['phoneNumber'] = phoneError;
    }

    final nationalIdError = _validationService.validateNationalId(
      _profileFormManager.nationalIdController.value,
    );
    if (nationalIdError != null) {
      errors['nationalId'] = nationalIdError;
    }

    final heightError = _validationService.validateNumericField(
      _physicalFormManager.heightController.value,
      'Height',
    );
    if (heightError != null) {
      errors['height'] = heightError;
    }

    final weightError = _validationService.validateNumericField(
      _physicalFormManager.weightController.value,
      'Weight',
    );
    if (weightError != null) {
      errors['weight'] = weightError;
    }

    if (selectedBloodType == null) {
      errors['bloodType'] = 'Blood type is required';
    }

    if (selectedGender == null) {
      errors['gender'] = 'Gender is required';
    }

    if (locationLat == null || locationLong == null) {
      errors['location'] = 'Location is required';
    }

    return errors;
  }

  SignUpRequestEntity _buildSignUpRequest() {
    return SignUpRequestEntity(
      fullName: _profileFormManager.fullNameController.value,
      email: _signUpFormManager.emailController.value,
      password: _signUpFormManager.passwordController.value,
      confirmPassword: _signUpFormManager.confirmPasswordController.value,
      userType: selectedUserType,
      locationLat: locationLat!,
      locationLong: locationLong!,
      profilePhoto: profilePhoto,
      phoneNumber: _profileFormManager.phoneNumberController.value,
      nationalId: _profileFormManager.nationalIdController.value,
      dateOfBirth: _physicalFormManager.dateOfBirthController.value,
      bloodType: selectedBloodType!,
      height: _physicalFormManager.heightController.value,
      weight: _physicalFormManager.weightController.value,
      gender: selectedGender!,
    );
  }

  void clearAllForms() {
    _signUpFormManager.clearForm();
    _profileFormManager.clearForm();
    _physicalFormManager.clearForm();

    selectedUserType = 'Patient';
    selectedBloodType = null;
    selectedGender = null;
    locationLat = null;
    locationLong = null;
    profilePhoto = null;

    emit(const SignUpInitial());
  }

  @override
  Future<void> close() {
    _signUpFormManager.dispose();
    _profileFormManager.dispose();
    _physicalFormManager.dispose();
    return super.close();
  }
}
