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

## 📸 Screenshots

| Desktop View                                   | Mobile View                                  |
| ---------------------------------------------- | -------------------------------------------- |
|  <img width="721" height="394" alt="Screenshot 2025-08-14 at 4 30 16 PM" src="https://github.com/user-attachments/assets/b9e5deb7-af35-4dc2-80ac-c4042f56e70e" />  | <img width="325" height="705" alt="Screenshot 2025-08-14 at 4 30 37 PM" src="https://github.com/user-attachments/assets/1e75b9f6-9906-4b11-81e8-deec4e1a30bd" />
 

---

# Lucas Demo Project

A Flutter web project deployed using **GitHub Pages**.

## 🚀 Live Demo
[View Project Here](https://androidsignal.github.io/lucas_demo_project/)

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📬 Contact

For questions, feedback, or collaboration:
**Email:** [vithaniravi.vr@gmail.com](mailto:vithaniravi.vr@gmail.com)
**Portfolio:** [https://dashstack.notion.site/Ravi-Vithani-e65c362e335d45ef993225687e4aacb8](https://dashstack.notion.site/Ravi-Vithani-e65c362e335d45ef993225687e4aacb8)
