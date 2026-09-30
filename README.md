# riverpod_test

A Flutter project using **Riverpod**, **Dio**, **Freezed** and **JSON Serializable**.

## Dependencies

### Freezed + JSON serialization

Install the required dependencies:

```bash
flutter pub add freezed_annotation
flutter pub add json_annotation

flutter pub add dev:freezed
flutter pub add dev:build_runner
flutter pub add dev:json_serializable
```

Generate the Freezed and JSON serialization files:

```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

Generated files:

```text
joke.freezed.dart
joke.g.dart
```

---

### Riverpod

Install Riverpod:

```bash
flutter pub add flutter_riverpod
```

---

### Dio

Install Dio for HTTP requests:

```bash
flutter pub add dio
```

---

## Generate Freezed files

After creating or modifying a Freezed model, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

If generated files become inconsistent, clean the build first:

```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

## All dependencies

The project uses:

* **Flutter** — application framework
* **Riverpod** — state management
* **Dio** — HTTP requests
* **Freezed** — immutable data classes and code generation
* **JSON Serializable** — JSON serialization/deserialization

## Useful commands

Install/update dependencies:

```bash
flutter pub get
```

Clean the Flutter project:

```bash
flutter clean
```

Generate code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Run the application:

```bash
flutter run
```
