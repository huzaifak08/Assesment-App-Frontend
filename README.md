# Assessment App

A cross-platform Flutter application with a Node.js (TypeScript) backend for managing users, displaying weather and quotes, and integrating Google Gemini AI.

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Folder Structure](#folder-structure)
- [APIs Used](#apis-used)
- [Packages Used](#packages-used)

---

## 📖 Overview

**Assessment App** is a full-stack project developed as part of the MIM Studio interview process. It includes a Flutter frontend and a Node.js backend built with TypeScript and PostgreSQL. The app enables user authentication, displays dynamic content from external APIs, and demonstrates AI capabilities via Google Gemini.

---

## 🚀 Features

### Frontend (Flutter)

- Login and Signup screens with validation
- Encrypted Passwords.
- Token-based authentication and secure storage
- Fetch and display:
  - Weather info (by city)
  - Motivational quote
  - All registered users in tabular view
- AI chat using Google Gemini
- Clean, responsive UI
- Error handling and loading indicators

### Backend (Node.js + TypeScript)

- REST API using Express
- PostgreSQL database integration
- JWT authentication (`/signup`, `/login`)
- Secured routes for:
  - `/weather?city=YourCity`
  - `/quote`
  - `/gemini` (text generation)
- API integrations for weather, quotes, and Gemini AI

---

## 🛠️ Tech Stack

### Frontend

- Flutter
- Dart
- Provider (state management)

### Backend

- Node.js with TypeScript
- Express.js
- PostgreSQL
- JWT for authentication

---

## 📁 Folder Structure (Frontend)

lib/
├── clients/
├── components/
│ ├── custom_button.dart
│ └── custom_text_field.dart
├── helpers/
│ ├── colors.dart
│ ├── constants.dart
│ ├── endpoints.dart
│ └── sp_helper.dart
├── models/
│ ├── quote.dart
│ └── user.dart
├── providers/
│ ├── auth_provider/
│ ├── quote_provider/
│ ├── user_provider/
│ └── app_provider_container.dart
├── services/
│ ├── auth_service.dart
│ ├── quote_service.dart
│ └── user_service.dart
├── views/
└── main.dart

---

## 🔌 APIs Used

- [OpenWeatherMap API](https://openweathermap.org/api) – Weather information
- [Quotable API](https://github.com/lukePeavey/quotable) – Motivational quotes
- [Google Gemini API](https://ai.google.dev/) – Text generation
- Custom backend endpoints:
  - `/signup`, `/login`
  - `/weather?city=`
  - `/quote`
  - `/gemini`

---

## 📦 Packages Used (Flutter)

- [cupertino_icons](https://pub.dev/packages/cupertino_icons): iOS style icons
- [dash_chat_2](https://pub.dev/packages/dash_chat_2): Chat UI for Flutter
- [dio](https://pub.dev/packages/dio): Powerful HTTP client
- [flutter](https://flutter.dev/): Flutter SDK
- [flutter_gemini](https://pub.dev/packages/flutter_gemini): Google Gemini AI integration
- [flutter_riverpod](https://pub.dev/packages/flutter_riverpod): State management
- [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage): Secure key-value storage
- [image_picker](https://pub.dev/packages/image_picker): Image selection from gallery/camera
- [intl](https://pub.dev/packages/intl): Internationalization and localization
- [riverpod_annotation](https://pub.dev/packages/riverpod_annotation): Riverpod code generation
- [shimmer](https://pub.dev/packages/shimmer): Loading shimmer effect
- [talker_dio_logger](https://pub.dev/packages/talker_dio_logger): Dio logging for debugging
- [talker_flutter](https://pub.dev/packages/talker_flutter): Logging and error tracking
- [weather](https://pub.dev/packages/weather): Weather API client

---
