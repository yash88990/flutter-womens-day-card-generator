# 🌸 Women's Day Greeting Card Generator (Flutter)

A beautiful Flutter application that allows users to create and share personalized Women's Day greeting cards. Users can select card templates, add custom messages, preview the card, and share it instantly on social media platforms.

---

## ✨ Features

• 🎨 Multiple greeting card templates  
• ✏️ Add recipient name and sender name  
• 💌 Write a personalized message  
• 👀 Live card preview  
• 📸 Convert card widget into image  
• 📤 Share card to WhatsApp, Instagram, Email, etc  
• 📱 Clean and responsive Flutter UI  

---

## 📱 App Screens

1. Card Template Selection  
2. Greeting Card Preview  
3. User Input Fields  
4. Share Greeting Card  

---

## 🛠️ Tech Stack

**Framework**

- Flutter

**Language**

- Dart

**Packages Used**

- `share_plus` → Share card images to other apps  
- `path_provider` → Access device temporary storage  
- `flutter/rendering` → Capture widget as image  

---

## ⚙️ How It Works

1️⃣ User selects a greeting card template  

2️⃣ User enters:
- Recipient name
- Sender name
- Personal message

3️⃣ App dynamically updates the card preview.

4️⃣ When the user clicks **Share Greeting Card**:
- The card widget is captured as an image using `RepaintBoundary`.
- The image is saved in temporary storage.
- The image is shared using the `share_plus` package.

---

## 🚀 Getting Started

Clone the Repository,

Navigate to Project Folder ---cd flutter-womens-day-card-generator,

Install Dependencies ---------flutter pub get,

Run the App ------------------flutter run


📦**Dependencies**

Add these to pubspec.yaml:

dependencies:

  flutter:
  
    sdk: flutter
    
  share_plus: ^12.0.1
  
  path_provider: ^2.1.5
