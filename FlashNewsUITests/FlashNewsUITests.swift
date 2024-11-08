
import XCTest

class FlashNewsUITests: XCTestCase {
    
    func test_mainContentView_loadsCorrectly() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Verify that the main content view loads correctly.
        let mainContentView = app.otherElements["MainContentView"]
        XCTAssertTrue(mainContentView.exists, "The main view did not load correctly.")
        
        // Verify that the category list exists.
        let categoryListView = app.otherElements["CategoryListView"]
        XCTAssertTrue(categoryListView.exists, "The category list is not displayed.")
        
        // Verify that the news list is empty initially.
        let emptyNewsListView = app.otherElements["EmptyNewsListView"]
        XCTAssertTrue(emptyNewsListView.exists, "The empty news list view is not displayed when there are no news.")
        
        // Verify that the loading indicator appears while fetching news.
        let loadingView = app.otherElements["LoadingView"]
        XCTAssertTrue(loadingView.exists, "The loading indicator does not appear when fetching data.")
    }
    
    func test_searchFunctionality() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Ensure the search field exists.
        let searchField = app.searchFields["SearchField"]
        XCTAssertTrue(searchField.exists, "The search field is not displayed.")
        
        // Simulate typing text in the search field.
        searchField.tap()
        searchField.typeText("Technology")
        
        // Verify that the news list is correctly filtered (assuming there are news items with the term "Technology").
        let filteredNewsItem = app.staticTexts["Technology Article Title"] // Assuming you have articles with this title
        XCTAssertTrue(filteredNewsItem.exists, "No article related to the search was found.")
    }
    
    func test_navigationToDetailArticle() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Simulate interaction with the first news item in the list.
        let firstNewsItem = app.otherElements["NewsItemView_Article Title"]
        XCTAssertTrue(firstNewsItem.exists, "The first article is not present in the list.")
        
        // Tap on the first news item to navigate to the detail screen.
        firstNewsItem.tap()
        
        // Verify that the article detail screen has been displayed.
        let articleDetailView = app.otherElements["ArticleDetailView"]
        XCTAssertTrue(articleDetailView.exists, "Navigation to the article detail view did not occur.")
    }
}
