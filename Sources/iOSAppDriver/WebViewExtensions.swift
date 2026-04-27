import SwiftUI
import WebKit

// MARK: - Extensión 1: Barra de control de navegación

struct WebViewWithControls: View {
    @State private var url = "https://www.google.com"
    @State private var inputURL = ""
    @ObservedObject var webViewState = WebViewState()
    
    var body: some View {
        VStack(spacing: 0) {
            // Barra de controles
            HStack(spacing: 8) {
                Button(action: { webViewState.webView?.goBack() }) {
                    Image(systemName: "chevron.left")
                }.disabled(!webViewState.canGoBack)
                
                Button(action: { webViewState.webView?.goForward() }) {
                    Image(systemName: "chevron.right")
                }.disabled(!webViewState.canGoForward)
                
                Button(action: { webViewState.webView?.reload() }) {
                    Image(systemName: "arrow.clockwise")
                }
                
                Button(action: { webViewState.webView?.stopLoading() }) {
                    Image(systemName: "xmark.circle.fill")
                }
            }
            .padding(8)
            .background(Color(.systemGray6))
            
            // Barra de búsqueda
            HStack(spacing: 10) {
                TextField("URL", text: $inputURL)
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
                }
                .buttonStyle(.bordered)
                .padding(8)
            }
            .background(Color(.systemGray6))
            
            WebViewContainer(urlString: $url)
                .environmentObject(webViewState)
            
            // Indicador de carga
            if webViewState.isLoading {
                ProgressView()
                    .padding()
            }
        }
    }
}

// MARK: - Estado del WebView
class WebViewState: ObservableObject {
    @Published var canGoBack = false
    @Published var canGoForward = false
    @Published var isLoading = false
    var webView: WKWebView?
}

// MARK: - Extensión 2: Manejo de JavaScript

struct WebViewWithJavaScript: View {
    @State private var webView: WKWebView?
    
    var body: some View {
        VStack {
            Button("Ejecutar JavaScript") {
                webView?.evaluateJavaScript("alert('Hola desde Swift!')") { result, error in
                    if let error = error {
                        print("Error JavaScript: \(error)")
                    }
                }
            }
            
            Text("Presiona el botón para ejecutar JavaScript en la página")
        }
    }
}

// MARK: - Extensión 3: Compartir URLs

struct WebViewWithShare: View {
    @State private var currentURL = "https://www.google.com"
    @State private var showShareSheet = false
    
    var body: some View {
        VStack {
            Button("Compartir") {
                showShareSheet = true
            }
            .sheet(isPresented: $showShareSheet) {
                ShareSheet(items: [URL(string: currentURL)!])
            }
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// MARK: - Extensión 4: Historial de navegación

class BrowserHistory: ObservableObject {
    @Published var history: [String] = []
    
    func addURL(_ url: String) {
        if !history.contains(url) {
            history.append(url)
        }
    }
    
    func clearHistory() {
        history.removeAll()
    }
}

// MARK: - Extensión 5: Detectar errores de carga

class WebViewErrorHandler: NSObject, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Error de navegación: \(error.localizedDescription)")
        
        // Mostrar página de error personalizada
        let errorHTML = """
        <html>
        <body style="font-family: -apple-system; padding: 20px; text-align: center;">
        <h1>❌ Error de Carga</h1>
        <p>\(error.localizedDescription)</p>
        <p>Por favor verifica tu conexión e intenta de nuevo.</p>
        </body>
        </html>
        """
        
        webView.loadHTMLString(errorHTML, baseURL: nil)
    }
}
