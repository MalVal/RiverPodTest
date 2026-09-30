# riverpod_test

A Flutter project using **Riverpod**, **Dio**, **Freezed** and **JSON Serializable**.

## Dependencies

### Freezed + JSON Serialization

Install the required dependencies:

```bash
flutter pub add freezed_annotation
flutter pub add json_annotation

flutter pub add dev:freezed
flutter pub add dev:build_runner
flutter pub add dev:json_serializable
```

Generate the Freezed and JSON Serializable files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

If generated files become inconsistent, clean them first:

```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

Generated files:

```text
joke.freezed.dart
joke.g.dart
```

### Riverpod

Install Riverpod:

```bash
flutter pub add flutter_riverpod
```

Riverpod is used for:

* State management
* Dependency injection
* Providers
* Managing asynchronous data

### Dio

Install Dio for HTTP requests:

```bash
flutter pub add dio
```

Dio is used to communicate with external APIs.

---

## All Dependencies

The project uses:

* **Flutter** — application framework
* **Riverpod** — state management and dependency injection
* **Dio** — HTTP requests and API communication
* **Freezed** — immutable data classes and code generation
* **JSON Serializable** — JSON serialization and deserialization

---

## Useful Commands

### Install dependencies

```bash
flutter pub get
```

### Add a dependency

```bash
flutter pub add package_name
```

### Add a development dependency

```bash
flutter pub add dev:package_name
```

### Clean Flutter

```bash
flutter clean
```

### Clean generated files

```bash
dart run build_runner clean
```

### Generate Freezed / JSON files

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Run the application

```bash
flutter run
```

---

# Architecture

The project follows a **feature-first architecture**.

Each feature contains everything related to that functionality.

Example:

```text
lib/
├── main.dart
│
├── app/
│   ├── app.dart
│   ├── router/
│   └── theme/
│
├── core/
│   ├── network/
│   ├── errors/
│   ├── utils/
│   └── constants/
│
└── features/
    └── jokes/
        ├── data/
        │   ├── dto/
        │   ├── datasources/
        │   └── repositories/
        │
        ├── domain/
        │   ├── entities/
        │   ├── repositories/
        │   └── usecases/
        │
        ├── presentation/
        │   ├── providers/
        │   ├── pages/
        │   └── widgets/
        │
        └── mappers/
```

## `main.dart`

The entry point of the application.

It is responsible for starting Flutter and configuring the root of the application, such as the `ProviderScope`.

---

## `app/`

Contains application-wide configuration.

### `app.dart`

Main application configuration, such as `MaterialApp`.

### `router/`

Application navigation and routes.

### `theme/`

Global application theme:

* Colors
* Text styles
* Theme configuration
* Other visual constants

---

## `core/`

Contains code shared by multiple features.

It should not contain code specific to one feature.

### `network/`

Shared network configuration.

For example:

* Dio configuration
* API client
* Interceptors
* Authentication headers

### `errors/`

Common errors and failures used throughout the application.

### `utils/`

Generic utilities and extensions shared by multiple features.

### `constants/`

Global constants such as API URLs or application-wide values.

---

# Features

Features contain the actual functionality of the application.

For example:

```text
features/
├── jokes/
├── auth/
├── users/
└── settings/
```

Each feature is independent and can contain its own `data`, `domain` and `presentation` layers.

---

## `data/`

The data layer is responsible for retrieving and storing data.

```text
data/
├── dto/
├── datasources/
└── repositories/
```

### `dto/`

DTO stands for **Data Transfer Object**.

DTOs represent data coming from or going to external sources, such as an API.

Freezed and JSON Serializable are commonly used here.

Example:

```text
JokeDto
```

The DTO generally represents the structure of the API response.

### `datasources/`

Responsible for communicating with external or local data sources.

Examples:

```text
Remote API
Local database
Local storage
```

For example:

```text
JokeRemoteDatasource
```

can use Dio to communicate with the jokes API.

### `repositories/`

Contains the concrete implementations of repository interfaces defined in the domain layer.

Example:

```text
JokeRepositoryImpl
```

A repository implementation can use a datasource to retrieve data.

---

## `domain/`

The domain layer contains the application's business logic.

It should be independent of Flutter, Dio, HTTP and other external technologies whenever possible.

```text
domain/
├── entities/
├── repositories/
└── usecases/
```

### `entities/`

Entities represent the application's business objects.

Examples:

```text
Joke
User
Product
Order
```

An entity represents what the application needs, rather than how an external API represents the data.

### `repositories/`

Contains repository **interfaces**.

For example:

```text
JokeRepository
```

The interface defines what operations are available without specifying how they are implemented.

The domain therefore does not need to know whether the data comes from:

* An API
* A database
* Local storage
* A mock

### `usecases/`

Contains specific actions that the application can perform.

Examples:

```text
GetRandomJoke
GetUserProfile
Login
Logout
CreateOrder
```

A use case generally represents one meaningful operation of the application.

---

## `presentation/`

Contains everything related to the user interface.

```text
presentation/
├── providers/
├── pages/
└── widgets/
```

### `providers/`

Contains Riverpod providers.

Providers can handle:

* State
* Async data
* Dependency injection
* Connecting the UI to the domain layer

### `pages/`

Contains application screens/pages.

Examples:

```text
JokePage
LoginPage
HomePage
ProfilePage
```

### `widgets/`

Contains reusable UI components.

Examples:

```text
JokeCard
JokeButton
UserAvatar
```

---

## `mappers/`

Mappers convert objects between different layers.

For example:

```text
JokeDto
   ↓
Joke
```

The DTO represents the external API structure, while the entity represents the application's domain model.

Mappers are useful when the API structure and the application's model are different.

---

# Architecture Flow

A typical request follows this flow:

```text
Presentation
     │
     ▼
  Provider
     │
     ▼
  Use Case
     │
     ▼
Repository Interface
     │
     ▼
Repository Implementation
     │
     ▼
  Datasource
     │
     ▼
    Dio
     │
     ▼
    API
```

The response follows the opposite direction:

```text
API
 ↓
DTO
 ↓
Mapper
 ↓
Entity
 ↓
Use Case
 ↓
Provider
 ↓
Page
 ↓
Widget
```

The main goal of this architecture is to **separate responsibilities** and reduce dependencies between layers.

Not every project needs every folder. For a small application, some layers such as `usecases`, `mappers` or separate `datasources` can be unnecessary. They should be introduced when they provide a real benefit.
