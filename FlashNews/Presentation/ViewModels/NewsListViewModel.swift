
import Foundation

class NewsListViewModel: ObservableObject {
    private let getNewsUseCase: GetNewsListUseCaseType
    private let errorMapper: PresentationErrorMapper
    
    init(getNewsUseCase: GetNewsListUseCaseType,
         errorMapper: PresentationErrorMapper) {
        self.getNewsUseCase = getNewsUseCase
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
    
    private func handleResult(_ result: Result<[Article], DomainError>) async {
        switch result {
        case .success(let articles):
            await MainActor.run {
                self.isLoading = false
                self.errorMessage = nil
                self.news = articles   
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
