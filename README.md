# Flutter Homeschool Planner

A comprehensive Flutter mobile application for managing homeschool planning, student tracking, curriculum management, and progress monitoring.

## Features

- **Student Management**: Add and manage student profiles with personal information
- **Curriculum Planning**: Organize subjects and learning materials
- **Assignment Tracking**: Create, assign, and track homework and projects
- **Schedule Management**: Plan daily, weekly, and monthly schedules
- **Progress Monitoring**: Track student performance and learning analytics
- **Dashboard Overview**: Quick access to important information and upcoming events

## Project Structure

```
lib/
├── main.dart                   # App entry point
├── core/                       # Core app functionality
│   ├── theme/                  # App theming
│   └── router/                 # Navigation and routing
├── features/                   # Feature-based modules
│   ├── dashboard/              # Main dashboard
│   ├── students/               # Student management
│   ├── curriculum/             # Curriculum and subjects
│   ├── assignments/            # Assignment tracking
│   ├── schedule/               # Schedule management
│   └── progress/               # Progress analytics
└── shared/                     # Shared components
    ├── models/                 # Data models
    ├── widgets/                # Reusable UI components
    └── services/               # Business logic services
```

## Getting Started

### Prerequisites

- Flutter 3.10.0 or higher
- Dart 3.0.0 or higher
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Install Flutter**: Follow the [official Flutter installation guide](https://docs.flutter.dev/get-started/install)

2. **Clone the repository**:
   ```bash
   git clone https://github.com/jennduke/Homeschool-planner.git
   cd Homeschool-planner
   ```

3. **Install dependencies**:
   ```bash
   flutter pub get
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

### Development Setup

For development, you may want to:

1. **Enable hot reload**: Available by default when running `flutter run`
2. **Run tests**: `flutter test`
3. **Format code**: `flutter format .`
4. **Analyze code**: `flutter analyze`

## Dependencies

Key packages used in this project:

- **flutter_riverpod**: State management
- **go_router**: Navigation and routing
- **sqflite**: Local database storage
- **shared_preferences**: Simple key-value storage
- **table_calendar**: Calendar widget for scheduling
- **intl**: Internationalization and date formatting

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, please open an issue in the GitHub repository or contact the development team.

---

*Happy Homeschooling! 📚*