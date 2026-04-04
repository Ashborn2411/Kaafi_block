# UI Components Module

This module contains all the reusable UI components and widgets extracted from the main application modules.

## Structure

```
ui_components/
├── auth/                 # Authentication related widgets
│   ├── login_form.dart
│   ├── forget_password.dart
│   ├── login_button.dart
│   ├── or_widget.dart
│   ├── to_register_screen.dart
│   ├── forgot_password_form.dart
│   └── send_button.dart
├── task/                 # Task management widgets
│   ├── rounded_button.dart
│   ├── task_container.dart
│   ├── status_box.dart
│   └── subtask_box.dart
├── common/               # Shared/common widgets
│   ├── custom_shimmer.dart
│   ├── long_press_fab.dart
│   ├── custom_animation_screen1.dart
│   └── controllers/
│       └── long_press_fab_controller.dart
├── home/                 # Home screen widgets
│   ├── priority_box.dart
│   ├── task_box.dart
│   ├── notice_box.dart
│   ├── title_and_text_button.dart
│   └── custom_slider.dart
├── attendance/           # Attendance related widgets
│   ├── attendance_card.dart
│   └── attendance_card_date.dart
├── profile/              # Profile related widgets
│   └── signout_button.dart
├── admin/                # Admin panel widgets
│   └── admin_home_button.dart
├── onboarding/           # Onboarding widgets
│   └── onboarding_page.dart
├── styles/               # Text styles and themes
│   └── text_styles.dart
└── ui_components.dart    # Main export file
```

## Usage

Import the components you need:

```dart
import 'package:firstapp/core/core/modules/ui/ui_components/ui_components.dart';
```

Or import specific components:

```dart
import 'package:firstapp/core/core/modules/ui/ui_components/auth/login_form.dart';
import 'package:firstapp/core/core/modules/ui/ui_components/task/task_container.dart';
```

This module also exposes legacy reusable UI widgets from `lib/common/*` under the same central entrypoint.

## Text Styles

Common text styles are available in `styles/text_styles.dart`:

- `AppTextStyles.labelStyle`
- `AppTextStyles.buttonText`
- `AppTextStyles.titleText`
- `AppTextStyles.subtitleText`
- `AppTextStyles.bodyText`
- etc.

## Migration Notes

- All custom widgets have been moved from their original module locations to this centralized module
- Import paths in consuming files have been updated
- Full screen components (like `Reviewingtask`, `CompletedTasks`) remain in their respective modules as they are not reusable widgets
- Controllers that belong to specific widgets have been moved alongside them