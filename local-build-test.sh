#!/bin/bash
# Script para simular localmente lo que hace GitHub Actions
# Uso: bash local-build-test.sh

set -e

PROJECT_NAME="iOSAppDriver"
WORKSPACE_PATH="/home/kmz/Proyectos/ios/iOSAppDriver"

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║         🔨 SIMULANDO BUILD DE GITHUB ACTIONS LOCALMENTE        ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

cd "$WORKSPACE_PATH"

echo "📋 PASO 1: Verificar estructura"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ls -la Package.swift && echo "  ✅ Package.swift presente" || echo "  ❌ Package.swift FALTA"
ls -la Sources/iOSAppDriver/*.swift && echo "  ✅ Archivos Swift presentes" || echo "  ❌ Archivos Swift FALTAN"
echo ""

echo "📦 PASO 2: Verificar si xcodeproj está disponible"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if command -v xcodeproj &>/dev/null; then
    echo "  ✅ xcodeproj command disponible"
    xcodeproj --version
else
    echo "  ❌ xcodeproj NO disponible - necesita gem install xcodeproj"
fi
echo ""

echo "🔨 PASO 3: Intentar generar Xcode project"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -f "iOSAppDriver.xcodeproj/project.pbxproj" ]; then
    echo "  ✅ Xcode project ya existe"
else
    echo "  📝 Generando proyecto..."
    if command -v xcodeproj &>/dev/null; then
        xcodeproj generate-xcodeproj --path . 2>&1 | head -10
        echo "  ✅ Proyecto generado"
    else
        echo "  ⚠️  xcodeproj no disponible - saltando generación"
    fi
fi
echo ""

echo "🍎 PASO 4: Verificar xcodebuild"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if command -v xcodebuild &>/dev/null; then
    echo "  ✅ xcodebuild disponible"
    xcodebuild -version
else
    echo "  ❌ xcodebuild NO disponible (necesita Xcode en macOS)"
fi
echo ""

echo "📋 PASO 5: Listar schemes"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [ -d "iOSAppDriver.xcodeproj" ] && command -v xcodebuild &>/dev/null; then
    xcodebuild -list -project iOSAppDriver.xcodeproj 2>&1 | head -20
else
    echo "  ⚠️  No se puede listar schemes (falta xcodeproj o xcodebuild)"
fi
echo ""

echo "📊 RESULTADO DEL DIAGNÓSTICO"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "✅ Si ves todos los checks verdes: GitHub Actions también compilará OK"
echo "❌ Si ves checks rojos: El mismo error ocurrirá en GitHub"
echo ""
echo "💡 NOTA: En GitHub Actions (macOS), todo debería funcionar correctamente."
echo "         Si aquí fallan cosas, es porque no estás en macOS."
echo ""
