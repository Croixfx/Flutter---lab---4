# Posts Manager - Flutter Lab 4

A Flutter mobile application that consumes the JSONPlaceholder REST API to manage posts (CRUD operations).

## Features
- View all posts in a scrollable list
- View detailed post content
- Create new posts
- Edit existing posts
- Delete posts with confirmation

## API Used
**Base URL:** `https://jsonplaceholder.typicode.com/posts`

| Operation | HTTP Method | Endpoint |
|-----------|------------|----------|
| Get all posts | GET | `/posts` |
| Get single post | GET | `/posts/{id}` |
| Create post | POST | `/posts` |
| Update post | PUT | `/posts/{id}` |
| Delete post | DELETE | `/posts/{id}` |

## Project Structure
```
lib/
├── main.dart                  # App entry point
├── models/
│   └── post.dart              # Post data model
├── services/
│   └── api_service.dart       # API communication layer
└── screens/
    ├── posts_list_screen.dart  # Home screen with all posts
    ├── post_detail_screen.dart # Single post view
    └── add_edit_post_screen.dart # Create/Edit form
```

## Dependencies
- `http: ^1.2.1` — For making HTTP requests to the REST API

## How to Run
```bash
flutter pub get
flutter run
```