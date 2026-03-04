# SparTrack — OJT Attendance Monitoring System

> A mobile and cross-platform application built with Flutter for **Batangas State University** student-trainees (Spartans) to digitally log, track, and report their On-the-Job Training (OJT) attendance and accomplishments.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots Overview](#screenshots-overview)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the App](#running-the-app)
- [Demo Accounts](#demo-accounts)
- [Dependencies](#dependencies)
- [Made By](#made-by)

---

## Overview

SparTrack is a Flutter-based OJT Attendance Monitoring System designed for **BatStateU student-trainees**. Gone are the days of manual logbooks and paper forms — SparTrack gives every intern a personal digital hub where they can:

- Clock in and out with a single tap
- Write daily accomplishment reports using a rich-text editor
- Track their total rendered OJT hours against the required target
- Filter and export a formatted PDF accomplishment report per week
- Manage their account settings directly from the app

The app is built around the university's identity — branded in BatStateU's signature **red** color scheme and tailored specifically for CICS (College of Informatics and Computing Sciences) interns.

---

## Features

### 1. Opening Screen
When you open SparTrack, a branded loading screen appears for a brief moment before bringing you to the login page. It gives the app a clean and welcoming first impression every time you launch it.

---

### 2. Login
To use the app, you simply enter your username and password — the same credentials tied to your university account. If you leave a field blank or type something incorrect, the app will immediately tell you what went wrong with a clear pop-up message so you know exactly what to fix. There is also a **Forgot Password** option in case you can no longer remember your password.

---

### 3. Welcome Screen (First-Time Users)
If you are logging in for the very first time, you will be greeted with a welcome screen that introduces you to SparTrack and what it can do for you. After this, you go straight to the main screen every time you log in — the welcome screen only shows once.

---

### 4. Your Personal Dashboard
Once logged in, this is your home base. Everything you need is organized here. At the top, you will always see:

**Your Live Clock**
A clock on screen that shows you the exact current time in the Philippines, updated every second. This makes sure that whenever you record your attendance, the time is always accurate — no guessing, no manual adjustments.

**Your Profile Card**
A summary of who you are displayed at the top of the screen — your photo, full name, department, course, year, major, and current deployment status. Think of it as your digital ID card, always visible.

Below your profile, you can switch between three sections using the navigation at the bottom of the screen:

---

### 5. Attendance — Clock In and Write What You Did
This is where you record your daily attendance and what you worked on.

- **Time In** — Tap the "Time In" button when you arrive at your workplace. The app will ask you to confirm first, so you do not accidentally record the wrong time. Once confirmed, the exact time is saved automatically.

- **Time Out** — Tap "Time Out" when your work day is done. Same simple confirmation step applies.

- **Write Your Daily Accomplishments** — Below the time buttons is a writing area where you can describe what you did that day. You can write in bullet points, make text bold, add numbered lists, or use checklists — similar to how you would format a document in Microsoft Word, but right on your phone. When you are done, tap **Save** and your notes are kept alongside your time record for that day.

No more writing on paper logbooks. Everything is logged in one place in seconds.

---

### 6. Accomplishment Records — View Your History and Print Reports
This section shows you a full list of every day you have attended your OJT — your time in, time out, and what you accomplished. You can scroll through all of them at any time.

- **Filter by Date** — If you only want to see records from a specific week or date range, you can set a "from" date and a "to" date, and the list will narrow down to just those entries.

- **Label Your Week** — You can add a label like "Week 1" or a specific date range to name the report before printing.

- **Print or Save as PDF** — With one tap on the Print button, SparTrack automatically creates a ready-to-submit PDF report of your accomplishments for the selected period. This report includes your complete intern information, your company and supervisor details, your daily accomplishments in a formatted table, and your total hours for that period. You can print it directly or save it to share with your coordinator — no more manually filling out paper forms every week.

---

### 7. Progress Dashboard — See How Far You Have Come
This section gives you a visual picture of where you stand in your OJT completion.

- A **circular gauge** in the center shows your completion percentage — for example, 75% means you have completed three-quarters of your required OJT hours.
- Three summary cards show you:
  - **Total Required Hours** — how many hours you need to complete in total (e.g., 600 hours)
  - **Hours Completed** — how many hours you have already rendered, automatically tallied from all your time-in and time-out records
  - **Hours Remaining** — how many more hours you still need to finish

You never have to manually count your hours. SparTrack does all the math for you the moment you log your attendance.

---

### 8. Settings Menu
Tap the menu icon at the top-left corner of the screen to open the side panel. Here you can:

- **Change your email address** — If your email changes, you can update it here. Only official BatStateU student email addresses are accepted to keep accounts secure.
- **Change your password** — You can update your password anytime by entering your current password first, then typing a new one. The app makes sure your new password meets the minimum security requirement before saving it.
- **Log out** — Safely sign out of your account. The app will ask you to confirm before logging you out so you do not do it by accident.

---

## Tech Stack

| Technology | Purpose |
|---|---|
| **Flutter** (Dart) | Cross-platform UI framework |
| **flutter_quill** | Rich-text / WYSIWYG accomplishments editor |
| **pdf + printing** | PDF generation and print/share functionality |
| **art_sweetalert** | Elegant confirmation and alert dialogs |
| **intl** | Date and time localization/formatting |
| **url_launcher** | External URL handling |
| **flutter_localizations** | Multi-locale support |
| **Poppins & NotoSans** | Custom fonts for UI and PDF output |

---

## Project Structure

```
lib/
├── main.dart                   # App entry point, theme configuration
├── common/                     # Reusable UI components
│   ├── brand_app_bar.dart      # Branded top app bar
│   ├── custom_buttons.dart     # Reusable button widgets
│   ├── custom_date_input.dart  # Date picker input field
│   ├── custom_text_field.dart  # Styled text input field
│   ├── logo_widget.dart        # SparTrack logo widget
│   ├── password_field.dart     # Password input with visibility toggle
│   ├── sweet_alert_helper.dart # SweetAlert dialog utility
│   └── wysiwyg_editor.dart     # Rich-text editor wrapper
├── data_src/
│   └── sample_data.dart        # Demo user and attendance data
├── models/
│   ├── attendance_record.dart  # Attendance record data model
│   ├── college_coordinator.dart# OJT coordinator data model
│   ├── company.dart            # Company/supervisor data model
│   └── user.dart               # User/intern data model
├── pages/
│   ├── dashboard_page.dart     # Main dashboard with tab navigation
│   ├── landing_page.dart       # First-login welcome screen
│   ├── loading_page.dart       # Animated splash/loading screen
│   └── login_page.dart         # Login screen
├── services/
│   ├── auth_service.dart       # Authentication logic
│   └── pdf_accomplishments.dart# PDF report generation service
├── utils/
│   ├── app_colors.dart         # Color palette and text styles
│   ├── date_time_utils.dart    # Philippine Standard Time utilities
│   └── time_utils.dart         # OJT hour computation utilities
└── widgets/
    ├── accomplishments_tab.dart     # Accomplishment records + PDF export
    ├── app_drawer.dart              # Side navigation drawer
    ├── attendance_tab.dart          # Time In/Out + accomplishments editor
    ├── bottom_navigation_bar.dart   # Bottom tab navigation
    ├── change_email_modal.dart      # Change email dialog
    ├── change_password_modal.dart   # Change password dialog
    ├── forgot_password_modal.dart   # Forgot password dialog
    ├── philippine_time_card.dart    # Live PST clock card
    ├── profile_card.dart            # Intern profile summary card
    └── progress_dashboard_tab.dart  # OJT hours progress visualization
```

---

## Getting Started

### Prerequisites

Make sure the following are installed on your machine:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) — version `^3.8.1` or higher
- [Dart SDK](https://dart.dev/get-dart) — included with the Flutter SDK
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/) with the Flutter extension
- An Android emulator, iOS simulator, or a physical device

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/spartrack.git
   cd spartrack
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

### Running the App

Run on a connected device or emulator:

```bash
flutter run
```

To target a specific platform:

```bash
# Android
flutter run -d android

# iOS (macOS only)
flutter run -d ios

# Windows
flutter run -d windows

# Web
flutter run -d chrome
```

To build a release APK (Android):

```bash
flutter build apk --release
```

---

## Demo Accounts

The app uses local sample data for demonstration. Use the following credentials on the Login screen:

| Username | Password     | Notes                    |
|----------|--------------|--------------------------|
| `user`   | `spartans123`| Returning user (has existing attendance records) |
| `user2`  | `password123`| New user (sees Welcome Landing Page on first login) |

---

## Dependencies

```yaml
dependencies:
  flutter_quill: ^11.4.1       # Rich-text editor
  art_sweetalert: ^0.0.5       # Alert/confirmation dialogs
  intl: ^0.20.2                # Date & time formatting
  url_launcher: ^6.2.5         # External link handling
  pdf: ^3.10.4                 # PDF document generation
  printing: ^5.12.0            # PDF preview and printing
  flutter_localizations:       # Localization support
    sdk: flutter
  cupertino_icons: ^1.0.8      # iOS-style icons
```

---

## Made By

**ALOCILLO, MELVIN DARYLL**  
BS Information Technology — Major in Service Management  
College of Informatics and Computing Sciences (CICS)  
Batangas State University — The National Engineering University

> *"Track your progress, manage your internship, and prepare for what's next — all in one place."*

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
