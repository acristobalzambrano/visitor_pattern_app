import 'package:visitor_pattern_app/domain/entities/building.dart';
import 'package:visitor_pattern_app/domain/entities/visitor/visitor_building.dart';

class Residential extends Building {
  Residential({
    required this.rooms,
    required this.bathrooms,
    required this.hasGarage,
    required super.nombre,
    required super.direccion,
  });

  final int rooms;
  final int bathrooms;
  final bool hasGarage;

  @override
  String getBuildingInfo() {
    return 'Nombre: $nombre\n'
        'Dirección: $direccion\n'
        'Habitaciones: $rooms\n'
        'Baños: $bathrooms\n'
        'Garaje: ${hasGarage ? 'Sí' : 'No'}';
  }

  String exportPdfForResidential() {
    return 'Generando poliza de seguro para la residencia $nombre';
  }

  @override
  String accept(VisitorBuilding visitor) {
    return visitor.visitResidential(this);
  }
}
