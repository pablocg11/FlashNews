
import Foundation

class NewsListViewFactory {
    
    func createView() -> MainContentView {
        return MainContentView(vm: createNewsListViewViewModel())
    }
    
    private func createNewsListViewViewModel() -> NewsListViewModel {
        return NewsListViewModel(getNewsUseCase: createGetNewsUseCase(),
                                 getMoreNewsUseCase: createGetMoreNewsUseCase(),
                                 errorMapper: createPresentationErrorMapper())
    }
    
    private func createGetNewsUseCase() -> GetNewsListUseCaseType {
        return GetNewsListUseCase(repository: createNewsRepository())
    }
    
    private func createGetMoreNewsUseCase() -> GetMoreNewsUseCaseType {
        return GetMoreNewsUseCase(repository: createNewsRepository())
    }
    
    private func createPresentationErrorMapper() -> PresentationErrorMapper {
        return PresentationErrorMapper()
    }
    
    private func createNewsRepository() -> NewsRepositoryType {
        return NewsRepository(apiDataSource: createAPIDataSource(),
                              errorMapper: createErrorMapper())
    }
    
    private func createAPIDataSource() -> APINewsDataSourceProtocol {
        return APINewsDataSource(httpClient: createHttpClient(),
                                 APIKeyManager: createAPIKeyManager())
    }
    
    private func createErrorMapper() -> DomainErrorMapper {
        return DomainErrorMapper()
    }
    
    private func createAPIKeyManager() -> APIKeyManager {
        APIKeyManager()
    }
    
    private func createHttpClient() -> HTTPClientProtocol {
        return HTTPClient(errorsResolver: createHttpErrorsResolver(),
                          requestBuilder: createHttpRequestBuilder())
    }
    
    private func createHttpErrorsResolver() -> HTTPErrorsResolver {
        return HTTPErrorsResolver()
    }
    
    private func createHttpRequestBuilder() -> HTTPRequestBuilder {
        return HTTPRequestBuilder()
    }
}
