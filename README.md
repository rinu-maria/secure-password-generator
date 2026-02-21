# Secure Password Generator (Flutter)

A cross-platform Flutter application that generates strong, secure, and memorable passwords from a user-provided base word. The app uses intelligent character transformation techniques and customizable length to create passwords that are both secure and easy to remember.

---

## Overview

This application helps users generate secure passwords by transforming a familiar base word into a complex password using character substitutions, symbols, numbers, and capitalization. The generated password maintains recognizability while significantly improving security.

This project demonstrates Flutter UI development, secure password generation logic, and practical cybersecurity concepts.

---

## Features

- Generate secure passwords from a user-defined base word
- Leetspeak character transformation (example: a → @, e → 3, i → !, o → 0)
- Custom password length selection
- Ensures strong password structure
- Copy password to clipboard
- Reset input and output instantly
- Clean and modern Material 3 user interface
- Cross-platform support (Windows, Web, Android, iOS)

---

## How It Works

The password generation process includes:

1. Takes a base word from the user
2. Applies character substitutions using secure transformation rules
3. Adds uppercase letters, symbols, and numbers
4. Enforces the exact password length specified by the user
5. Produces a secure yet recognizable password

---

## Example

Input:

exampleword


Generated Output:

Ex@mplew0rd#82

---

## Technologies Used

- Flutter
- Dart
- Material 3 UI
- Clipboard API

---

## Project Structure

```
secure-password-generator/
│
├── lib/
│   └── main.dart        # Main application logic
│
├── android/             # Android platform files
├── ios/                 # iOS platform files
├── web/                 # Web platform files
├── windows/             # Windows platform files
├── linux/               # Linux platform files
├── macos/               # macOS platform files
│
├── pubspec.yaml         # Project dependencies and configuration
└── README.md            # Project documentation
```

## How to Run the Project

### Prerequisites

- Flutter SDK installed
- Dart SDK installed
- VS Code or Android Studio

### Steps
flutter pub get
flutter run
---

## Use Cases

- Secure password creation
- Cybersecurity learning and practice
- Flutter development practice
- Portfolio demonstration project

---

## Future Improvements

- Password strength indicator
- Dark mode support
- Export password feature
- Secure password storage (encrypted)
- Multiple password generation

---

## License

This project is intended for educational and portfolio purposes.
