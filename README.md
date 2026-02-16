# QR Startup (Flutter + Clean Architecture)

## 1) Estructura del proyecto

```text
lib/
  app/
    app.dart
    di/
      injection_container.dart
    router/
      app_router.dart
  core/
    permissions/
      camera_permission_service.dart
    security/
      url_safety_validator.dart
    theme/
      app_theme.dart
      design_tokens.dart
  features/
    scanner/
      presentation/
        bloc/
        pages/
        widgets/
      domain/
        entities/
        repositories/
        usecases/
      data/
        datasources/
        models/
        repositories/
    generator/
      presentation/
        bloc/
        pages/
      domain/
        entities/
        repositories/
        usecases/
      data/
        datasources/
        models/
        repositories/
  l10n/
    app_en.arb
    app_es.arb
```

## 2) Arquitectura

- **Clean Architecture** en cada feature: `presentation`, `domain`, `data`.
- **BLoC** para separar lógica de UI y minimizar rebuilds.
- **go_router** para navegación declarativa.
- **Core shared** para tema, permisos y seguridad.

## 3) Ejemplo funcional completo del scanner

- Detección y clasificación de contenido con `ProcessScanContent`.
- Historial local, favoritos, y validación básica de URL maliciosa.
- BLoC: `ScannerBloc` con eventos para iniciar, detectar y marcar favorito.

## 4) Ejemplo funcional completo del generador

- Tipos de payload soportados (URL, texto, WiFi, WhatsApp, redes, pago, etc.).
- Preview QR y guardado de presets.
- BLoC: `GeneratorBloc` para tipo, valor y persistencia local.

## 5) ThemeData personalizado

- Paleta vibrante + gradientes + profundidad en `design_tokens.dart`.
- Modo claro/oscuro automático con `ThemeMode.system`.
- Base Material 3 con identidad visual startup.

## 6) Paquetes recomendados

- `flutter_bloc`, `equatable`
- `go_router`
- `mobile_scanner`
- `qr_flutter`, `flutter_svg`
- `permission_handler`, `local_auth`
- `shared_preferences`
- `url_launcher`, `share_plus`, `image_picker`

## 7) Recomendaciones para publicar en Play Store

1. Activar ofuscación y split per ABI para reducir tamaño.
2. Firmar con keystore separada por entorno y usar CI.
3. Completar Data Safety + política de privacidad para cámara/galería.
4. Añadir analíticas y crash reporting antes de producción.
5. Preparar versión Pro con feature flags y catálogo in-app.
