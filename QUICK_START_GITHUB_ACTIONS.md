# ⚡ Quick Start - GitHub Actions

## 🎯 En 5 minutos: Compilar en GitHub

### 1️⃣ Crear Proyecto Xcode (en macOS)

```bash
# En tu Mac
open iOSAppDriver.xcodeproj

# O crea uno nuevo:
# Xcode > New > Project > App (iOS)
# Copia los archivos .swift
```

**Verifica:**
```bash
xcodebuild -scheme iOSAppDriver -sdk iphonesimulator build
```

### 2️⃣ Push al Repositorio

```bash
cd /home/kmz/Proyectos/ios/iOSAppDriver

# Configurar git (primera vez)
git config user.name "Tu Nombre"
git config user.email "tu@email.com"

# Agregar y hacer push
git add .
git commit -m "🎉 Initial commit with GitHub Actions"
git push origin main
```

### 3️⃣ Configurar GitHub Actions

En **GitHub.com** → Tu Repositorio:

1. **Settings** → **Actions** → **General**
2. ✅ Selecciona "Allow all actions"
3. **Save**

### 4️⃣ Ver Builds Automáticos

Ve a la pestaña **Actions** en GitHub

¡Eso es! Cada `git push` compila automáticamente.

---

## 📋 Workflows Incluidos

| Workflow | Trigger | Qué hace |
|----------|---------|----------|
| `build.yml` | Cada push | ✅ Compila Debug & Release |
| `tests.yml` | Cada push | 🧪 Ejecuta tests |
| `release.yml` | Tags `v*` | 📦 Crea releases |

---

## 🔧 Solucionar Problemas

### ❌ "Scheme not found"

En Xcode:
1. Product → Scheme → Manage Schemes
2. ✅ Marca "Shared"
3. Close

Commit y push:
```bash
git add .
git commit -m "Fix scheme sharing"
git push
```

### ❌ "Cannot build"

En macOS:
```bash
xcodebuild -scheme iOSAppDriver \
  -sdk iphonesimulator \
  build
```

Si falla, soluciona localmente antes de hacer push.

### ⚠️ Build Action no aparece

Espera 1-2 minutos después del workflow_dispatch o es que GitHub Actions está deshabilitado.

---

## 📱 Descargar Compilados

En GitHub:
1. Actions → Build iOS App
2. Último run
3. **Artifacts** → `build-output`
4. Download

---

## 🚀 Script Automático

```bash
bash github-actions-setup.sh
```

Te pregunta nombre/email y hace todo automáticamente.

---

## 📚 Documentación Completa

Lee [GITHUB_ACTIONS.md](GITHUB_ACTIONS.md) para configuración avanzada.

---

**🎉 ¡Tu app se compila en GitHub automáticamente!**
