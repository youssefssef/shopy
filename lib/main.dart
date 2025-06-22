import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopy/core/router/app_router.dart';
import 'package:shopy/presentation/view/cart/cart_viewModel.dart';
import 'package:shopy/presentation/view/checkout/chekout_viewmodel.dart';
import 'package:shopy/presentation/view/favorites/favorites_viewmodel.dart';
import 'package:shopy/presentation/view/home/home_viewmodel.dart';
import 'package:shopy/services/order_service.dart';
import 'package:shopy/services/product_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    /*DevicePreview(
      enabled: !kReleaseMode, 
      builder: (context) => MyApp(prefs: prefs),
    ),*/
    MyApp(prefs: prefs),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.prefs});
  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(ProductService())..fetchProducts(),
        ),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        ChangeNotifierProvider(create: (_) => FavoritesViewModel()),
        ChangeNotifierProvider(
          create:
              (_) =>
                  CheckoutViewModel(prefs, OrderService())..loadPlacedOrders(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        routerConfig: appRouter,
        //locale: DevicePreview.locale(context), //  for DevicePreview
        // builder: DevicePreview.appBuilder, //  for DevicePreview
      ),
    );
  }
}
