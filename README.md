# iOS App Driver - Navegador Integrado

Una aplicación de iOS básica que incluye un navegador web integrado usando WebKit.

## Características

- ✅ Navegador web integrado basado en WKWebView
- ✅ Barra de búsqueda para ingresar URLs
- ✅ Interfaz moderna con SwiftUI
- ✅ Carga automática de https:// si no se especifica protocolo
- ✅ Soporte para iPhone e iPad

## Requisitos

- macOS 12.0 o superior
- Xcode 14 o superior
- iOS 14.0 como deployment target

## Archivos del Proyecto

```
iOSAppDriver/
├── iOSAppDriver.swift       # Punto de entrada de la app
├── ContentView.swift         # Vista principal con barra de búsqueda
├── WebViewContainer.swift    # Componente WebView integrado
├── Info.plist               # Configuración de la aplicación
└── README.md                # Este archivo
```

## Instalación en Xcode

1. Abre Xcode
2. Selecciona "File" > "Open"
3. Navega a la carpeta `/home/kmz/Proyectos/ios/iOSAppDriver`
4. Selecciona la carpeta raíz y abre

### Crear el proyecto desde cero en Xcode:

Si prefieres crear un nuevo proyecto en Xcode:

1. Xcode > New > Project
2. Selecciona "App" bajo "iOS"
3. Nombre: `iOSAppDriver`
4. Interface: SwiftUI
5. Language: Swift
6. Copia los archivos `.swift` proporcionados

## Compilación y Ejecución

1. En Xcode, selecciona un simulador o dispositivo
2. Presiona `Cmd + R` para compilar y ejecutar
3. La app se abrirá con la página de inicio predefinida (Google)

## Uso

1. Ingresa una URL en la barra de búsqueda (ej: `apple.com`, `https://github.com`)
2. Presiona el botón de búsqueda
3. La página se cargará en el navegador integrado

## Funcionalidades Implementadas

- **Barra de búsqueda**: Campo de texto para ingresar URLs
- **WebView integrado**: Usa WKWebView para renderizar páginas web
- **Gestión de URLs**: Agrega automáticamente `https://` si falta el protocolo
- **Logging de eventos**: Registra carga, errores y inicio de navegación

## Posibles Mejoras Futuras

- Botones de navegación (atrás, adelante, recargar, parar)
- Historial de navegación
- Gestos como swipe para navegar
- Soporte para compartir URLs
- Configuración de búsqueda personalizada
- HTTPS forzado
- Bloqueo de anuncios
- Cookies y almacenamiento de sesión

## Notas Técnicas

- La app usa WKWebView en lugar de UIWebView (deprecado)
- SwiftUI garantiza la compatibilidad moderna
- El WebViewContainer es un UIViewRepresentable que integra UIKit con SwiftUI
- Se implementó un Coordinator para manejar delegados de WKNavigationDelegate

## Solución de Problemas

**La página no carga:**
- Verifica la URL ingresada
- Asegúrate de tener una conexión a internet en el simulador
- Revisa los logs en la consola de Xcode

**Error de build:**
- Limpia el proyecto: `Cmd + Shift + K`
- Reinstala dependencias
- Verifica que el deployment target sea iOS 14+
