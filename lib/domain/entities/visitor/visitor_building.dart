import 'package:visitor_pattern_app/domain/entities/bank.dart';
import 'package:visitor_pattern_app/domain/entities/coffe_shop.dart';
import 'package:visitor_pattern_app/domain/entities/residential.dart';

abstract class VisitorBuilding {
  String visitResidential(Residential residential);
  String visitBank(Bank bank);
  String visitCoffeShop(CoffeShop coffeShop);
}
