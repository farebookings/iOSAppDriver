# 🔍 Troubleshooting - Por qué no ves Artifacts

## 🚨 Posibles Causas

### 1️⃣ **Workflows aún en progreso** ⏳
- **Síntoma:** No ves artifacts pero el workflow sigue corriendo
- **Solución:** Espera 5-10 minutos más
- **Cómo verificar:** 
  - Abre: https://github.com/farebookings/iOSAppDriver/actions
  - Busca el ícono de círculo/reloj ⏳ (en progreso)
  - Espera a que cambie a ✅ (éxito) o ❌ (fallo)

---

### 2️⃣ **Workflow falló con error** ❌
- **Síntoma:** Ves la X roja ❌ en el workflow
- **Solución:** Ver logs de error
- **Cómo ver logs:**
  1. Abre: https://github.com/farebookings/iOSAppDriver/actions
  2. Haz clic en el workflow fallido
  3. Expande cada **step** para ver la salida
  4. Busca **[error]** o **[ERROR]**
  5. Nota el error y reporta

---

### 3️⃣ **GitHub Actions no está habilitado** 🔒
- **Síntoma:** No ves workflow alguno corriendo
- **Solución:** Habilitar Actions en GitHub
- **Cómo hacerlo:**
  1. Ve a tu repo: https://github.com/farebookings/iOSAppDriver
  2. **Settings** → **Actions** → **General**
  3. Selecciona: **"Allow all actions and reusable workflows"**
  4. Click **Save**
  5. Espera a que aparezcan los workflows

---

### 4️⃣ **Archivos no sincronizados con GitHub** 💾
- **Síntoma:** Los workflows no tienen los archivos Swift
- **Solución:** Hacer un nuevo push
- **Comandos:**
  ```bash
  cd /home/kmz/Proyectos/ios/iOSAppDriver
  git add -A
  git commit -m "Test push to trigger workflows"
  git push origin main
  ```

---

### 5️⃣ **Workflow corre pero falla al generar .xcodeproj** 🔨
- **Síntoma:** ✅ Status pero error en "Generate Xcode Project"
- **Solución:** El gem `xcodeproj` tiene problemas
- **Cómo verificar:**
  1. En el workflow, expande **"Generate Xcode Project"**
  2. Busca líneas con **[error]**
  3. Frecuentemente dice: `Cannot find resource` o `Rake related errors`

---

## ✅ Pasos de Diagnóstico

### Paso 1: Verificar estado del repo en GitHub
```bash
# En tu terminal
git status
git remote -v
git log --oneline -5
```

### Paso 2: Forzar nuevo build
```bash
# Hacer un pequeño cambio y push
echo "# Updated" >> README.md
git add README.md
git commit -m "🔄 Trigger workflow"
git push origin main
```

### Paso 3: Monitorear el build
1. Abre https://github.com/farebookings/iOSAppDriver/actions
2. Refresca página cada 10 segundos (F5)
3. Observa el ícono del workflow:
   - 🟠 Naranja = En progreso
   - 🟢 Verde = Éxito
   - 🔴 Rojo = Error

### Paso 4: Ver logs completos
1. Haz clic en el workflow
2. Selecciona el job "build"
3. Expande cada step
4. Busca palabras clave:
   - `error`
   - `failed`
   - `Error`
   - `FAILED`

---

## 🛠️ Soluciones Comunes

### Problema: "Scheme not found"
```
error: The scheme 'iOSAppDriver' does not exist.
```
**Solución:**
```bash
# Verificar schemes disponibles localmente
xcodebuild -list -project iOSAppDriver.xcodeproj
```

### Problema: "Cannot find resource"
```
error: Cannot find resource for '/path/to/Package.swift'
```
**Solución:**
- El workflow está generando mal el .xcodeproj
- Hacer commit limpiador y re-intentar

### Problema: "Permission denied"
```
sudo: gem: order not found
```
**Solución:**
- Ruby no está disponible en el runner
- Usar acción alternativa (menos probable en macOS)

---

## 🎯 Checklist Rápido

```
¿Qué debo hacer AHORA?

[ ] 1. Abre https://github.com/farebookings/iOSAppDriver/actions
[ ] 2. ¿Ves algún workflow corriendo/completado?
      SÍ → Ve al paso 4
      NO → Ve al paso 3

[ ] 3. GitHub Actions no está habilitado
      → Settings → Actions → Allow all actions → Save
      → Espera 1 minuto
      → Vuelve al paso 1

[ ] 4. ¿El workflow muestra ✅ o ❌?
      ✅ VERDE → Ve al paso 6 (buscar artifacts)
      ❌ ROJO → Ve al paso 5 (diagnosticar error)
      ⏳ NARANJA → Espera 5-10 minutos → Vuelve al paso 1

[ ] 5. Ver error en workflow fallido
      → Expande cada step
      → Copia el mensaje de error exacto
      → Anótalo para reportar

[ ] 6. Buscar Artifacts
      → Si ves ✅, baja al final de la página
      → Busca sección "Artifacts"
      → Descarga "build-output"
```

---

## 📞 Información para Reportar Problemas

Si aún no ves artifacts después de estos pasos, proporciona:

1. **Estado del workflow:**
   ```
   ✅ Éxito / ❌ Fallo / ⏳ En progreso
   ```

2. **Nombre del step que falla:**
   ```
   Ej: "Build iOS App" o "Generate Xcode Project"
   ```

3. **Mensaje de error exacto:**
   ```
   Copiar todo lo que dice [ERROR] o [error]
   ```

4. **Link al workflow:**
   ```
   https://github.com/farebookings/iOSAppDriver/actions/runs/XXXXX
   ```

5. **Qué ves:**
   ```
   ☐ No hay workflows
   ☐ Workflow falló
   ☐ Workflow completado pero sin artifacts
   ☐ Otro: _______________
   ```

---

## 🆘 Soluciones de Último Recurso

### Opción A: Limpiar y re-hacer push
```bash
git reset --soft HEAD~1
git add -A
git commit -m "♻️ Retry build"
git push -f origin main
```

### Opción B: Crear tag de release
Los tags `v*` disparan el workflow `release.yml`:
```bash
git tag -a v1.0.0 -m "Release 1.0.0"
git push origin v1.0.0
```

### Opción C: Disparar workflow manualmente
En GitHub UI:
1. **Actions** → Selecciona workflow
2. **Run workflow** (botón azul)
3. Selecciona **main** branch
4. **Run workflow**

---

**Última actualización:** 27 de abril de 2026  
**Para más ayuda:** Revisa BUILD_STATUS.md y GITHUB_ACTIONS.md
