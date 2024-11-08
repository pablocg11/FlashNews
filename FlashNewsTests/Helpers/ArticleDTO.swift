import Foundation
@testable import FlashNews

extension ArticleDTO {
    
    static func getMocks() -> [ArticleDTO] {
        return [
            ArticleDTO(
                source: SourceDTO(id: "1", name: "Test Source"),
                author: "Test Author",
                title: "Sample News Title",
                description: "This is a sample description for testing.",
                url: "https://example.com/sample-news",
                urlToImage: "https://example.com/sample-image.jpg",
                publishedAt: "2024-01-01T10:00:00Z",
                content: "This is sample content for testing purposes."
            ),
            ArticleDTO(
                source: SourceDTO(id: "2", name: "Another Source"),
                author: "Another Author",
                title: "Another News Title",
                description: "This is another sample description.",
                url: "https://example.com/another-news",
                urlToImage: "https://example.com/another-image.jpg",
                publishedAt: "2024-01-02T12:00:00Z",
                content: "This is another sample content."
            ),
            ArticleDTO(
                source: SourceDTO(id: "3", name: "Tech Daily"),
                author: "John Doe",
                title: "The Future of AI in 2024",
                description: "Exploring the advancements in AI technology and their implications.",
                url: "https://example.com/ai-future-2024",
                urlToImage: "https://example.com/ai-image.jpg",
                publishedAt: "2024-02-15T08:00:00Z",
                content: "The future of AI is bright, with new developments in machine learning, computer vision, and natural language processing. Companies are racing to integrate AI into their products."
            ),
            ArticleDTO(
                source: SourceDTO(id: "4", name: "Global News Network"),
                author: "Jane Smith",
                title: "Global Warming Effects on Agriculture",
                description: "How climate change is impacting crop yields and food security worldwide.",
                url: "https://example.com/global-warming-agriculture",
                urlToImage: "https://example.com/agriculture-image.jpg",
                publishedAt: "2024-03-22T14:30:00Z",
                content: "As temperatures rise, many regions are seeing a decline in agricultural productivity. Droughts, floods, and temperature extremes are affecting crop yields, with global food security at risk."
            ),
            ArticleDTO(
                source: SourceDTO(id: "5", name: "Sports Insider"),
                author: "Chris Johnson",
                title: "Champions League Final Preview",
                description: "A breakdown of the teams competing for the title in this year's Champions League final.",
                url: "https://example.com/champions-league-preview",
                urlToImage: "https://example.com/soccer-image.jpg",
                publishedAt: "2024-05-01T19:00:00Z",
                content: "The Champions League final is just around the corner, and fans are eagerly anticipating the showdown between the top two teams in Europe. In-depth analysis of tactics, key players, and predictions."
            ),
            ArticleDTO(
                source: SourceDTO(id: "6", name: "Health Today"),
                author: "Dr. Susan Lee",
                title: "5 Tips for Better Mental Health",
                description: "Simple strategies to improve your mental well-being and reduce stress.",
                url: "https://example.com/mental-health-tips",
                urlToImage: "https://example.com/mental-health-image.jpg",
                publishedAt: "2024-04-10T07:45:00Z",
                content: "Mental health is just as important as physical health. Here are five tips to improve your mental well-being: 1) Regular exercise, 2) Meditation, 3) Adequate sleep, 4) Healthy diet, 5) Social connections."
            ),
            ArticleDTO(
                source: SourceDTO(id: "7", name: "Tech World Today"),
                author: "Alice Cooper",
                title: "Apple's New Product Launch: What to Expect",
                description: "A preview of the upcoming product release from Apple, including rumored features and specs.",
                url: "https://example.com/apple-product-launch",
                urlToImage: "https://example.com/apple-launch-image.jpg",
                publishedAt: "2024-06-12T10:30:00Z",
                content: "Apple is set to unveil its latest products this fall. Here's a look at what we can expect, from the iPhone 15 to a new line of wearables. Analysts are speculating about groundbreaking features that could change the industry."
            ),
            ArticleDTO(
                source: SourceDTO(id: "8", name: "Entertainment Weekly"),
                author: "Michael Roberts",
                title: "Summer Blockbusters to Watch",
                description: "A guide to the biggest movie releases of the summer season.",
                url: "https://example.com/summer-blockbusters",
                urlToImage: "https://example.com/movie-image.jpg",
                publishedAt: "2024-05-25T20:00:00Z",
                content: "Summer is here, and so are the most anticipated films of the season. From action-packed superhero movies to heartwarming family films, here's your ultimate guide to the summer blockbusters you can't miss."
            )
        ]
    }
}
