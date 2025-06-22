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
![image](https://github.com/user-attachments/assets/28e2fe5e-23a0-4c08-9be5-57f720ebfdc0) ![image](https://github.com/user-attachments/assets/ac4df470-904b-4d0f-a7cd-028f96006c77)

### 🩺 Doctor & Appointment Management
- **Doctor Discovery**: Browse doctors by specialty with detailed profiles
- **Smart Booking**: View real-time doctor schedules and available time slots
- **Appointment Management**: Book, view, and manage appointments
- **Doctor Profiles**: Access doctor credentials, experience, clinic information, and fees.
![image](https://github.com/user-attachments/assets/1f59f5bf-6c4d-4185-8c4f-4cbbe604b4e0)



### 📱 AI-Powered Health Assistant
- **Symptom Analysis**: Describe symptoms and receive AI-generated health insights
- **Chat Bot**: Interactive health assistant for medical queries
  
![image](https://github.com/user-attachments/assets/364c8a6c-341b-4b31-8f13-bb45e712998f)

https://github.com/user-attachments/assets/16d13afa-a60d-46c8-b0dd-27bffa1737d8
https://github.com/user-attachments/assets/ed67855a-c81d-4343-ab6e-ccdb76cda15c


### 📋 Medical History Management
- **Comprehensive Records**: Track medical visits, lab tests, surgeries, and chronic diseases
- **Health Logging**: Monitor allergies, medications, and health metrics
- **Patient Summary**: AI-generated health summaries and risk assessments

![image](https://github.com/user-attachments/assets/5347c95c-76bd-413d-b398-e135d3ea34ba)


### 🏠 Home Dashboard
- **Featured Doctors**: Quick access to recommended healthcare providers
- **Recent Activity**: View upcoming appointments and recent medical records


![image](https://github.com/user-attachments/assets/fb5b67b3-d129-441f-9fa3-1cab88238c68)  ![image](https://github.com/user-attachments/assets/97e1a85b-5881-40f9-9186-1ac688e3e085)



### 👥 Family Health Management
- **Family Groups**: Create and manage family health groups
- **Shared Health Data**: Monitor family health patterns
- **Health Code Sharing**: Easy family member addition via unique codes

![image](https://github.com/user-attachments/assets/7d438052-8b5a-4b94-bb68-831270cdca87)


**Made with ❤️ for better healthcare accessibility**
