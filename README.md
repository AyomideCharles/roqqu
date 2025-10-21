# Roqqu

This project is a Flutter-based mobile application developed as part of the Mobile Developer assessment for Roqqu.
The task involves implementing the provided Figma design and integrating it with a real-time open-source WebSocket API (Binance) to display live cryptocurrency market data.

# Project Demo

![qemu-system-x86_64_BGUys8rmkw](https://github.com/user-attachments/assets/b715bf64-522c-4338-bc6a-a3b3ded8be58)

# Features 
- Real time crypto updates using binance websocket API
- Accurate design implementation based on the provided Figma file.
- Smooth transitions and visual feedback



# Set up instructions
- git clone https://github.com/AyomideCharles/roqqu
- cd roqqu
- flutter pub get (to install dependencies)
- flutter run

# Architecture
-- lib/
 - controllers  (logic)
 - models   (data models)
 - services  (websocket api connections) 
 - shared widgets (reusable custom widgets)
 - utils (colors, styles, constants)
 - views (ui presentation)

# Stacks used
- Dart
- Flutter
- GetX state management
- Web socket
- fl_chart
- google fonts
- smooth page indicator
- flutter screen util

