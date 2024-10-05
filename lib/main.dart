import 'package:flutter/material.dart';
import 'package:otop_front/components/auth.dart';
import 'package:otop_front/pages/desktop_admin_dashboard.dart';
import 'package:otop_front/pages/desktop_cashier_dashboard.dart';
import 'package:otop_front/pages/desktop_supplier_dashboard.dart';
import 'package:otop_front/pages/mobile_admin_dashboard.dart';
import 'package:otop_front/pages/mobile_cashier_dashboard.dart';
import 'package:otop_front/pages/mobile_supplier_dashboard.dart';
import 'package:otop_front/pages/responsive_dashboard_cashier.dart';
import 'package:otop_front/pages/responsive_dashboard_layout.dart';
import 'package:otop_front/pages/responsive_dashboard_supplier.dart';
import 'package:otop_front/pages/tablet_admin_dashboard.dart';
import 'package:otop_front/pages/tablet_cashier_dashboard.dart';
import 'package:otop_front/pages/tablet_supplier_dashboard.dart';
import 'package:otop_front/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override  
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthForm(),
      routes: {
        '/login': (context) => const AuthForm(),
        '/admin': (context) => const ResponsiveDashboardLayout(
              mobileAdminDashboard: MobileAdminDashboard(),
              tabletAdminDashboard: TabletAdminDashboard(),
              desktopAdminDashboard: DesktopAdminDashboard(),
            ),
        '/cashier': (context) => const ResponsiveDashboardCashier(
              mobileCashierDashboard: MobileCashierDashboard(),
              tabletCashierDashboard: TabletCashierDashboard(),
              desktopCashierDashboard: DesktopCashierDashboard(),
            ),
        '/supplier': (context) => const ResponsiveDashboardSupplier(
              mobileSupplierDashboard: MobileSupplierDashboard(),
              tabletSupplierDashboard: TabletSupplierDashboard(),
              desktopSupplierDashboard: DesktopSupplierDashboard(),
            ),
      },
      ),
    );
  }
}

