# CI/CD Documentation for Flappy Bird with PipeX

This project uses GitHub Actions for continuous integration and deployment. Below is a guide to all the workflows and how to use them.

## 🚀 Available Workflows

### 1. **CI - Build and Test** (`ci.yml`)
**Triggers:** Push or Pull Request to `main`, `master`, or `develop` branches

**What it does:**
- ✅ Runs code formatting checks
- 🔍 Analyzes code for issues
- 🧪 Runs all tests with coverage
- 📦 Builds Android APK
- 🌐 Builds Web version
- 📊 Uploads coverage to Codecov (optional)

**Artifacts:**
- Android APK (available for 7 days)
- Web build (available for 7 days)

### 2. **Release Build** (`release.yml`)
**Triggers:** Push a tag with format `v*.*.*` (e.g., `v1.0.0`)

**What it does:**
- 🎉 Creates a GitHub Release
- 📱 Builds and uploads Android APK
- 📦 Builds and uploads Android AAB (for Play Store)
- 🌐 Builds and uploads Web version as ZIP

**How to create a release:**
```bash
# Tag your commit with a version
git tag v1.0.0

# Push the tag to GitHub
git push origin v1.0.0
```

The workflow will automatically create a release with all build artifacts attached.

### 3. **Deploy to GitHub Pages** (`deploy-web.yml`)
**Triggers:** 
- Push to `main` or `master` branch
- Manual trigger via GitHub Actions UI

**What it does:**
- 🌐 Builds the web version
- 🚀 Deploys to GitHub Pages
- ✨ Makes your game playable online!

**Setup Required:**
1. Go to your repository Settings → Pages
2. Select "GitHub Actions" as the source
3. Your game will be available at: `https://[username].github.io/flappybird_with_pipex/`

### 4. **Code Quality** (`code-quality.yml`)
**Triggers:** Pull Requests to `main`, `master`, or `develop` branches

**What it does:**
- 🔍 Checks code formatting
- 📊 Runs static analysis
- 💬 Comments on PR with detailed report
- ❌ Fails if issues are found

## 📋 Setup Instructions

### Prerequisites
- Your repository must be connected to GitHub
- GitHub Actions must be enabled (enabled by default)

### Optional Configurations

#### 1. Code Coverage (Codecov)
To enable code coverage reporting:
1. Sign up at [codecov.io](https://codecov.io)
2. Add your repository
3. Add `CODECOV_TOKEN` to your repository secrets:
   - Go to Settings → Secrets and variables → Actions
   - Click "New repository secret"
   - Name: `CODECOV_TOKEN`
   - Value: Your token from Codecov

#### 2. GitHub Pages
To deploy your game as a web app:
1. Go to Settings → Pages
2. Under "Build and deployment", select:
   - Source: GitHub Actions
3. The workflow will automatically deploy on every push to main

## 🎯 Usage Examples

### Running Tests Locally
Before pushing, you can run these commands locally:

```bash
# Get dependencies
flutter pub get

# Format code
dart format .

# Analyze code
flutter analyze

# Run tests
flutter test

# Build Android APK
flutter build apk --release

# Build Web
flutter build web --release
```

### Creating a New Release

```bash
# 1. Commit your changes
git add .
git commit -m "Ready for release v1.0.0"

# 2. Create and push tag
git tag v1.0.0
git push origin main
git push origin v1.0.0

# 3. Wait for the release workflow to complete
# 4. Check the "Releases" section in your GitHub repo
```

### Checking Workflow Status
- Go to the "Actions" tab in your GitHub repository
- You'll see all workflow runs with their status
- Click on any run to see detailed logs

## 🔧 Troubleshooting

### Workflow Fails on Flutter Version
If builds fail due to Flutter version issues, update the `flutter-version` in the workflow files:
```yaml
flutter-version: '3.24.x'  # Change this to your Flutter version
```

### Android Build Issues
Make sure your `android/app/build.gradle` has proper signing configuration for release builds.

### Web Build Base URL
The web build uses `/flappybird_with_pipex/` as the base URL for GitHub Pages. If you rename your repository, update the `--base-href` in:
- `ci.yml`
- `deploy-web.yml`

```yaml
flutter build web --release --base-href=/YOUR_REPO_NAME/
```

## 📊 Workflow Status Badges

Add these badges to your main README.md to show build status:

```markdown
![CI](https://github.com/YOUR_USERNAME/flappybird_with_pipex/workflows/CI%20-%20Build%20and%20Test/badge.svg)
![Deploy](https://github.com/YOUR_USERNAME/flappybird_with_pipex/workflows/Deploy%20to%20GitHub%20Pages/badge.svg)
```

## 🎮 What's Next?

- **iOS Builds**: Requires macOS runners (paid GitHub plan) and proper code signing
- **Automated Testing**: Add more unit and widget tests
- **Performance Monitoring**: Integrate Firebase Performance or similar
- **Automated Deployment**: Deploy to Google Play Store automatically

## 📝 Notes

- APK and Web builds from CI workflow are kept for 7 days
- Release artifacts are kept permanently with the release
- All workflows use Flutter stable channel
- Java 17 is used for Android builds

---

Need help? Check the [GitHub Actions documentation](https://docs.github.com/en/actions) or open an issue!

