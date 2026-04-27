#!/bin/bash

# Script para configurar el proyecto iOS en Xcode
# Uso: bash setup.sh

echo "🍎 Configurando proyecto iOS App Driver..."

# Verifica que estamos en el directorio correcto
if [ ! -f "Info.plist" ]; then
    echo "❌ Error: Ejecuta este script desde la carpeta del proyecto"
    exit 1
fi

echo "✅ Proyecto encontrado"
echo ""
echo "Pasos siguientes:"
echo "1. Abre Xcode"
echo "2. Selecciona File > New > Project"
echo "3. Elige App bajo iOS"
echo "4. Configura como:"
echo "   - Product Name: iOSAppDriver"
echo "   - Team: Tu equipo"
echo "   - Organization: Tu organización"
echo "   - Bundle Identifier: com.tucompania.iosappdriver"
echo "   - Interface: SwiftUI"
echo "   - Language: Swift"
echo ""
echo "5. Copia los archivos .swift a tu proyecto Xcode"
echo "6. Reemplaza Info.plist con el incluido"
echo "7. Presiona Cmd+R para ejecutar"
echo ""
echo "✨ ¡Listo!"
