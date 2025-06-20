# 🏥 Healix - Patient Healthcare App

Healix is a comprehensive Flutter-based healthcare application designed to connect patients with healthcare providers, manage medical history, and provide AI-powered health insights. The app streamlines the healthcare experience with appointment booking, medical record management, and intelligent health monitoring.

## 🏗️ Architecture

The app follows **Clean Architecture** principles with a modular structure:

```
lib/
├── core/                    # Shared utilities and services
│   ├── di/                 # Dependency injection setup
│   ├── networking/         # API services and error handling
│   ├── theming/           # App theme and styling
│   ├── widgets/           # Reusable UI components
│   └── routing/           # Navigation management
├── features/              # Feature-based modules
│   ├── appointment/       # Doctor booking and scheduling
│   ├── medical_history/   # Health records management
│   ├── chat_bot/         # AI health assistant
│   ├── family_group/     # Family health management
│   ├── home/             # Dashboard and home screen
│   
└── main.dart             # Application entry point
```

### 🎯 Architecture Layers
- **Domain Layer**: Business logic, entities, and use cases
- **Data Layer**: API services, models, and repositories
- **Presentation Layer**: UI components, state management (BLoC), and form management


## ✨ Features

### 🔐 Authentication & Onboarding
- Secure user registration and login
- Email verification system
- Comprehensive onboarding experience
- Password recovery functionality

### 🩺 Doctor & Appointment Management
- **Doctor Discovery**: Browse doctors by specialty with detailed profiles
- **Smart Booking**: View real-time doctor schedules and available time slots
- **Appointment Management**: Book, view, and manage appointments
- **Doctor Profiles**: Access doctor credentials, experience, clinic information, and fees
- **Location Services**: Find nearby clinics and healthcare providers

### 📱 AI-Powered Health Assistant
- **Symptom Analysis**: Describe symptoms and receive AI-generated health insights
- **Chat Bot**: Interactive health assistant for medical queries
- **Health Risk Assessment**: Early detection recommendations

### 📋 Medical History Management
- **Comprehensive Records**: Track medical visits, lab tests, surgeries, and chronic diseases
- **Health Logging**: Monitor allergies, medications, and health metrics
- **Patient Summary**: AI-generated health summaries and risk assessments
- **Family Health Tracking**: Manage family medical history and share health codes

### 🏠 Home Dashboard
- **Featured Doctors**: Quick access to recommended healthcare providers
- **Recent Activity**: View upcoming appointments and recent medical records
- **Health Insights**: Personalized health recommendations

### 👥 Family Health Management
- **Family Groups**: Create and manage family health groups
- **Shared Health Data**: Monitor family health patterns
- **Health Code Sharing**: Easy family member addition via unique codes



**Made with ❤️ for better healthcare accessibility**
