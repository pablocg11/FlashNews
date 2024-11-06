# FlashNews

FlashNews is a **SwiftUI-based** News Aggregator app built with **Clean Architecture** principles. It allows users to access the latest news articles, search for specific topics, and receive real-time push notifications.

The app integrates with **NewsAPI** (which provides the latest headlines) and is limited to **100 requests per day** on the free plan.

## Features

- **Searchable News**: Easily find articles using specific keywords.
- **Push Notifications**: Get notified about breaking news in real-time.
- **Clean Architecture**: Follows **Clean Architecture** principles to ensure scalability and maintainability.
- **MVVM**: Built using the **MVVM (Model-View-ViewModel)** pattern for separation of concerns.
- **Transition Animations**: Smooth animations for transitions between views.
- **DTOs (Data Transfer Objects)**: Uses DTOs for better data integrity and communication between layers.
- **NewsAPI Integration**: Fetches the latest headlines using **NewsAPI’s Top Headlines Endpoint**.
- **Responsive Design**: Consistent UI across different device sizes.

## Tech Stack

- **SwiftUI**: For building the user interface using a declarative syntax.
- **Firebase Cloud Messaging**: For push notifications.
- **Clean Architecture**: For separating concerns and ensuring maintainability.
- **DTOs**: For clean and structured data transfer.
- **MVVM**: For clean code and better maintainability.
- **NewsAPI**: To fetch the latest news via **NewsAPI’s Top Headlines Endpoint**.
- **Dependency Injection with Composition Root**: Manages dependencies using a **Composition Root** that follows the **Factory Pattern** for instantiating services and components, ensuring decoupling and better testability.

