import 'package:go_router/go_router.dart';

import '../pages/donation_list_page.dart';
import 'donation_routes.dart';

abstract class DonationPages {
  static final List<GoRoute> routes = [
    GoRoute(path: DonationRoutes.donation, name: DonationRoutes.donation, builder: (context, state) => const DonationPage()),
  ];
}
