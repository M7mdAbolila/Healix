class ApiConstants {
  static const String baseUrl = "http://13.61.226.187:5136";
  static const String chatBaseUrl =
      "https://generativelanguage.googleapis.com/";
  static const String chatEndpoint =
      "/v1beta/models/gemini-2.0-flash:generateContent";
  static const String sendMessageEndpoint = "/api/chatbot";
  static const String getAllChatsEndpoint = "/api/chatbot";
  static const String loginEndpoint = "/api/users/login";
  static const String verifyEmailEndpoint = "/api/users/verify-email";
  static const String signUpEndpoint = "/api/users/signup";
  static const String familyGroupsEndpoint = "/api/family-groups";
  static const String addHistoryRecordEndpoint = "/api/patient-records";
  static const String getDoctorsEndpoint = "/api/users/doctors";
  static const String doctorSchedulesEndpoint = "/api/doctor-schedules";
  static const String appointmentsEndpoint = "/api/appointments";
  static const String patientSummaryEndpoint = "/api/chatbot/patient-summary";
}
