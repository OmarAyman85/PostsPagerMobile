# 📝 **Flutter Posts App**

**Description:**
A simple yet powerful Flutter app that allows users to create, view, edit, and delete posts. The app uses RESTful API integration and follows clean architecture principles with state management using Flutter Bloc.

---

## 🚀 **Features**

- 🆕 **Create Posts:** Add new posts with a title and body.
- 📄 **View Posts:** Browse and read all posts in a list view.
- ✏️ **Edit Posts:** Update existing posts with new content.
- ❌ **Delete Posts:** Remove posts with confirmation.
- 🌗 **Dark Mode:** Seamless switch between light and dark themes.

---

## 🖼️ **Screenshots**

| Home Screen | Add Post | Edit Post |
|-------------|-----------|-----------|
| ![Home](screenshots/home.png) | ![Add Post](screenshots/add_post.png) | ![Edit Post](screenshots/edit_post.png) |

---

## 📦 **Installation**

1. **Clone the repository:**
```bash
git clone https://github.com/OmarAyman85/PostsPagerMobile.git
cd PostsPagerMobile
```

2. **Install dependencies:**
```bash
flutter pub get
```

3. **Generate code (if using build_runner):**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Run the app:**
```bash
flutter run
```

---

## 🔨 **Technologies Used**

- **Flutter:** 3.29.0
- **Dart:** 3.7.0
- **State Management:** Flutter Bloc
- **Networking:** http
- **Local Storage:** Cache

---

## 🧠 **Architecture**

The app uses **Clean Architecture** principles with **Flutter Bloc** for state management.

### Layers:

1. **Presentation:** UI and Bloc interactions.
2. **Domain:** Business logic and use cases.
3. **Data:** Repositories, API calls, and local storage.

---

## 📁 **Folder Structure**

```
lib/
│
├── core/                    # Global App features
│   ├── errors/                # Handling Failures and Exceptions
│   ├── network/               # checking connectivity state
│   ├── strings/               # messages for failures and exceptions
│   ├── utils/                 # Snackbars and application theme
│   └── widgets/               # general widgets ex.:Loading widget
├── features/                # Specific App features
│   └── posts/                 # The posts features and all of its needs
│   │   └── data/                # Data Layer including API and Local storage
|   │   |   ├── datasources/       # Remote and local data sources
|   │   |   ├── models/            # Data models
|   │   |   └── repositories/      # Repository implementations
│   │   ├── domain/              # Business logic
|   │   │   ├── entities/          # Core entities
|   │   │   ├── repositories/      # Repository interfaces
|   │   │   └── usecases/          # Application use cases
│   │   ├── presentation/        # UI and Widgets
│   │   │   ├── bloc/              # State management using BLOC
│   │   │   ├── pages/             # APP's pages
│   │   │   └── widgets/           # Reusable widgets
├── injection_container.dart   # dependency Injection
└── main.dart                  # App entry point
```

---

## 🌐 **API Reference**

- **Base URL:** `https://jsonplaceholder.typicode.com`

### Fetch Posts

```http
GET /posts
```

### Create Post

```http
POST /posts
```

### Update Post

```http
PUT /posts/{id}
```

### Delete Post

```http
DELETE /posts/{id}
```

---

## 🧪 **Running Tests**

```bash
flutter test
```

---

## 🤝 **Contributing**

1. **Fork the project**
2. **Create a feature branch:**
```bash
git checkout -b feature/YourFeature
```
3. **Commit your changes:**
```bash
git commit -m 'Add YourFeature'
```
4. **Push to the branch:**
```bash
git push origin feature/YourFeature
```
5. **Open a Pull Request**

---

## 📄 **License**

This project is licensed under the MIT License.

---

## 👤 **Author**

- **Name:** Omar Ayman
- **GitHub:** [@OmarAyman85]([https://github.com/johndoe](https://github.com/OmarAyman85))
- **LinkedIn:** [Omar Ayman](https://www.linkedin.com/in/ommarayman/)

---
