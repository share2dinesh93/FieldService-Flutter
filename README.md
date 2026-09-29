# FieldService Flutter

A deliberately small field-service app showing maintainable Flutter structure: Riverpod state management, repository boundaries, Dio networking, local status persistence, routing and tests.

## Flow
Dashboard -> Work Orders -> Work Order Details -> Start/Complete job.

## Run
```bash
flutter pub get
flutter run
flutter test
```

The sample reads public placeholder tasks from JSONPlaceholder and stores local work-order status with SharedPreferences. No credentials are required.
