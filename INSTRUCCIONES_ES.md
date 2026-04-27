# 📱 iOS App Driver - Navegador Integrado

## ¿Qué se ha creado?

Tu app iOS básica con navegador integrado contiene:

### Estructura del Proyecto:
```
iOSAppDriver/
├── 📄 iOSAppDriver.swift           ← Punto de entrada (main app)
├── 📄 ContentView.swift             ← Vista principal con barra de búsqueda
├── 📄 WebViewContainer.swift        ← Componente WebView (WKWebView)
├── 📄 WebViewExtensions.swift       ← Ejemplos avanzados opcionales
├── 📄 Info.plist                    ← Configuración de la app
├── 📋 README.md                     ← Documentación completa
└── 🔧 setup.sh                      ← Script de ayuda
```

## 🚀 Cómo Compilar en macOS

### Opción 1: Crear proyecto nuevo en Xcode (Recomendado)

1. **En tu Mac**, abre Xcode
2. Selecciona **File** → **New** → **Project**
3. Elige **App** bajo la sección iOS
4. Configura:
   - **Product Name:** `iOSAppDriver`
   - **Team:** Tu equipo Apple
   - **Organization:** Tu organización
   - **Bundle Identifier:** `com.tucompania.iosappdriver`
   - **Interface:** SwiftUI
   - **Language:** Swift

5. Copia estos archivos Swift al proyecto:
   - [iOSAppDriver.swift](iOSAppDriver.swift)
   - [ContentView.swift](ContentView.swift)
   - [WebViewContainer.swift](WebViewContainer.swift)

6. Reemplaza `Info.plist` con el file incluido: [Info.plist](Info.plist)

7. **Build & Run:** `Cmd + R`

### Opción 2: Abrir en Xcode (si tienes los .xcodeproj)

```bash
# En tu Mac (dentro de /home/kmz/Proyectos/ios/iOSAppDriver)
open iOSAppDriver.xcodeproj
```

## ✨ Características de la App

✅ **Navegador Web Integrado**
- Usa WKWebView (moderno y eficiente)
- Interfaz SwiftUI

✅ **Barra de Búsqueda**
- Ingresa URLs manualmente
- Auto-completa con `https://` si falta

✅ **Soporte Multiplataforma**
- iPhone (vertical)
- iPad (landscape & portrait)

✅ **Manejo de Errores**
- Logs de carga
- Registro de errores

## 🎨 Interfaz de Usuario

```
┌─────────────────────────────────┐
│   📍 Barra de búsqueda:         │
│   ┌─────────────────────────┬─┐ │
│   │ google.com              │🔍│ │
│   └─────────────────────────┴─┘ │
├─────────────────────────────────┤
│                                 │
│        📱 WebView               │
│      (Página web aquí)          │
│                                 │
│                                 │
└─────────────────────────────────┘
```

## 🔧 Ejemplos de Extensiones

En [WebViewExtensions.swift](WebViewExtensions.swift) encontrarás código de ejemplo para:

1. **Botones de Navegación** (Atrás, Adelante, Recargar)
2. **Ejecutar JavaScript** desde Swift
3. **Compartir URLs** (Share Sheet)
4. **Historial de Navegación**
5. **Manejo de Errores Personalizado**

## 📝 Código Principal

### Punto de Entrada (iOSAppDriver.swift)
```swift
@main
struct iOSAppDriver: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### Vista Principal con WebView
```swift
struct ContentView: View {
    @State private var url = "https://www.google.com"
    
    var body: some View {
        VStack {
            HStack {
                TextField("URL", text: $inputURL)
                Button { loadURL() } label: { 
                    Image(systemName: "magnifyingglass") 
                }
            }
            WebViewContainer(urlString: $url)
        }
    }
}
```

### Integración de WKWebView
```swift
struct WebViewContainer: UIViewRepresentable {
    @Binding var urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            uiView.load(URLRequest(url: url))
        }
    }
}
```

## 🎯 Próximos Pasos Recomendados

1. ✨ **Agregar controles de navegación**
   - Botones: Atrás, Adelante, Recargar
   - Ver [WebViewExtensions.swift](WebViewExtensions.swift#L25)

2. 🔒 **Mejorar seguridad**
   - Forzar HTTPS
   - Validar URLs
   - Limitar dominios permitidos

3. 📋 **Agregar funcionalidades avanzadas**
   - Historial de navegación
   - Favoritos/Bookmarks
   - Compartir URLs
   - Dark mode

4. 🎨 **Personalizar UI**
   - Cambiar colores y estilos
   - Agregar iconos personalizados
   - Animar transiciones

## ⚠️ Requisitos

- **macOS:** 12.0+
- **Xcode:** 14+
- **iOS Target:** 14.0+
- **Swift:** 5.7+

## 🆘 Solucionar Problemas

| Problema | Solución |
|----------|----------|
| "La página no carga" | Verifica la URL y conexión a internet |
| Error "Unknown module 'WebKit'" | Asegúrate de importar `import WebKit` |
| Crash al iniciar | Revisa los logs en Xcode (Cmd+/) |
| Simulador lento | Reinicia el simulador o usa dispositivo físico |

## 📚 Documentación Oficial

- [SwiftUI Documentation](https://developer.apple.com/xcode/swiftui/)
- [WKWebView Guide](https://developer.apple.com/documentation/webkit/wkwebview)
- [UIViewRepresentable](https://developer.apple.com/documentation/swiftui/uiviewrepresentable)

---

**¡Tu app de iOS con navegador integrado está lista para compilar en macOS! 🎉**
