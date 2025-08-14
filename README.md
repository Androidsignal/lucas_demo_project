# Xpert Funding - Account Screen (Flutter Web)

This repository contains the implementation of the **Account Screen** from the [Xpert Funding Test Figma Design](https://www.figma.com/design/HHrnaabkR4OIYzBV8BArOk/Xpert-Funding-Test?node-id=0-1&p=f&t=yQsYqfGOG7tGrRfe-0). The screen is part of a larger web application and follows a **component-based architecture** for easy reusability.

---

## 📌 Features

* **Responsive UI** – Adapts to various window sizes for desktop, tablet, and mobile devices.
* **Service Layer Simulation** – Mimics remote API calls using `Future`-based dummy JSON data for accounts.
* **Reusable Components** – Widgets built for reuse across the application.
* **Pixel-Perfect Design** – Matches the Figma file exactly, including typography, spacing, and colors.
* **Clean Code Structure** – Modular and maintainable Flutter code.

---

## 🛠️ Tech Stack

* Flutter Web (Latest Stable)
* Dart
* Responsive Design (`LayoutBuilder`, `MediaQuery`)
* Service Layer Pattern for data handling
* Custom Widgets for modular design

---

## 📂 Project Structure

```
lib/
 ├── constants/       # Application-wide constant values
 ├── models/          # Data model classes (Account, etc.)
 ├── services/        # Dummy API service returning Future-based mock data
 ├── themes/          # App theme and styling definitions
 ├── ui/              # UI components and reusable widgets
 ├── utils/           # Utility and helper functions
 └── main.dart        # App entry point
```

---

## 🔄 Data Source

The dummy service returns account data in the following structure:

```dart
String? id;
DateTime? createdAt;
double? balance;
double? equity;
String? accountName;
int? currentPhase; // 0 = funded, 1 = evaluation1, 2 = evaluation2 ...
int? numPhases;    // Number of evaluation phases
double? size;
bool? active;
bool? isProAccount;
// If an account is in the evaluation stage, then it's 'on challenge'
```

The service simulates API calls by returning:

```dart
Future<List<Account>> getAccounts();
```

---

## 🚀 Getting Started

### Prerequisites

* Flutter SDK (latest stable)
* Dart SDK
* Modern browser (Chrome recommended)

### Installation

```bash
# Clone the repository
git clone https://github.com/<your-username>/<repo-name>.git

# Navigate to the project folder
cd <repo-name>

# Install dependencies
flutter pub get

# Run the web app
flutter run -d chrome
```

---

## 📸 Screenshots

| Desktop View                                   | Mobile View                                  |
| ---------------------------------------------- | -------------------------------------------- |
| ![Desktop Screenshot](screenshots/desktop.png) | ![Mobile Screenshot](screenshots/mobile.png) |

---

## 🌐 Live Demo

A live hosted version can be accessed here: **[Demo Link](https://<your-demo-url>)**

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📬 Contact

For questions, feedback, or collaboration:
**Email:** [vithaniravi.vr@gmail.com](mailto:vithaniravi.vr@gmail.com)
**Portfolio:** [https://dashstack.notion.site/Ravi-Vithani-e65c362e335d45ef993225687e4aacb8](https://dashstack.notion.site/Ravi-Vithani-e65c362e335d45ef993225687e4aacb8)
