import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/dialogs/setup_dialog.dart';
import '../../../../core/helpers/extensions.dart';
import '../state_management/book_appointment_cubit/book_appointment_cubit.dart';
import '../state_management/book_appointment_cubit/book_appointment_state.dart';

class BookAppointmentBlocListener extends StatelessWidget {
  const BookAppointmentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookAppointmentCubit, BookAppointmentState>(
      listener: (context, state) {
        _handleStateChange(context, state);
      },
      child: const SizedBox.shrink(),
    );
  }

  void _handleStateChange(BuildContext context, BookAppointmentState state) {
    switch (state) {
      case BookAppointmentSuccess():
        _handleBookingSuccess(context, state);
        break;
      case BookAppointmentError():
        _handleBookingError(context, state);
        break;
      case BookAppointmentLoading():
        _handleBookingLoading(context);
        break;
      case BookAppointmentValidationError():
        _handleValidationError(context, state);
        break;
      default:
        break;
    }
  }

  void _handleBookingSuccess(
      BuildContext context, BookAppointmentSuccess state) {
    context.pop();
    context.pop();

    showAwesomeSnackbar(
      context,
      title: 'Booking Successful',
      message: 'Your appointment has been booked successfully!',
      isError: false,
    );
  }

  void _handleBookingError(BuildContext context, BookAppointmentError state) {
    context.pop();
    showAwesomeSnackbar(
      context,
      title: 'Booking Failed',
      message: state.errorMessage,
      isError: true,
    );
  }

  void _handleBookingLoading(BuildContext context) {
    showLoadingDialog(context);
  }

  void _handleValidationError(
      BuildContext context, BookAppointmentValidationError state) {
    final title = 'Validation Error';
    final message =
        state.fieldErrors.entries.map((e) => '${e.key}: ${e.value}').join('\n');
    showAwesomeSnackbar(
      context,
      title: title,
      message: message,
      isError: true,
    );
  }
}
