import 'package:visitor_pattern_app/domain/entities/building.dart';
import 'package:visitor_pattern_app/domain/entities/visitor/visitor_building.dart';

class CoffeShop extends Building {
  CoffeShop({
    required this.nit,
    required this.hasDeliveryService,
    required this.titular,
    required super.nombre,
    required super.direccion,
  });

  final String nit;
  final String titular;
  final bool hasDeliveryService;

  @override
  String getBuildingInfo() {
    return 'Nombre: $nombre\n'
        'Dirección: $direccion\n'
        'NIT: $nit\n'
        'Titular: $titular\n'
        'Servicio de delivery: ${hasDeliveryService ? 'Sí' : 'No'}';
  }

  String exportPdfForCoffe() {
    return 'Generando poliza de seguro para la cafeteria $nombre';
  }

  @override
  String accept(VisitorBuilding visitor) {
    return visitor.visitCoffeShop(this);
  }
}
