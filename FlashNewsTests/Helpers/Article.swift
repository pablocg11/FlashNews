
import Foundation
@testable import FlashNews

extension Article {
    static func getMocks() -> [Article] {
        return [
            getMockArticle1(),
            getMockArticle2(),
            getMockArticle3(),
            getMockArticle4(),
            getMockArticle5(),
            getMockArticle6(),
            getMockArticle7(),
            getMockArticle8(),
            getMockArticle9(),
            getMockArticle10()
        ]
    }
    
    private static func getMockArticle1() -> Article {
        return Article(
            source: Source(id: "1", name: "Tech Times"),
            author: "John Doe",
            title: "Breaking News: Swift 6 Announced",
            description: "Apple has just announced Swift 6 at WWDC, with many new features for iOS developers.",
            url: "https://example.com/swift6-announcement",
            urlToImage: "https://example.com/images/swift6.png",
            publishedAt: "2023-06-15T10:30:00Z",
            content: """
            Swift 6 introduces new capabilities
            for concurrency and improved performance,
            making it easier for developers to write
            efficient code.
            """
        )
    }
    
    private static func getMockArticle2() -> Article {
        return Article(
            source: Source(id: "2", name: "Financial Daily"),
            author: "Jane Smith",
            title: "Global Markets Update",
            description: "A roundup of today’s financial markets, with insights from experts.",
            url: "https://example.com/markets-update",
            urlToImage: "https://example.com/images/markets.png",
            publishedAt: "2023-06-15T09:00:00Z",
            content: """
            Stock markets across the world saw varied performances today,
            with tech stocks experiencing a small dip.
            """
        )
    }
    
    private static func getMockArticle3() -> Article {
        Article(
            source: Source(id: "3", name: "Health Today"),
            author: "Alice Johnson",
            title: "Health Alert: New Vaccine for Flu Season",
            description: "The latest vaccine has been shown to be highly effective in clinical trials.",
            url: "https://example.com/flu-vaccine",
            urlToImage: "https://example.com/images/flu-vaccine.png",
            publishedAt: "2023-06-15T08:15:00Z",
            content: """
            According to recent studies, the new flu vaccine is effective against multiple strains
            and has a higher efficacy rate than previous versions.
            """
        )
    }
    
    private static func getMockArticle4() -> Article {
        return Article(
            source: Source(id: "4", name: "AI Insights"),
            author: "Emily Chen",
            title: "Tech Giants Embrace AI",
            description: "Leading tech companies are making significant investments in AI.",
            url: "https://example.com/ai-investments",
            urlToImage: "https://example.com/images/ai.png",
            publishedAt: "2023-06-14T14:45:00Z",
            content: """
            Companies like Google, Apple, and Amazon are increasingly focusing on AI,
            introducing new tools to enhance user experiences.
            """
        )
    }
    
    private static func getMockArticle5() -> Article {
        return Article(
            source: Source(id: "5", name: "Sports Weekly"),
            author: "Michael Brown",
            title: "Sports Roundup: Highlights of the Week",
            description: "Catch up on the top moments in sports from this week.",
            url: "https://example.com/sports-highlights",
            urlToImage: "https://example.com/images/sports.png",
            publishedAt: "2023-06-13T19:30:00Z",
            content: """
            Highlights include thrilling matches in the NBA, a surprising comeback in the Premier League,
            and new records in Olympic swimming trials.
            """
        )
    }
    
    private static func getMockArticle6() -> Article {
        return Article(
            source: Source(id: "6", name: "Foodie Daily"),
            author: "Rachel Green",
            title: "New Culinary Trends to Try This Summer",
            description: "Explore new recipes and flavors that are making waves this season.",
            url: "https://example.com/culinary-trends",
            urlToImage: "https://example.com/images/culinary.png",
            publishedAt: "2023-06-13T12:10:00Z",
            content: """
            "From plant-based alternatives to unique fusion dishes, 
            this summer is full of bold flavors and culinary creativity.
            """
        )
    }
    
    private static func getMockArticle7() -> Article {
        return Article(
            source: Source(id: "7", name: "Science Daily"),
            author: "Mark Wilson",
            title: "Exploring Mars: Latest Discoveries from NASA",
            description: "NASA's rover sends back new data, revealing interesting details about Mars.",
            url: "https://example.com/mars-discoveries",
            urlToImage: "https://example.com/images/mars.png",
            publishedAt: "2023-06-12T16:25:00Z",
            content: """
            "Scientists are excited about the recent findings, which provide more clues about Mars'
            geological history and potential for supporting life.
            """
        )
    }
    
    private static func getMockArticle8() -> Article {
        return Article(
            source: Source(id: "8", name: "Movie Magic"),
            author: "Sophia Turner",
            title: "Entertainment Buzz: Upcoming Movies to Watch",
            description: "From action-packed blockbusters to indie films, there’s something for everyone.",
            url: "https://example.com/upcoming-movies",
            urlToImage: "https://example.com/images/movies.png",
            publishedAt: "2023-06-12T11:00:00Z",
            content: """
            "Check out our list of highly anticipated films set to release this summer,
            featuring top actors and fresh storylines.
            """
        )
    }
    
    private static func getMockArticle9() -> Article {
        return Article(
            source: Source(id: "9", name: "Environment Matters"),
            author: "Liam Parker",
            title: "Climate Change: Global Impact and Local Actions",
            description: "An in-depth look at climate change effects worldwide and how communities are responding.",
            url: "https://example.com/climate-change",
            urlToImage: "https://example.com/images/climate.png",
            publishedAt: "2023-06-11T20:20:00Z",
            content: """
            Experts emphasize the need for global cooperation 
            to mitigate effects on vulnerable regions and ecosystems.
            """
        )
    }
    
    private static func getMockArticle10() -> Article {
        return Article(
            source: Source(id: "10", name: "Future Tech"),
            author: "Ethan Lewis",
            title: "Advancements in Quantum Computing",
            description: "Quantum computing is closer to reality, with new breakthroughs from research teams.",
            url: "https://example.com/quantum-computing",
            urlToImage: "https://example.com/images/quantum.png",
            publishedAt: "2023-06-11T09:50:00Z",
            content: """
            "These advancements could revolutionize industries, 
            from pharmaceuticals to cryptography,
            by performing complex calculations at unprecedented speeds.
            """
        )
    }
}
