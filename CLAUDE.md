# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

A Flutter Pokédex app: browses Pokémon fetched from PokéAPI, shows Pokémon details, and includes a camera-based image recognition screen backed by a TensorFlow Lite model. SDK constraints: Dart `>=3.4.3 <4.0.0`, Flutter `>=3.22.2`.

## Commands

- Install dependencies: `flutter pub get`
- Run the app: `flutter run`
- Analyze/lint: `flutter analyze`
- Run all tests: `flutter test`
- Run a single test file: `flutter test test/data/entities/pokedex_entry_test.dart`
- Regenerate localizations (after editing `lib/l10n/app_en.arb`): `flutter gen-l10n`

iOS/macOS builds use CocoaPods (`ios/Podfile`, `macos/Podfile`); run `pod install` in the respective platform directory if native dependencies change.

## Architecture

### Screen module pattern: Provider / Controller / Screen

Each feature under `lib/screens/<feature>/` is split into three parts, wired together with the `provider` package:

- **`*_provider.dart`** — a `StatelessWidget` that constructs dependencies (HTTP client, repository, `Interpreter`, etc.), wraps them in a `Provider`/`ValueNotifier`, and renders the corresponding `*_screen.dart`. This is the composition root for that screen — dependencies are built here, not injected globally.
- **`*_controller.dart`** — a `ValueNotifier<State>` holding an immutable state class for the screen (e.g. `PokemonListState`) and the async logic that mutates it (e.g. `fetch()`). Screens read it via `context.read<Controller>()` and rebuild with `ValueListenableBuilder`.
- **`*_screen.dart`** — the `StatelessWidget` UI, dumb with respect to data fetching; delegates interaction callbacks upward (e.g. `onItemClick`) and navigation via `Navigator.pushNamed`.

`PokemonListScreen` and `PokemonDetailScreen` follow this pattern fully; `Application` (`lib/application.dart`) sets `initialRoute` to `PokemonListScreen.route`.

### Data layer

`lib/data/` holds repository interfaces with a `Default*`/`Tensorflow*` implementation each — always code against the abstract interface (`PokedexRepository`, `ImageRecognitionRepository`), not the concrete class, since these are injected per-screen in the `*_provider.dart` files rather than through a global service locator:

- `PokedexRepository` (`pokedex_repository.dart`) fetches a Pokédex page from `https://pokeapi.co/api/v2` via `package:http` and decodes it into the `lib/data/entities/` model chain: `Pokedex` → `PokedexEntry` (has `formattedId`/`imageUrl` derived getters) → `Specie`.
- `ImageRecognitionRepository` (`image_recognition_repository.dart`) wraps a `tflite_flutter` `Interpreter` loaded from `assets/models/image-recognition.tflite`; the `predict()` implementation is currently a stub (hardcoded input, unused output param) — do not treat it as a working model integration yet.

### Routing

Routes are named strings declared as static `route` constants on each screen class, registered centrally in `lib/shared/routes/application_routes.dart` (`buildRoutes()`), and passed to `MaterialApp.routes` in `lib/application.dart`. Screens that need arguments (e.g. `PokemonDetailProvider`) pull them from `ModalRoute.of(context)?.settings.arguments`, so `Navigator.pushNamed` callers must pass `arguments:` explicitly (see `PokemonListScreen._onItemClick`).

### Localization

Uses Flutter's built-in `gen-l10n` (config in `l10n.yaml`, ARB source at `lib/l10n/app_en.arb`, generated code at `lib/l10n/app_localizations.dart`). Access strings via `AppLocalizations.of(context)!`.

### Theming

`lib/core/design_system/theme.dart` centralizes `ColorScheme`/`ThemeData` construction (`buildColorScheme()`, `buildTheme()`); Material 3 is enabled.

### Camera / ML

`cameras` (the list of available `CameraDescription`s from `package:camera`) is initialized once in `main()` and referenced as a top-level late variable from `lib/main.dart` — screens needing camera access import `main.dart` directly rather than receiving it via DI.
