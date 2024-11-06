
import Foundation

class NewsListViewModel: ObservableObject {

    private let getNewsUseCase: GetNewsListUseCaseType
    private let getMoreNewsUseCase: GetMoreNewsUseCaseType
    private let errorMapper: PresentationErrorMapper
    
    init(getNewsUseCase: GetNewsListUseCaseType,
         getMoreNewsUseCase: GetMoreNewsUseCaseType,
         errorMapper: PresentationErrorMapper) {
        self.getNewsUseCase = getNewsUseCase
        self.getMoreNewsUseCase = getMoreNewsUseCase
        self.errorMapper = errorMapper
    }
    
    @Published var news: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func onAppear() {
        fetchNews(category: .general)
    }
    
    func fetchNews(category: Categories) {
        isLoading = true
        
        Task {
            let result = await self.getNewsUseCase.execute(category: category)
            await handleResult(result)
        }
    }
        
    func fetchMoreNews(category: Categories) {
        isLoading = true
        
        Task {
            let result = await self.getMoreNewsUseCase.execute(category: category)
            await handleResult(result, isFetchMore: true)
        }
    }
    
    private func handleResult(_ result: Result<[Article], DomainError>, isFetchMore: Bool = false) async {
        switch result {
        case .success(let articles):
            await MainActor.run {
                self.isLoading = false
                self.errorMessage = nil
                if isFetchMore {
                    self.news.append(contentsOf: articles)
                } else {
                    self.news = articles
                }
            }
        case .failure(let error):
            handleError(error: error)
        }
    }
    
    private func handleError(error: DomainError?) {
        Task { @MainActor in
            isLoading = false
            errorMessage = errorMapper.map(error: error)
        }
    }
}
