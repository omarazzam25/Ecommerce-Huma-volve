import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

import 'core/di.dart';
import 'core/theme.dart';
import 'features/home/domain/use_cases/get_product_by_id_use_case.dart';
import 'features/details/screens/product_details_screen.dart';
import 'features/main_navigation/screens/main_navigation_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppLinks _appLinks = AppLinks();

  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();

    _listenToLinks();
  }

  Future<void> _listenToLinks() async {
    // Listen for links received while the app is running.
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (uri) {
        _handleDeepLink(uri);
      },
      onError: (Object error) {
        debugPrint('Deep link error: $error');
      },
    );

    // Handle the link that launched the app.
    try {
      final initialUri = await _appLinks.getInitialLink();

      if (initialUri != null) {
        _handleDeepLink(initialUri);
      }
    } catch (error) {
      debugPrint('Initial deep link error: $error');
    }
  }

  Future<void> _handleDeepLink(Uri uri) async {
    // Expected link: huma-vole://product/15
    if (uri.scheme != 'huma-vole' ||
        uri.host != 'product' ||
        uri.pathSegments.length != 1) {
      return;
    }

    final productId = int.tryParse(uri.pathSegments.first);

    if (productId == null || productId <= 0) {
      debugPrint('Invalid product ID in deep link: $uri');
      return;
    }

    try {
      final getProductById = getIt<GetProductByIdUseCase>();
      final result = await getProductById.call(productId);

      result.fold(
        (failure) {
          debugPrint('Failed to load product: ${failure.errMessage}');
        },
        (product) {
          final navigator = navigatorKey.currentState;

          if (navigator == null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _openProduct(product);
            });
            return;
          }

          _openProduct(product);
        },
      );
    } catch (error) {
      debugPrint('Unable to open linked product: $error');
    }
  }

  void _openProduct(product) {
    final navigator = navigatorKey.currentState;

    if (navigator == null) return;

    navigator.push(
      MaterialPageRoute(
        builder: (_) => ProductDetailsScreen(productsModel: product),
      ),
    );
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const MainNavigationScreen(),
    );
  }
}
