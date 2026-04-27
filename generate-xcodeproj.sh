#!/bin/bash
# Generar proyecto Xcode desde Package.swift usando xcodeproj gem
# Uso: bash generate-xcodeproj.sh

set -e

PROJECT_NAME="iOSAppDriver"
PROJECT_PATH="${PROJECT_NAME}.xcodeproj"

if [ -d "$PROJECT_PATH" ]; then
    echo "✅ $PROJECT_PATH ya existe"
    exit 0
fi

echo "🔨 Generando $PROJECT_PATH desde Package.swift..."

# Instalar xcodeproj gem si no está instalado
if ! gem list xcodeproj -i > /dev/null 2>&1; then
    echo "📦 Instalando xcodeproj..."
    sudo gem install xcodeproj --no-document 2>/dev/null || gem install xcodeproj --no-document
fi

# Generar xcodeproj desde Package.swift
if command -v xcodeproj &>/dev/null; then
    xcodeproj generate-xcodeproj --path .
    echo "✅ $PROJECT_PATH generado exitosamente"
else
    echo "⚠️ xcodeproj no disponible - Instrucciones manuales:"
    echo ""
    echo "En tu Mac, ejecuta:"
    echo "  1. gem install xcodeproj"
    echo "  2. cd /path/to/iOSAppDriver"
    echo "  3. xcodeproj generate-xcodeproj --path ."
    echo "  4. git add iOSAppDriver.xcodeproj/"
    echo "  5. git commit -m '📦 Generated Xcode project'"
    echo "  6. git push"
    echo ""
    exit 1
fi

