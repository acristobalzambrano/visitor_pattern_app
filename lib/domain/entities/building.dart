import 'package:visitor_pattern_app/domain/entities/visitor/visitor_building.dart';

abstract class Building {
  String nombre;
  String direccion;

  Building({required this.nombre, required this.direccion});

  String getBuildingInfo();
  String accept(VisitorBuilding visitor);
}
