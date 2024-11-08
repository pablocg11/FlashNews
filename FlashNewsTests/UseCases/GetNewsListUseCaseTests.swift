
import XCTest
@testable import FlashNews

final class GetNewsListUseCaseTests: XCTestCase {
    
    func test_execute_successfully_returns_notEmpty_array_when_repository_returns_notEmpty_array() async throws {
        let mockArticles = Article.getMocks()
        let result: Result<[Article], DomainError> = .success(mockArticles)
        
        let repositoryStub = NewsRepositoryStub(result: result)
        let sut = GetNewsListUseCase(repository: repositoryStub)
        
        let capturedResult = await sut.execute(category: .general)
        
        let capturedArticles = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedArticles, mockArticles)
    }
    
    func test_execute_successfully_returns_empty_array_when_repository_returns_empty_array() async throws {
        let result: Result<[Article],DomainError> = .success([])
        
        let repositoryStub = NewsRepositoryStub(result: result)
        let sut = GetNewsListUseCase(repository: repositoryStub)
        
        let capturedResult = await sut.execute(category: .general)
        let capturedNewsResult = try XCTUnwrap(capturedResult.get())
        
        XCTAssertEqual(capturedNewsResult, [])
    }
    
    func test_execute_returns_error_when_repository_returns_error() async throws {
        let result: Result<[Article],DomainError> = .failure(.emptyResponse)
        
        let repositoryStub = NewsRepositoryStub(result: result)
        let sut = GetNewsListUseCase(repository: repositoryStub)
        
        let capturedResult = await sut.execute(category: .general)
        XCTAssertEqual(capturedResult, result)
    }
    
    func test_execute_with_specific_category_returns_correct_data() async throws {
        let mockArticles = Article.getMocks()
        let result: Result<[Article], DomainError> = .success(mockArticles)
        
        let repositoryStub = NewsRepositoryStub(result: result)
        let sut = GetNewsListUseCase(repository: repositoryStub)
        
        let capturedResult = await sut.execute(category: .sports)
        let capturedArticles = try XCTUnwrap(capturedResult.get())
        
        XCTAssertEqual(capturedArticles, mockArticles)
    }
}
