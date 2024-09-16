import 'package:visitor_pattern_app/domain/entities/bank.dart';
import 'package:visitor_pattern_app/domain/entities/coffe_shop.dart';
import 'package:visitor_pattern_app/domain/entities/residential.dart';
import 'package:visitor_pattern_app/domain/entities/visitor/visitor_building.dart';

class GeneratorInvoiceImpl implements VisitorBuilding {
  @override
  String visitBank(Bank bank) {
    return 'Visitante Generando recibo para el banco ${bank.nombre}';
  }

  @override
  String visitCoffeShop(CoffeShop coffeShop) {
    return 'Visitante Generando recibo para el banco ${coffeShop.nombre}';
  }

  @override
  String visitResidential(Residential residential) {
    return 'Visitante Generando recibo para el banco ${residential.nombre}';
  }
}
