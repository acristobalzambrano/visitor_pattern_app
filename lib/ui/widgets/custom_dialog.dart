import 'package:flutter/material.dart';
import 'package:visitor_pattern_app/domain/entities/building.dart';
import 'package:visitor_pattern_app/domain/entities/visitor/visitor_building.dart';
import 'package:visitor_pattern_app/ui/widgets/custom_snack_bar.dart';

import '../../domain/entities/impl/generator_pdf_impl.dart';

class CustomDialog {
  static Future<void> dialogBuilder(BuildContext context, Building building) {
    // final message = building is Bank
    //     ? building.exportPdfForBank()
    //     : building is Residential
    //         ? building.exportPdfForResidential()
    //         : building is CoffeShop
    //             ? building.exportPdfForCoffe()
    //             : '';

    VisitorBuilding visitorGenerador = GeneratorPdfImpl();
    final message = building.accept(visitorGenerador);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Información del edificio'),
          content: Text(building.getBuildingInfo()),
          actions: <Widget>[
            Center(
              child: OutlinedButton(
                onPressed: () {
                  CustomSnackBar.showSnackBar(context, message);
                  Navigator.of(context).pop();
                },
                child: const Text('Generar seguro PDF'),
              ),
            ),
          ],
        );
      },
    );
  }
}
