# 🐦 Flappy Bird with PipeX

A modern implementation of Flappy Bird built with Flutter and PipeX state management, following the MVC architecture pattern.

[![Deploy to GitHub Pages](https://github.com/navaneethkrishnaindeed/flappybird_with_pipex/actions/workflows/deploy.yml/badge.svg)](https://github.com/navaneethkrishnaindeed/flappybird_with_pipex/actions/workflows/deploy.yml)

## 🎮 Play Online

**🕹️ Live Demo:** [https://pipex.navaneethk.dev/projects/flappy/](https://pipex.navaneethk.dev/projects/flappy/)

> Part of the [PipeX Projects](https://pipex.navaneethk.dev/projects/) collection

## ✨ Features

- 🎯 Classic Flappy Bird gameplay
- 🏗️ Built with Flutter for cross-platform support
- 🔄 PipeX state management for reactive UI
- 📱 Responsive design for all screen sizes
- 💾 High score persistence with SharedPreferences
- 🎨 Clean MVC architecture
- ✅ Automated CI/CD with GitHub Actions

## 🚀 Quick Start

### Prerequisites

- Flutter SDK (3.6.0 or higher)
- Dart SDK (comes with Flutter)
- Android Studio / Xcode (for mobile builds)
- Any code editor (VS Code, Cursor, Android Studio, IntelliJ IDEA)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/navaneethkrishnaindeed/flappybird_with_pipex.git
   cd flappybird_with_pipex
   ```

2. **Get dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # Run on connected device or emulator
   flutter run
   
   # Run on web
   flutter run -d chrome
   
   # Run on Windows
   flutter run -d windows
   ```

### Building for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle (for Play Store)
flutter build appbundle --release

# Web
flutter build web --release

# Windows
flutter build windows --release

# macOS
flutter build macos --release

# Linux
flutter build linux --release
```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── controllers/
│   └── game_hub.dart        # Game state management with PipeX
├── models/
│   ├── bird_model.dart      # Bird entity model
│   └── game_state.dart      # Game state model
├── views/
│   ├── game_view.dart       # Main game view
│   └── widgets/             # Reusable game widgets
└── utils/                   # Utility functions
```

## 🏗️ Architecture

This project follows the **MVC (Model-View-Controller)** pattern with **PipeX** for state management:

- **Models** (`models/`): Define the data structures (Bird, GameState)
- **Views** (`views/`): Handle UI rendering and user interaction
- **Controllers** (`controllers/`): Manage game logic and state with PipeX

### PipeX State Management

PipeX provides a reactive state management solution:
- Centralized state in `GameHub`
- Reactive UI updates
- Clean separation of concerns
- Easy testing and debugging

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# View coverage report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 🔄 CI/CD

This project uses GitHub Actions for automated deployment:

- **GitHub Pages**: Automatically deploys the web version to [pipex.navaneethk.dev/projects/flappy/](https://pipex.navaneethk.dev/projects/flappy/) on every push to `main`

The workflow builds the Flutter web app and deploys it using GitHub Pages with a custom domain.

## 📦 Dependencies

| Package | Purpose |
|---------|---------|
| `flutter` | Cross-platform UI framework |
| `pipe_x` | State management solution |
| `shared_preferences` | Local data persistence |
| `flutter_test` | Testing framework |
| `flutter_lints` | Code quality and linting |

## 🎯 How to Play

1. Tap anywhere on the screen to make the bird jump
2. Avoid hitting the pipes
3. Try to get the highest score possible!
4. Score is saved locally

## 🛠️ Development

### Code Formatting

```bash
# Format all Dart files
dart format .

# Check formatting without changing files
dart format --output=none --set-exit-if-changed .
```

### Code Analysis

```bash
# Analyze code for issues
flutter analyze
```

### Hot Reload

While running the app, press:
- `r` to hot reload
- `R` to hot restart
- `q` to quit

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please ensure:
- Code is properly formatted (`dart format .`)
- All tests pass (`flutter test`)
- No analyzer warnings (`flutter analyze`)

## 📝 License

This project is open source and available under the MIT License.

## 🙏 Acknowledgments

- Original Flappy Bird game by Dong Nguyen
- Flutter team for the amazing framework
- PipeX team for the state management solution

## 📧 Contact

**Navaneeth K**
- 🌐 Portfolio: [navaneethk.dev](https://navaneethk.dev)
- 📄 Resume: [resume.navaneethk.dev](https://resume.navaneethk.dev)
- 🎮 Projects: [pipex.navaneethk.dev](https://pipex.navaneethk.dev)
- 💻 GitHub: [@navaneethkrishnaindeed](https://github.com/navaneethkrishnaindeed)

For questions or feedback, please open an issue on GitHub.

---

**Made with ❤️ using Flutter and PipeX**

