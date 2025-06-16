import '../../domain.dart';

enum DonationStatus {
  open('Aberto'),
  pending('Pendente'),
  done('Concluído');

  const DonationStatus(this.value);

  final String value;

  static DonationStatus byName(String name) {
    return DonationStatus.values.firstWhere((e) => e.name == name);
  }
}

class DonationModel {
  DonationModel({this.uuid, required this.donor, required this.status, this.donation_date, required this.items});

  final String? uuid;
  final UserModel donor;
  final DonationStatus status;
  final DateTime? donation_date;
  final List<FoodModel> items;
}
