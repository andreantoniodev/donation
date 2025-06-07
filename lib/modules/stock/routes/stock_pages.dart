import 'package:go_router/go_router.dart';

import '../pages/stock_page.dart';
import 'stock_routes.dart';

abstract class StockPages {
  static final List<GoRoute> routes = [GoRoute(path: StockRoutes.stock, name: StockRoutes.stock, builder: (context, state) => const StockPage())];
}
