import SwiftUI
import WebKit

// ─── Cambia esta URL para que la app cargue una página diferente ───
let defaultURL = "https://farebookings.com"
// ──────────────────────────────────────────────────────────────────

struct ContentView: View {
    @State private var url = defaultURL
    
    var body: some View {
        WebViewContainer(urlString: $url)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
