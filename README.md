
<p align="center">
  <img src="https://github.com/user-attachments/assets/152300e2-be30-4514-9ab2-66e34726354e" width="200" style="border-radius: 15px;"/>
</p>

# FlashNews 📱📰

FlashNews is a **SwiftUI-based** News Aggregator app built with **Clean Architecture** principles. It allows users to access the latest news articles, search for specific topics, and receive real-time push notifications.

The app integrates with **NewsAPI** (which provides the latest headlines) and is limited to **100 requests per day** on the free plan.

## Features ✨

- **LazyVGrid Layout**: Display news articles in a LazyVGrid for a smooth, grid-based layout that adapts to different screen sizes. 🏙️
- **Category-Based News**: Browse news by categories like General, Business, Sports, Technology, and more. 📰
- **Searchable News**: Easily find articles using specific keywords. 🔍
- **Article Details**: View in-depth articles with complete details and source information. 📖
- **Share Articles**: Easily share articles with others through social media or messaging apps. 📲

## Tech Stack 🛠️

- **SwiftUI**: For building the user interface using a declarative syntax. 🖥️
- **Firebase Cloud Messaging**: For push notifications. 📲
- **Firebase Crashlytics**: For real-time crash reporting and debugging. 🐛
- **Clean Architecture**: For separating concerns and ensuring maintainability. 🧠
- **DTOs**: For clean and structured data transfer. 💡
- **MVVM**: For clean code and better maintainability. 🧹
- **NewsAPI**: To fetch the latest news via **NewsAPI’s Top Headlines Endpoint**. 📰
- **Dependency Injection with Composition Root**: Manages dependencies using a **Composition Root** that follows the **Factory Pattern** for instantiating services and components, ensuring decoupling and better testability. ⚙️
- **SwiftLint configuration**: to ensure clean code practices
- **CI/CD with Bitrise**: Automated continuous integration and delivery to streamline testing, building, and deployment processes, ensuring faster feedback and a more stable release cycle. 🔄
- **Lottie**: For adding smooth and engaging animations to the app. 🎬

## Screenshots 📸

<p align="center">
  <img src="https://github.com/user-attachments/assets/24e46684-ba55-407e-860e-be1c3cac09da" alt="Home Screen" width="300"/>
  <img src="https://github.com/user-attachments/assets/f22b2479-6ee2-4c62-803f-4064f0bbcafb" alt="Detail Screen" width="300"/>
  <img src="https://github.com/user-attachments/assets/f22b2479-6ee2-4c62-803f-4064f0bbcafb" alt="Search Screen" width="300"/>
</p>

