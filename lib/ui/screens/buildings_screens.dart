import 'package:flutter/material.dart';
import 'package:visitor_pattern_app/ui/widgets/building_list_tile.dart';
import 'package:visitor_pattern_app/ui/widgets/custom_dialog.dart';

import '../../domain/entities/bank.dart';
import '../../domain/entities/building.dart';
import '../../domain/entities/coffe_shop.dart';
import '../../domain/entities/residential.dart';

class BuildingsScreens extends StatelessWidget {
  const BuildingsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    List<Building> buildings = [
      Bank(
        nombre: 'Banco Interbank',
        direccion: 'Av las fresas 123',
        bankIdentifierCode: 'ASD123',
        numberOfATMs: 2,
        hasSecurityGuard: false,
      ),
      CoffeShop(
        nombre: 'Cafe internet Pepito',
        direccion: 'Av 10 de Agosto S/N',
        nit: '123456789',
        hasDeliveryService: true,
        titular: 'Pedro Suarez',
      ),
      Residential(
        nombre: 'Los portales 1',
        direccion: 'Los olivos 123',
        rooms: 4,
        bathrooms: 2,
        hasGarage: false,
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Visitas'),
        ),
        body: ListView.builder(
          itemCount: buildings.length,
          itemBuilder: (context, index) {
            return BuildingListTile(
              building: buildings[index],
              onTap: () {
                CustomDialog.dialogBuilder(
                  context,
                  buildings[index],
                );
              },
            );
          },
        ));
  }
}
