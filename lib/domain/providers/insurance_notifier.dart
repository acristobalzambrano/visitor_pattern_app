import 'package:flutter/material.dart';
import 'package:visitor_pattern_app/domain/entities/bank.dart';
import 'package:visitor_pattern_app/domain/entities/building.dart';
import 'package:visitor_pattern_app/domain/entities/coffe_shop.dart';
import 'package:visitor_pattern_app/domain/entities/residential.dart';
import 'package:visitor_pattern_app/domain/constants/constants.dart';

class InsuranceNotifier extends ChangeNotifier {
  List<Building> buildings = [
    // Bank(
    //   nombre: 'Banco Interbank',
    //   direccion: 'Av las fresas 123',
    //   bankIdentifierCode: 'ASD123',
    //   numberOfATMs: 2,
    //   hasSecurityGuard: false,
    // ),
    // CoffeShop(
    //   nombre: 'Cafe internet Pepito',
    //   direccion: 'Av 10 de Agosto S/N',
    //   nit: '123456789',
    //   hasDeliveryService: true,
    //   titular: 'Pedro Suarez',
    // ),
    // Residential(
    //   nombre: 'Los portales 1',
    //   direccion: 'Los olivos 123',
    //   rooms: 4,
    //   bathrooms: 2,
    //   hasGarage: false,
    // ),
  ];

  String selectedDropDownItem = 'Residencial';

  String firstLabelText = 'Ingrese número de habitaciones';
  String secondLabelText = 'Ingrese número de baños';
  String thirdLabelText = 'Garage';

  bool checkboxState = false;

  String buildingName = '';
  String buildingAddress = '';
  String firstInput = '';
  String secondInput = '';

  void setSelectedDropDownItem(String value) {
    selectedDropDownItem = value;
    _updateLabels();
    notifyListeners();
  }

  void setCheckboxState(bool value) {
    checkboxState = value;
    notifyListeners();
  }

  void _updateLabels() {
    final Map<String, List<String>> buildingLabels = {
      Constants.residential: [
        'Ingrese número de habitaciones',
        'Ingrese número de baños',
        'Garage'
      ],
      Constants.bank: [
        'Ingrese BIC',
        'Ingrese número de cajeros',
        'Personal de seguridad',
      ],
      Constants.coffe: [
        'Ingrese NIT',
        'Ingrese nombre del titular',
        'Servicio a domicilio'
      ],
    };
    final labels = buildingLabels[selectedDropDownItem];
    if (labels != null) {
      firstLabelText = labels[0];
      secondLabelText = labels[1];
      thirdLabelText = labels[2];
    }
  }

  void addBuilding() {
    switch (selectedDropDownItem) {
      case Constants.residential:
        buildings.add(
          Residential(
            nombre: buildingName,
            direccion: buildingAddress,
            rooms: int.parse(firstInput),
            bathrooms: int.parse(secondInput),
            hasGarage: checkboxState,
          ),
        );
        break;
      case Constants.bank:
        buildings.add(
          Bank(
            nombre: buildingName,
            direccion: buildingAddress,
            bankIdentifierCode: firstInput,
            numberOfATMs: int.parse(secondInput),
            hasSecurityGuard: checkboxState,
          ),
        );
        break;
      case Constants.coffe:
        buildings.add(
          CoffeShop(
            nombre: buildingName,
            direccion: buildingAddress,
            nit: firstInput,
            titular: secondInput,
            hasDeliveryService: checkboxState,
          ),
        );
        break;
    }
  }
}
