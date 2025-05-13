# Reddit Clone

<div align="center">
  <img src="assets/icon/icon.png" alt="Reddit Clone Logo" width="200"/>
  <h3>A full-featured Reddit clone built with Flutter and Firebase</h3>
</div>

# Reddit Clone Architecture

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase">
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
</div>

<p align="center">This architecture diagram illustrates the layered design of our Reddit clone, showing the separation of concerns and component interactions.</p>



<div align="center">
  <details>
    <summary><b>View Layer Legend</b></summary>
    <table>
      <tr>
        <td>🟦 UI Components</td>
        <td>🟩 Business Logic</td>
        <td>🟧 Data Layer</td>
        <td>🟪 Firebase Services</td>
      </tr>
    </table>
  </details>
</div>

## ✨ Key Architecture Features

- 📱 **Cross-Platform Support**: Runs on Android, iOS, Web, macOS, Linux, and Windows
- 🔄 **State Management**: Riverpod for reactive state management 
- 🔌 **Repository Pattern**: Clean separation between data sources and business logic
- 🔐 **Firebase Integration**: Authentication, Firestore, and Storage
- 📐 **Responsive Design**: Adapts to different screen sizes and orientations

<details>
  <summary><b>🎨 UI Layer</b></summary>
  
  The UI Layer contains all screens and reusable widgets organized by feature:
  
  - **Auth Screens**: Login and signup interfaces
  - **Community Screens**: Community creation and management
  - **Feed Screen**: Main scrollable content feed
  - **Post Screens**: Post creation, viewing, and interaction
  - **User Profile Screens**: Profile management and viewing
</details>

```mermaid
flowchart TB
    %% Platforms Boundary
    subgraph "Platforms Boundary" 
        direction TB
        Android["Android"]:::external
        iOS["iOS"]:::external
        Web["Web"]:::external
        Linux["Linux"]:::external
        macOS["macOS"]:::external
        Windows["Windows"]:::external
    end

    Android -->|hosts| FlutterApp
    iOS -->|hosts| FlutterApp
    Web -->|hosts| FlutterApp
    Linux -->|hosts| FlutterApp
    macOS -->|hosts| FlutterApp
    Windows -->|hosts| FlutterApp

    FlutterApp["Flutter App"]:::ui

    %% UI Layer
    subgraph "UI Layer" 
        direction TB
        AuthScreens["Auth Screens"]:::ui
        CommunityScreens["Community Screens"]:::ui
        FeedScreen["Feed Screen"]:::ui
        PostScreens["Post Screens"]:::ui
        UserProfileScreens["User Profile Screens"]:::ui
        HomeScreens["Home Screen & Drawers"]:::ui
        CoreWidgets["Core Widgets"]:::ui
        Responsive["Responsive Utility"]:::ui
        ThemeUtil["Theme Utility"]:::ui
        Router["Routing (Routemaster)"]:::ui
    end

    FlutterApp -->|"renders"| AuthScreens
    FlutterApp -->|"renders"| CommunityScreens
    FlutterApp -->|"renders"| FeedScreen
    FlutterApp -->|"renders"| PostScreens
    FlutterApp -->|"renders"| UserProfileScreens
    FlutterApp -->|"renders"| HomeScreens
    FlutterApp -->|"uses"| CoreWidgets
    FlutterApp -->|"uses"| Responsive
    FlutterApp -->|"uses"| ThemeUtil
    FlutterApp -->|"uses"| Router

    %% Business Layer
    subgraph "Business Layer" 
        direction TB
        AuthController["AuthController"]:::business
        CommunityController["CommunityController"]:::business
        PostController["PostController"]:::business
        UserProfileController["UserProfileController"]:::business
        ThemeNotifier["ThemeNotifier"]:::business
    end

    AuthScreens -->|calls| AuthController
    CommunityScreens -->|calls| CommunityController
    FeedScreen -->|calls| PostController
    PostScreens -->|calls| PostController
    UserProfileScreens -->|calls| UserProfileController
    HomeScreens -->|calls| ThemeNotifier

    %% Data Layer
    subgraph "Data Layer"
        direction TB
        AuthRepo["AuthRepository"]:::data
        CommunityRepo["CommunityRepository"]:::data
        PostRepo["PostRepository"]:::data
        UserProfileRepo["UserProfileRepository"]:::data
        StorageRepo["StorageRepository"]:::data
    end

    AuthController -->|uses| AuthRepo
    CommunityController -->|uses| CommunityRepo
    PostController -->|uses| PostRepo
    UserProfileController -->|uses| UserProfileRepo
    PostController -->|uploads images to| StorageRepo

    %% Firebase Layer
    subgraph "Firebase Layer"
        direction TB
        FirebaseAuth["FirebaseAuth"]:::firebase
        FirestoreSDK["FirebaseFirestore"]:::firebase
        StorageSDK["FirebaseStorage"]:::firebase
        FireOptions["firebase_options.dart"]:::firebase
        FirebaseConsts["Firebase Constants"]:::firebase
        GoogleSignIn["Google Sign-In"]:::external
    end

    AuthRepo -->|auth calls| FirebaseAuth
    AuthRepo -->|oauth| GoogleSignIn
    AuthRepo -->|reads/writes| FirestoreSDK
    CommunityRepo -->|CRUD| FirestoreSDK
    PostRepo -->|CRUD| FirestoreSDK
    UserProfileRepo -->|CRUD| FirestoreSDK
    StorageRepo -->|uploads/downloads| StorageSDK

    FireOptions -->|configures| FirebaseAuth
    FireOptions -->|configures| FirestoreSDK
    FireOptions -->|configures| StorageSDK
    FirebaseConsts -->|defines collections| FirestoreSDK

    FirestoreSDK -->|streams| PostController
    FirestoreSDK -->|streams| CommunityController
    FirestoreSDK -->|streams| UserProfileController

    %% External Hosting
    subgraph "External Services"
        FirebaseHosting["Firebase Hosting / Vercel"]:::external
    end
    Web -->|deployed on| FirebaseHosting

    %% Click Events
    click AuthScreens "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/features/auth/screens/login_screen.dart"
    click CommunityScreens "https://github.com/arshnoor-singh-sohi/reddit/tree/main/lib/features/community/screens/"
    click FeedScreen "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/features/feed/feed_screen.dart"
    click PostScreens "https://github.com/arshnoor-singh-sohi/reddit/tree/main/lib/features/post/screens/"
    click UserProfileScreens "https://github.com/arshnoor-singh-sohi/reddit/tree/main/lib/features/user_profile/screens/"
    click HomeScreens "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/features/home/screens/home_screen.dart"
    click HomeScreens "https://github.com/arshnoor-singh-sohi/reddit/tree/main/lib/features/home/drawers/"
    click CoreWidgets "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/core/common/post_card.dart"
    click CoreWidgets "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/core/common/loader.dart"
    click CoreWidgets "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/core/common/sign_in_button.dart"
    click CoreWidgets "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/core/common/error_text.dart"
    click Responsive "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/responsive/responsive.dart"
    click ThemeUtil "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/theme/pallete.dart"
    click Router "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/router.dart"
    click AuthController "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/features/auth/controller/auth_controller.dart"
    click CommunityController "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/features/community/controller/community_controller.dart"
    click PostController "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/features/post/controller/post_controller.dart"
    click UserProfileController "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/features/user_profile/controller/user_profile_controller.dart"
    click AuthRepo "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/features/auth/repository/auth_repository.dart"
    click CommunityRepo "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/features/community/repository/community_repository.dart"
    click PostRepo "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/features/post/respository/post_repository.dart"
    click UserProfileRepo "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/features/user_profile/repository/user_profile_repository.dart"
    click StorageRepo "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/core/providers/storage_repository_provider.dart"
    click FireOptions "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/firebase_options.dart"
    click FirebaseConsts "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/core/constants/firebase_constant.dart"
    click FirebaseAuth "https://github.com/arshnoor-singh-sohi/reddit/blob/main/lib/core/providers/firebase_providers.dart"

    %% Styles
    classDef ui fill:#D0E8FF,stroke:#0366D6,color:#0366D6
    classDef business fill:#E2F0D9,stroke:#1B7F4F,color:#1B7F4F
    classDef data fill:#FFE7C6,stroke:#D97700,color:#D97700
    classDef firebase fill:#F3E8FF,stroke:#7C3AED,color:#7C3AED
    classDef external fill:#EEEEEE,stroke:#999999,color:#333333


```




## 📱 Live Demo

Check out the deployed app: [Reddit Clone Live Demo](https://jotion-theta.vercel.app/)


## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Core Components](#core-components)
- [Authentication Flow](#authentication-flow)
- [Community System](#community-system)
- [Post System](#post-system)
- [User Profile System](#user-profile-system)
- [State Management](#state-management)
- [UI/UX Design](#uiux-design)
- [Database Schema](#database-schema)
- [Setup Instructions](#setup-instructions)
- [Contributing](#contributing)
- [License](#license)

## 🔍 Overview

This Reddit Clone is a comprehensive social media platform that replicates the core functionality of Reddit. Built with Flutter for cross-platform compatibility and Firebase for backend services, this application offers a complete social experience including user authentication, community creation, post sharing, commenting, and voting mechanisms.

The app follows modern architectural patterns with a clean separation of concerns, making it maintainable and scalable. It features a responsive UI design that works across multiple devices and provides both light and dark themes for user comfort.

## ✨ Features

### User Authentication
- Google Sign-in integration
- Guest browsing mode
- Persistent authentication state
- Profile management

### Communities
- Create communities with custom names
- Join/leave communities
- Moderator tools for community management
- Community search functionality
- Customizable community banners and avatars

### Post Management
- Multiple post types: text, image, and link
- Rich media attachments
- Voting system (upvotes/downvotes)
- Comment threading
- Post deletion for authors and moderators
- Award system for exceptional content

### User Experience
- Responsive UI design
- Dark/light theme toggle
- Karma tracking system
- Personalized feeds based on joined communities
- Award system with customizable awards

### Extras
- Infinite scroll for feed content
- Real-time updates
- Profile customization
- Moderation tools

## 🏗️ Architecture

The application follows a layered architecture pattern to ensure separation of concerns and maintainability:

```
┌─────────────────────┐
│       UI Layer      │
│  (Screens/Widgets)  │
└──────────┬──────────┘
           │
┌──────────▼──────────┐
│    Business Layer    │
│    (Controllers)     │
└──────────┬──────────┘
           │
┌──────────▼──────────┐
│     Data Layer       │
│    (Repositories)    │
└──────────┬──────────┘
           │
┌──────────▼──────────┐
│    Firebase Layer    │
│  (Auth/Firestore)    │
└─────────────────────┘
```

### Detailed Architecture Flow

1. **UI Layer**: Contains all screens and widgets that the user interacts with. It uses the Riverpod for state management.

2. **Business Layer**: Contains controllers that handle the business logic, process user input, and prepare data for display.

3. **Data Layer**: Contains repositories that abstract away the data source and provide methods for data manipulation.

4. **Firebase Layer**: Handles all interactions with Firebase services such as Authentication, Firestore, and Storage.

## 🛠️ Technology Stack

The application leverages a modern technology stack to provide a seamless user experience:

| Category | Technologies |
|----------|--------------|
| **Frontend** | Flutter, Dart |
| **Backend** | Firebase (Auth, Firestore, Storage) |
| **State Management** | Riverpod, StateNotifier |
| **Routing** | Routemaster |
| **Authentication** | Firebase Auth, Google Sign-In |
| **Storage** | Firebase Storage |
| **Database** | Cloud Firestore |
| **UI Components** | Custom Flutter Widgets |
| **Navigation** | Nested Navigation, Bottom Navigation |
| **Error Handling** | Exception Handling, Error Widgets |
| **Resource Management** | Image Caching, Lazy Loading |

## 📂 Project Structure

The project follows a feature-first organization, where each feature has its own directory containing screens, controllers, repositories, and widgets:

```
lib/
├── core/                  # Core utilities and common components
│   ├── common/            # Common widgets used throughout the app
│   ├── constants/         # Constants used throughout the app
│   ├── enums/             # Enumerations for type safety
│   ├── providers/         # Core providers for Firebase services
│   ├── utils.dart         # Utility functions
│   └── type_defs.dart     # Type definitions for better code readability
│
├── features/              # Feature modules
│   ├── auth/              # Authentication feature
│   │   ├── controller/    # Business logic for auth
│   │   ├── repository/    # Data layer for auth
│   │   └── screens/       # UI screens for auth
│   │
│   ├── community/         # Community feature
│   │   ├── controller/    # Business logic for communities
│   │   ├── repository/    # Data layer for communities
│   │   └── screens/       # UI screens for communities
│   │
│   ├── post/              # Post feature
│   │   ├── controller/    # Business logic for posts
│   │   ├── repository/    # Data layer for posts
│   │   ├── screens/       # UI screens for posts
│   │   └── widgets/       # Widgets specific to posts
│   │
│   ├── user_profile/      # User profile feature
│   │   ├── controller/    # Business logic for user profiles
│   │   ├── repository/    # Data layer for user profiles
│   │   └── screens/       # UI screens for user profiles
│   │
│   ├── home/              # Home feature
│   │   ├── delegates/     # Search delegates
│   │   ├── drawers/       # Navigation drawers
│   │   └── screens/       # Home screen
│   │
│   └── feed/              # Feed feature
│       └── feed_screen.dart # Main feed screen
│
├── models/                # Data models
│   ├── community_model.dart
│   ├── post_model.dart
│   ├── comment_model.dart
│   └── user_model.dart
│
├── responsive/            # Responsive UI utilities
│   └── responsive.dart    # Responsive widget
│
├── router.dart            # App routing configuration
├── theme/                 # App theming
│   └── pallete.dart       # Color palette and theme data
│
├── firebase_options.dart  # Firebase configuration
└── main.dart              # App entry point
```

## 🧩 Core Components

### Core Utilities

The core utilities provide the foundation for the application, offering reusable components and tools:

#### Common Widgets
- `ErrorText`: Displays error messages in a standardized way
- `Loader`: Shows a loading indicator for async operations
- `PostCard`: Reusable card component for displaying posts
- `SignInButton`: Google sign-in button with styling

#### Firebase Providers
The app uses Riverpod providers to access Firebase services:
```dart
final fireStoreProvider = Provider((ref) => FirebaseFirestore.instance);
final authProvider = Provider((ref) => FirebaseAuth.instance);
final storageProvider = Provider((ref) => FirebaseStorage.instance);
final googleSignInProvider = Provider((ref) => GoogleSignIn());
```

#### Error Handling
The app uses a custom `Failure` class for error handling:
```dart
class Failure {
  final String message;
  Failure(this.message);
}
```

#### Type Definitions
For better code readability, the app defines custom types:
```dart
typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = FutureEither<void>;
```

## 🔐 Authentication Flow

The authentication system supports Google Sign-In and guest browsing:

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   Login Screen  │────▶│  Google Sign-In │────▶│  Create Account  │
└─────────────────┘     └─────────────────┘     └─────────────────┘
         │                                                │
         │                                                │
         ▼                                                ▼
┌─────────────────┐                            ┌─────────────────┐
│  Guest Browsing │                            │   Home Screen   │
└─────────────────┘                            └─────────────────┘
```

### Authentication Implementation

The auth controller handles all authentication related operations:

```dart
class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;
  
  // Stream to listen for auth state changes
  Stream<User?> get authStateChange => _authRepository.authStateChange;

  // Google Sign-In method
  void signInWithGoogle(BuildContext context, bool isFromLogin) async {
    state = true; // Set loading state
    final user = await _authRepository.signInWithGoogle(isFromLogin);
    state = false; // Reset loading state
    user.fold(
      (l) => showSnackBar(context, l.message),
      (userModel) => _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  // Guest Sign-In method
  void signInAsGuest(BuildContext context) async {
    state = true;
    final user = await _authRepository.signInAsGuest();
    state = false;
    user.fold(
      (l) => showSnackBar(context, l.message),
      (userModel) => _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  // Get user data method
  Stream<UserModel> getUserData(String uid) {
    return _authRepository.getUserData(uid);
  }

  // Logout method
  void logout() async {
    _authRepository.logOut();
  }
}
```

## 👥 Community System

The community system allows users to create, join, and manage communities:

### Community Creation Flow

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  Create Button  │────▶│  Name Community │────▶│  Community Created  │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                           │
                                                           │
                                                           ▼
                                                ┌─────────────────┐
                                                │ Customize Community │
                                                └─────────────────┘
```

### Community Model

```dart
class Community {
  final String id;
  final String name;
  final String banner;
  final String avatar;
  final List<String> members;
  final List<String> mods;
  
  // Constructor, toMap, fromMap methods...
}
```

### Community Features

1. **Creation**: Users can create communities with custom names
2. **Joining/Leaving**: Users can join or leave communities
3. **Moderation**: Community creators become moderators and can add additional moderators
4. **Customization**: Moderators can customize community banners and avatars
5. **Search**: Users can search for communities by name

## 📝 Post System

The post system is the core of the application, allowing users to share content in different formats:

### Post Creation Flow

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   New Post      │────▶│ Select Post Type │────▶│ Create Post Form │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                           │
                                                           │
                                                           ▼
                                                ┌─────────────────┐
                                                │   Post Created   │
                                                └─────────────────┘
```

### Post Model

```dart
class Post {
  final String id;
  final String title;
  final String? link;
  final String? description;
  final String communityName;
  final String communityProfilePic;
  final List<String> upvotes;
  final List<String> downvotes;
  final int commentCount;
  final String username;
  final String uid;
  final String type;
  final DateTime createdAt;
  final List<String> awards;
  
  // Constructor, toMap, fromMap methods...
}
```

### Post Types

1. **Text Posts**: Text content with a title and description
2. **Image Posts**: Image with a title
3. **Link Posts**: URL link with a title and preview

### Post Features

1. **Creation**: Users can create posts in communities they've joined
2. **Voting**: Users can upvote or downvote posts
3. **Comments**: Users can comment on posts
4. **Awards**: Users can give awards to exceptional posts
5. **Moderation**: Post creators and community moderators can delete posts

## 👤 User Profile System

The user profile system allows users to customize their profiles and track their activity:

### User Model

```dart
class UserModel {
  final String name;
  final String profilePic;
  final String banner;
  final String uid;
  final bool isAuthenticated;
  final int karma;
  final List<String> awards;
  
  // Constructor, toMap, fromMap methods...
}
```

### User Profile Features

1. **Customization**: Users can customize their profile banner and avatar
2. **Karma**: Users earn karma for various actions (posting, commenting, receiving awards)
3. **Post History**: Users can view their post history
4. **Awards**: Users can collect and give awards

## 🧠 State Management

The application uses Riverpod for state management, providing a clean and reactive way to manage application state:

### Provider Types

1. **StateNotifierProvider**: Used for mutable state that needs to be updated
2. **StreamProvider**: Used for reactive data from Firestore
3. **Provider**: Used for immutable dependencies

### Example: Community Controller Provider

```dart
final communityControllerProvider = StateNotifierProvider<CommunityController, bool>((ref) {
  final communityRepository = ref.watch(communityRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return CommunityController(
    communityRepository: communityRepository, 
    storageRepository: storageRepository,
    ref: ref,
  );
});

final userCommunitiesProvider = StreamProvider((ref)  {
  final communityController = ref.watch(communityControllerProvider.notifier);
  return communityController.getUserCommunities();
});

final getCommunityByNameProvider = StreamProvider.family((ref, String name)  {
  return ref.watch(communityControllerProvider.notifier).getCommunityByName(name);
});
```

## 🎨 UI/UX Design

The application features a responsive design that works across multiple device sizes, with both light and dark themes:

### Theme System

```dart
class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeMode _mode;
  
  ThemeNotifier({ThemeMode mode = ThemeMode.dark})
      : _mode = mode,
        super(Pallete.darkModeAppTheme) {
    getTheme();
  }

  ThemeMode get mode => _mode;

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == 'light') {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
    }
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
      prefs.setString('theme', 'light');
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
      prefs.setString('theme', 'dark');
    }
  }
}
```

### Color Palette

```dart
class Pallete {
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1);
  static const greyColor = Color.fromRGBO(26, 39, 45, 1);
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;
  
  // Theme data definitions...
}
```

## 🗄️ Database Schema

The application uses Firebase Firestore for data storage, with the following collections:

### Collections

1. **users**: Stores user data
2. **communities**: Stores community data
3. **posts**: Stores post data
4. **comments**: Stores comment data

### Schema Diagram

```
┌───────────────┐     ┌───────────────┐     ┌───────────────┐
│     users     │     │  communities  │     │     posts     │
├───────────────┤     ├───────────────┤     ├───────────────┤
│ name          │     │ id            │     │ id            │
│ profilePic    │     │ name          │     │ title         │
│ banner        │     │ banner        │     │ link          │
│ uid           │     │ avatar        │     │ description   │
│ isAuthenticated│     │ members       │     │ communityName │
│ karma         │     │ mods          │     │ communityPic  │
│ awards        │     │               │     │ upvotes       │
└───────────────┘     └───────────────┘     │ downvotes     │
                                            │ commentCount  │
                                            │ username      │
                                            │ uid           │
                                            │ type          │
                                            │ createdAt     │
                                            │ awards        │
                                            └───────────────┘
                                                    │
                                                    │
                                                    ▼
                                           ┌───────────────┐
                                           │   comments    │
                                           ├───────────────┤
                                           │ id            │
                                           │ text          │
                                           │ createdAt     │
                                           │ postId        │
                                           │ username      │
                                           │ profilePic    │
                                           └───────────────┘
```

## 🚀 Setup Instructions

Follow these steps to set up the project locally:

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Firebase account
- Android Studio / VS Code
- Git

### Installation Steps

1. **Clone the repository**
   ```
   git clone https://github.com/Arshnoor-Singh-Sohi/Reddit.git
   cd Reddit
   ```

2. **Install dependencies**
   ```
   flutter pub get
   ```

3. **Set up Firebase**
   - Create a new Firebase project
   - Enable Authentication (Google Sign-In)
   - Create a Firestore database
   - Set up Firebase Storage
   - Download and add the `google-services.json` file to `android/app`
   - Download and add the `GoogleService-Info.plist` file to `ios/Runner`

4. **Update Firebase configuration**
   - Update the `firebase_options.dart` file with your Firebase configuration

5. **Run the application**
   ```
   flutter run
   ```

## 💻 Key Code Examples

### Home Screen Implementation

```dart
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>{
  int _page = 0;

  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider)!;
    final isGuest = !user.isAuthenticated;
    final currentTheme = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: false,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => displayDrawer(context),
            );
          }
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchCommunityDelegate(ref));
            }, 
            icon: const Icon(Icons.search)
          ),
          Builder(
            builder: (context) {
              return IconButton(
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePic),
                ),
                onPressed: () => displayEndDrawer(context),
              );
            }
          )
        ],
      ),
      body: Constants.tabWidgets[_page],
      drawer: const CommunityListDrawer(),
      endDrawer: isGuest ? null : const ProfileDrawer(),
      bottomNavigationBar: isGuest ? null : CupertinoTabBar(
        activeColor: currentTheme.iconTheme.color,
        backgroundColor: currentTheme.backgroundColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: '',
          ),
        ],
        onTap: onPageChanged,
        currentIndex: _page,
      ),
    );
  }
}
```

### Post Card Implementation

```dart
class PostCard extends ConsumerWidget {
  final Post post;
  const PostCard({
    super.key,
    required this.post,
  });

  void deletePost(WidgetRef ref, BuildContext context) async {
    ref.read(postControllerProvider.notifier).deletePost(post, context);
  }

  void upvotePost(WidgetRef ref) async {
    ref.read(postControllerProvider.notifier).upvote(post);
  }

  void downvotePost(WidgetRef ref) async {
    ref.read(postControllerProvider.notifier).downvote(post);
  }

  void awardPost(WidgetRef ref, String award, BuildContext context) async {
    ref.read(postControllerProvider.notifier).awardPost(
          post: post, 
          award: award, 
          context: context
        );
  }

  void navigateToUser(BuildContext context) {
    Routemaster.of(context).push('/u/${post.uid}');
  }

  void navigateToCommunity(BuildContext context) {
    Routemaster.of(context).push('/r/${post.communityName}');
  }

  void navigateToComments(BuildContext context) {
    Routemaster.of(context).push('/post/${post.id}/comments');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Implementation details...
  }
}
```

## 📊 Performance Considerations

The application is optimized for performance in several ways:

1. **Lazy Loading**: Data is loaded on-demand using streams from Firestore
2. **Pagination**: Feeds implement pagination to limit data fetching
3. **Image Optimization**: Images are optimized and cached for faster loading
4. **Minimal Rebuilds**: Strategic use of Riverpod to minimize unnecessary rebuilds

## 🧪 Testing Approach

The application can be tested using the following approaches:

1. **Unit Tests**: Testing individual units of code in isolation
2. **Widget Tests**: Testing the UI components
3. **Integration Tests**: Testing the interaction between different parts of the app
4. **Firebase Emulator**: Testing Firebase interactions locally

## 📈 Future Improvements

Potential future enhancements for the application:

1. **Rich Text Editor**: Enhanced text formatting for posts and comments
2. **Push Notifications**: Real-time notifications for interactions
3. **Enhanced Search**: Search posts and comments in addition to communities
4. **Analytics**: User behavior tracking and analytics
5. **Enhanced Moderation Tools**: More powerful tools for community moderators
6. **Chat System**: Direct messaging between users
7. **Content Filtering**: NSFW content filtering and age restrictions

## 🤝 Contributing

Contributions are welcome! Here's how you can contribute:

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature-name`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin feature/your-feature-name`
5. Open a pull request

Please ensure your code follows the project's coding standards and includes appropriate tests.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

<div align="center">
  <p>Built with ❤️ by <a href="https://github.com/Arshnoor-Singh-Sohi">Arshnoor Singh Sohi</a></p>
</div>
