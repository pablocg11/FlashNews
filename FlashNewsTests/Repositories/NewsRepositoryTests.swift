
import XCTest
@testable import FlashNews

final class NewsRepositoryTests: XCTestCase {
    
    func test_getAllNews_returns_success() async throws {
        let apiDataSourceSub = APINewsDataSourceStub(articles: .success(ArticleDTO.getMocks()))
        let sut = NewsRepository(apiDataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())
        
        let result = await sut.getAllNews(category: .general)
        
        let articleList = try XCTUnwrap(result.get())
        let articleListDomain = ArticleDTO.getMocks().map { Article(dto: $0) }
                
        XCTAssertEqual(articleList, articleListDomain)
    }
    
    func test_getMoreNews_returns_success() async throws {
        let apiDataSourceSub = APINewsDataSourceStub(articles: .success(ArticleDTO.getMocks()))
        let sut = NewsRepository(apiDataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())
        
        let result = await sut.getMoreNews(category: .general)
        
        let articleList = try XCTUnwrap(result.get())
        let articleListDomain = ArticleDTO.getMocks().map { Article(dto: $0) }
                    
        XCTAssertEqual(articleList, articleListDomain)
    }
    
    func test_getAllNews_returns_error_when_empty() async throws {
        let apiDataSourceSub = APINewsDataSourceStub(articles: .success([]))
        let sut = NewsRepository(apiDataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())
        
        let result = await sut.getAllNews(category: .general)

        guard case .failure(let error) = result else {
            XCTFail("Expected failure, but got success.")
            return
        }
        
        XCTAssertEqual(error, .emptyResponse)
    }
    
    func test_getAllNews_returns_networkError() async throws {
        let apiDataSourceSub = APINewsDataSourceStub(articles: .failure(.networkError))
        let sut = NewsRepository(apiDataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())
        
        let result = await sut.getAllNews(category: .general)

        guard case .failure(let error) = result else {
            XCTFail("Expected failure, but got success.")
            return
        }
        
        XCTAssertEqual(error, .networkError)
    }
    
    func test_getAllNews_returns_serverError() async throws {
        let apiDataSourceSub = APINewsDataSourceStub(articles: .failure(.serverError))
        let sut = NewsRepository(apiDataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())
        
        let result = await sut.getAllNews(category: .general)

        guard case .failure(let error) = result else {
            XCTFail("Expected failure, but got success.")
            return
        }
        
        XCTAssertEqual(error, .serverError)
    }
    
    func test_getAllNews_returns_timeoutError() async throws {
        let apiDataSourceSub = APINewsDataSourceStub(articles: .failure(.timeout))
        let sut = NewsRepository(apiDataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())
        
        let result = await sut.getAllNews(category: .general)

        guard case .failure(let error) = result else {
            XCTFail("Expected failure, but got success.")
            return
        }
        
        XCTAssertEqual(error, .timeout)
    }
    
    func test_getAllNews_returns_parsingError() async throws {
        let apiDataSourceSub = APINewsDataSourceStub(articles: .failure(.parsingError))
        let sut = NewsRepository(apiDataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())
        
        let result = await sut.getAllNews(category: .general)

        guard case .failure(let error) = result else {
            XCTFail("Expected failure, but got success.")
            return
        }
        
        XCTAssertEqual(error, .parsingError)
    }
    
    func test_getAllNews_returns_invalidResponseError() async throws {
        let apiDataSourceSub = APINewsDataSourceStub(articles: .failure(.invalidResponse))
        let sut = NewsRepository(apiDataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())
        
        let result = await sut.getAllNews(category: .general)

        guard case .failure(let error) = result else {
            XCTFail("Expected failure, but got success.")
            return
        }
        
        XCTAssertEqual(error, .invalidResponse)
    }
}
