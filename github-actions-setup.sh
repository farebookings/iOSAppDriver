#!/bin/bash

# Script para configurar GitHub Actions en el proyecto iOS
# Ejecutar: bash github-actions-setup.sh

set -e

echo "🚀 Configurando GitHub Actions para iOS App..."
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Verificar que estamos en el directorio correcto
if [ ! -f "iOSAppDriver.swift" ]; then
    echo -e "${RED}❌ Error: Ejecuta este script desde la carpeta raíz del proyecto${NC}"
    exit 1
fi

# Verificar git
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Error: Git no está instalado${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Git encontrado${NC}"

# Verificar estado del repositorio
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}⚠️  No hay repositorio git. Inicializando...${NC}"
    git init
    echo -e "${GREEN}✅ Repositorio git inicializado${NC}"
fi

# Verificar configuración git
if [ -z "$(git config user.name)" ]; then
    read -p "📝 Tu nombre completo: " git_name
    git config user.name "$git_name"
fi

if [ -z "$(git config user.email)" ]; then
    read -p "📧 Tu email: " git_email
    git config user.email "$git_email"
fi

echo -e "${GREEN}✅ Configuración git completada${NC}"
echo ""

# Mostrar archivos
echo -e "${YELLOW}📁 Archivos en el proyecto:${NC}"
ls -la *.swift *.plist Info.plist 2>/dev/null || true
echo ""

# Agregar archivos
echo -e "${YELLOW}📦 Agregando archivos al repositorio...${NC}"
git add .
echo -e "${GREEN}✅ Archivos preparados${NC}"

# Commit
echo -e "${YELLOW}💾 Creando commit...${NC}"
COMMIT_MSG="🎉 Initial iOS App with GitHub Actions"
if git commit -m "$COMMIT_MSG" 2>/dev/null; then
    echo -e "${GREEN}✅ Commit creado${NC}"
else
    echo -e "${YELLOW}⚠️  No hay cambios nuevos${NC}"
fi

# Mostrar rama actual
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo -e "${YELLOW}📌 Rama actual: ${CURRENT_BRANCH}${NC}"

# Push (con manejo de errores)
echo ""
echo -e "${YELLOW}🚀 Push al repositorio remoto...${NC}"
echo "nota: Si pides contraseña, necesitas configurar SSH o usar tokens de GitHub"
echo ""

if git push -u origin "$CURRENT_BRANCH" 2>&1 | grep -q "Everything up-to-date\|Enumerating"; then
    echo -e "${GREEN}✅ Push completado${NC}"
else
    echo -e "${YELLOW}⚠️  Verifica la conexión remota${NC}"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}✨ GitHub Actions Setup Completado!${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Próximos pasos:"
echo "1. Ve a GitHub y abre tu repositorio"
echo "2. Haz clic en la pestaña 'Actions'"
echo "3. Activa los workflows si es necesario"
echo "4. Los workflows se ejecutarán automáticamente en el próximo push"
echo ""
echo "📚 Más información: lee GITHUB_ACTIONS.md"
echo ""
