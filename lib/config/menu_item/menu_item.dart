import 'package:flutter/material.dart';
import 'package:visitor_pattern_app/domain/constants/constants.dart';

class MenuItem {
  final String title;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.icon,
  });
}

const homeMenuItems = <MenuItem>[
  MenuItem(title: 'Registrar Edificio', icon: Icons.add_home_work_rounded),
  MenuItem(title: 'Generar Poliza', icon: Icons.security_rounded)
];

const buildingMenuItems = <MenuItem>[
  MenuItem(title: Constants.residential, icon: Icons.add_home_work_rounded),
  MenuItem(title: Constants.bank, icon: Icons.security_rounded),
  MenuItem(title: Constants.coffe, icon: Icons.security_rounded),
];
