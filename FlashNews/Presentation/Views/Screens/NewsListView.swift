
import SwiftUI

struct NewsListView: View {
    
    @ObservedObject var vm: NewsListViewModel
    
    init(vm: NewsListViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if vm.isLoading {
                    ProgressView()
                        .padding()
                }
                else {
                    VStack {
                        ScrollView {
                            ForEach(vm.news, id: \.self) { article in
                                NewsItemView(article: article)
                                    .padding(.horizontal)
                            }
                        }

                        if let error = vm.errorMessage {
                            Text(error)
                                .font(.headline)
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Today's News")
            .onAppear {
                vm.onAppear()
            }
        }
    }
} 
