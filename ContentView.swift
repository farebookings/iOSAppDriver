import SwiftUI
import WebKit

struct ContentView: View {
    @State private var url = "https://www.google.com"
    @State private var inputURL = ""
    
    var body: some View {
        VStack(spacing: 0) {
            // Barra de navegación
            HStack(spacing: 10) {
                TextField("Ingresa URL", text: $inputURL)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(8)
                
                Button(action: {
                    if !inputURL.isEmpty {
                        var urlString = inputURL
                        if !urlString.hasPrefix("http://") && !urlString.hasPrefix("https://") {
                            urlString = "https://" + urlString
                        }
                        url = urlString
                    }
                }) {
                    Image(systemName: "magnifyingglass")
                        .padding(8)
                }
                .buttonStyle(.bordered)
            }
            .padding(10)
            .background(Color(.systemGray6))
            
            // WebView
            WebViewContainer(urlString: $url)
                .edgesIgnoringSafeArea(.bottom)
        }
        .navigationTitle("App Browser")
    }
}

#Preview {
    ContentView()
}
