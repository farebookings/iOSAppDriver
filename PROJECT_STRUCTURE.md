# 📁 Estructura del Proyecto - iOS App con GitHub Actions

```
iOSAppDriver/
│
├── 📱 CÓDIGO FUENTE
│   ├── iOSAppDriver.swift          ← Punto de entrada (@main)
│   ├── ContentView.swift            ← Vista principal + barra de búsqueda
│   ├── WebViewContainer.swift       ← Navegador web (WKWebView)
│   └── WebViewExtensions.swift      ← Ejemplos de funcionalidades avanzadas
│
├── ⚙️ CONFIGURACIÓN
│   ├── Info.plist                   ← Metadata de la app
│   ├── exportOptions.plist          ← Opciones de export IPA
│   └── .gitignore                   ← Archivos a ignorar en git
│
├── 🔄 GITHUB ACTIONS (CI/CD)
│   └── .github/workflows/
│       ├── build.yml                ← Build en cada push
│       ├── tests.yml                ← Tests y cobertura
│       └── release.yml              ← Release automático en tags
│
├── 📚 DOCUMENTACIÓN
│   ├── QUICK_START_GITHUB_ACTIONS.md    ← ⭐ Empieza aquí (5 min)
│   ├── GITHUB_ACTIONS.md                ← Guía completa de CI/CD
│   ├── INSTRUCCIONES_ES.md              ← Cómo compilar en Xcode
│   ├── README.md                        ← Info general del proyecto
│   └── PROJECT_STRUCTURE.md             ← Este archivo
│
└── 🔧 SCRIPTS
    ├── github-actions-setup.sh      ← Setup automático de GitHub
    └── setup.sh                      ← Help de instalación
```

---

## 🚀 Pasos Rápidos

### Para Compilar en GitHub Actions:

1. **Crear proyecto Xcode** (en macOS)
   ```bash
   # En tu Mac
   open iOSAppDriver.xcodeproj
   # Copia los archivos .swift
   # Presiona Cmd+B para verificar que compila
   ```

2. **Hacer push al repositorio**
   ```bash
   git add .
   git commit -m "🎉 Initial commit"
   git push origin main
   ```

3. **Habilitar en GitHub**
   - Settings → Actions → General → Allow all actions

4. **Ver builds**
   - GitHub → Actions → Ver workflows corriendo

---

## 📖 Documentación por Tema

| Necesito... | Leo... |
|-----------|--------|
| ⚡ Empezar rápido | [QUICK_START_GITHUB_ACTIONS.md](QUICK_START_GITHUB_ACTIONS.md) |
| 🔧 Configurar CI/CD completo | [GITHUB_ACTIONS.md](GITHUB_ACTIONS.md) |
| 📱 Compilar en Xcode | [INSTRUCCIONES_ES.md](INSTRUCCIONES_ES.md) |
| 📚 Info general | [README.md](README.md) |
| 🎨 Entender el código | [WebViewExtensions.swift](WebViewExtensions.swift) |

---

## 🎯 Workflows de GitHub Actions

### 1. `build.yml` - Build Principal
**Dispara:** Cada push a main/master/develop
**Acciones:**
- ✅ Compila Debug (simulador)
- ✅ Compila Release (dispositivo)
- ✅ Genera .xcarchive
- ✅ Genera IPA
- ✅ Sube artefactos (30 días)

### 2. `tests.yml` - Tests & Coverage
**Dispara:** Cada push
**Acciones:**
- 🧪 Ejecuta unit tests
- 📊 Calcula code coverage
- 📤 Integración con Codecov
- 📦 Sube resultados

### 3. `release.yml` - Releases
**Dispara:** Git tags `v*` ó manualmente
**Acciones:**
- 🏗️ Build optimizado
- 📦 Archive + IPA
- 🏷️ Crea GitHub Release
- 📊 Status notifications

---

## 📋 Archivos Modificables

### Para tu Equipo Apple:
```bash
# Editar: exportOptions.plist
# Cambiar YOUR_TEAM_ID por tu Team ID
sed -i 's/YOUR_TEAM_ID/12ABC3D4E5/g' exportOptions.plist
```

### Para tu Repo:
```bash
# En github-actions-setup.sh, cambiar:
COMMIT_MSG="🎉 Initial iOS App with GitHub Actions"
```

---

## 🔐 Seguridad

### Secretos de GitHub (Opcional)
Si necesitas keys privadas, en GitHub:
1. Settings → Secrets
2. New repository secret
3. Name: `MY_SECRET`
4. Use en workflows: `${{ secrets.MY_SECRET }}`

---

## 📊 Estados de Build

| Estado | Significa |
|--------|-----------|
| ✅ Success | Build completado, artefactos listos |
| ⏳ In Progress | GitHub Actions compilando |
| ❌ Failed | Error en build, revisar logs |
| ⚠️ Skipped | Condición no cumplida (ej: tests) |

---

## 🎓 Conceptos Clave

```
Git Push 
    ↓
GitHub detecta cambios
    ↓
Dispara workflow (build.yml)
    ↓
Inicia macOS runner
    ↓
xcodebuild compila proyecto
    ↓
Sube artefactos a GitHub
    ↓
Puedes descargar IPA
```

---

## 🆘 Troubleshooting

```bash
# Verificar que xcode compila localmente
xcodebuild -scheme iOSAppDriver -sdk iphonesimulator build

# Ver schemes disponibles
xcodebuild -list

# Limpia y rebuilds
xcodebuild clean -scheme iOSAppDriver
xcodebuild -scheme iOSAppDriver -sdk iphonesimulator build

# Test en terminal
xcodebuild test -scheme iOSAppDriver -sdk iphonesimulator
```

---

## 📞 Contacto

Para problemas con workflows:
- 📖 Lee [GITHUB_ACTIONS.md](GITHUB_ACTIONS.md)
- 🐛 Revisa logs en GitHub Actions
- 💬 Documenta el error y abre un issue en GitHub

---

**Última actualización:** 27 de abril de 2026  
**Versión:** 1.0  
**Estado:** ✅ Ready for Production
