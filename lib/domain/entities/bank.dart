import 'package:visitor_pattern_app/domain/entities/building.dart';
import 'package:visitor_pattern_app/domain/entities/visitor/visitor_building.dart';

class Bank extends Building {
  Bank({
    required this.bankIdentifierCode,
    required this.numberOfATMs,
    required this.hasSecurityGuard,
    required super.nombre,
    required super.direccion,
  });

  final String bankIdentifierCode;
  final int numberOfATMs;
  final bool hasSecurityGuard;

  @override
  String getBuildingInfo() {
    return 'Nombre: $nombre\n'
        'Dirección: $direccion\n'
        'BIC: $bankIdentifierCode\n'
        'Cajeros: $numberOfATMs\n'
        'Personal de seguridad: ${hasSecurityGuard ? 'Sí' : 'No'}';
  }

  String exportPdfForBank() {
    return 'Generando poliza de seguro para el banco $nombre';
  }

  @override
  String accept(VisitorBuilding visitor) {
    return visitor.visitBank(this);
  }
}
