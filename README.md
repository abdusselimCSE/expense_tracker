# Expense Tracker

A Flutter expense-tracking app in development, with a Figma-based interface, English and Bangla localization, and a reusable expense-entry form.
The current milestone focuses on mobile UI, navigation, and form interactions.

**Status:** Active development · UI prototype · No backend required to run

## Project highlights

- **Reusable UI:** Shared header decoration, centralized theme settings, custom typography, and a configurable input widget with labels.
- **Localization:** English and Bangla ARB resources, generated localization classes, and localized date display.
- **Expense entry:** Name and amount inputs, a Clear action, and a calendar picker that displays the selected date.
- **Dashboard:** Balance, income, and expense presentation using sample data and locale-aware number formatting.
- **Navigation:** Animated splash transition, a four-tab shell using `IndexedStack`, and navigation from the floating action button to Add Expense.
- **Visual implementation:** SVG assets, custom clipping, decorative shapes, rounded form surfaces, and a dashed invoice attachment placeholder.

## Explore the implementation

| Area | What to review | Source |
| --- | --- | --- |
| Expense form | Reusable inputs, controller lifecycle, date selection, and keyboard-aware scrolling | [add_expense_screen.dart](lib/screens/add_expense_screen.dart) |
| App theme | Inter font family, shared input styling, buttons, and localization configuration | [main.dart](lib/main.dart) |
| Shared decoration | Reused curved header and decorative circles | [app_header_background.dart](lib/widgets/app_header_background.dart) |
| Dashboard | Balance card and localized number display | [home_screen.dart](lib/screens/home_screen.dart) |
| Navigation | Tab switching, retained tab state, and Add Expense navigation | [screen_layout.dart](lib/utils/screen_layout.dart) |
| Localization | English and Bangla translation resources | [lib/l10n](lib/l10n) |
| Tests | Startup, navigation, Bangla labels, and splash cleanup checks | [widget_test.dart](test/widget_test.dart) |

## Feature status

| Feature | Status |
| --- | --- |
| Splash animation | Implemented |
| Home dashboard layout | Implemented with sample values |
| Bottom navigation | Implemented; Chart, Wallet, and User content remains placeholder UI |
| Add Expense form layout | Implemented |
| Calendar selection | Implemented; supports dates from 2000 through today |
| Invoice attachment | Visual placeholder; file selection is planned |
| Login and registration | UI layouts only; authentication is planned |
| English and Bangla | Partially implemented; some hints and actions still need translation |
| Amount formatting | Dashboard display implemented; amount-input formatting is pending |
| Save, edit, and delete expenses | Planned |
| Local persistence and offline synchronization | Planned |
| REST API integration | Planned |
| Crashlytics and Analytics | Planned |
| Business-logic unit tests and CI | Planned |

## Technology

| Tool | Purpose |
| --- | --- |
| Flutter and Dart | Application UI and interaction logic |
| Material widgets | Navigation, forms, buttons, and calendar dialogs |
| `flutter_localizations` and `intl` | Localization and date/number formatting |
| `flutter_svg` | SVG illustrations and icons |
| `dotted_border` | Invoice attachment outline |
| `flutter_test` and `flutter_lints` | Widget checks and static analysis |

The project currently uses `StatefulWidget`, `setState`, and text controllers for local UI state.
Clean Architecture and Domain-Driven Design are planned as the data and business layers are introduced.

## Run locally

### Requirements

- A Flutter SDK containing Dart compatible with `^3.12.2`, as declared in [pubspec.yaml](pubspec.yaml).
- Android Studio and an emulator or physical device for Android.
- macOS and Xcode for the iOS simulator or an iOS device.

Platform folders are also present for web and desktop.
The current design work focuses on mobile; cross-platform visual verification remains part of the roadmap.

### Setup

Clone this repository using its GitHub **Code** button, then open the project directory in a terminal.

```bash
flutter doctor
flutter pub get
flutter gen-l10n
flutter run
```

No Firebase project, API credentials, or database configuration is required for the current UI prototype.

### Current preview flow

The checked-in splash route currently opens `AddExpenseScreen` directly for UI development.
To preview the full dashboard flow, change the splash destination to `ScreenLayout` in [splash_screen.dart](lib/screens/splash_screen.dart), import `utils/screen_layout.dart`, and hot restart.
The Home floating action button pushes Add Expense onto the navigation stack.

## Localization

Translations live in:

- [app_en.arb](lib/l10n/app_en.arb): English.
- [app_bn.arb](lib/l10n/app_bn.arb): Bangla.

The locale is currently set explicitly in `MaterialApp` for development.
Use `Locale('en')` or `Locale('bn')` to preview each language, or remove the override to follow the device locale.

After editing translation resources, regenerate the Dart localization files:

```bash
flutter gen-l10n
```

The current UI associates English with USD and Bangla with BDT for presentation.
This changes symbols and formatting only; it does not perform exchange-rate conversion.
Persistent wallet currencies and transaction amounts remain future work.

## Project structure

```text
lib/
├── core/
│   ├── constants/       # Shared colors and asset references
│   └── navigation/      # Custom route transition
├── l10n/                # ARB resources and generated localization code
├── screens/             # Dashboard, expense form, auth layouts, and tab screens
├── utils/               # Tab configuration and navigation shell
├── widgets/             # Shared decoration and social login presentation
└── main.dart            # App entry point and theme
assets/
├── fonts/
├── icons/
└── images/
test/
└── widget_test.dart
```

## Validation

```bash
flutter analyze
flutter test
```

The existing widget tests cover startup, bottom navigation, Bangla dashboard labels, and disposal of the splash timer.
They are a starting point for automated coverage, and have not been reverified for this documentation update.
The startup test expects the Home screen, while the current preview route opens Add Expense; that route/test mismatch must be resolved before expecting a green suite.
There are no business-logic unit tests or automated visual comparisons yet.

## Next milestones

1. Complete localization, align the preview route with startup tests, and verify layouts against the reference at matching device sizes and focus states.
2. Add expense validation, a Save action, and domain models for expenses, money, categories, and wallets.
3. Introduce presentation, domain, and data boundaries with repository interfaces.
4. Implement local storage so expenses survive app restarts and remain available offline.
5. Connect invoice selection and persist attachments with their expenses.
6. Add authentication, secure session handling, REST integration, and synchronization with retry and conflict handling.
7. Integrate Crashlytics and privacy-conscious Analytics events.
8. Expand unit, widget, and integration coverage and automate checks in CI.

## Design and attribution

The UI is being implemented from a Figma reference and refined through device previews.
Visual fidelity is still under review across screen sizes, languages, and accessibility settings.
The repository includes bundled illustrations, icons, and fonts; their original sources and applicable licenses should be documented before redistribution.
