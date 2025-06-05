import 'package:go_router/go_router.dart';

import '../pages/donation_list_page.dart';
import 'donation_routes.dart';

abstract class DonationPages {
  static final List<GoRoute> routes = [
    GoRoute(path: DonationRoutes.donationList, name: DonationRoutes.donationList, builder: (context, state) => const DonationListPage()),
  ];
}
