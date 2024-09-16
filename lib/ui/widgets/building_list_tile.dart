import 'package:flutter/material.dart';
import 'package:visitor_pattern_app/domain/entities/building.dart';
import 'package:visitor_pattern_app/domain/entities/coffe_shop.dart';
import 'package:visitor_pattern_app/domain/entities/residential.dart';

import '../../domain/entities/bank.dart';

class BuildingListTile extends StatelessWidget {
  const BuildingListTile({
    super.key,
    required this.building,
    required this.onTap,
  });

  final Building building;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final IconData icon = _getIconFromType(building);

    return ListTile(
      leading: Icon(icon),
      title: Text(building.nombre),
      subtitle: Text(building.direccion),
      onTap: () => onTap(),
    );
  }

  IconData _getIconFromType(Building building) {
    if (building is Bank) {
      return Icons.assured_workload_rounded;
    } else if (building is CoffeShop) {
      return Icons.coffee_maker_rounded;
    } else if (building is Residential) {
      return Icons.home_rounded;
    } else {
      throw Exception('Tipo de edificio no soportado');
    }
  }
}
