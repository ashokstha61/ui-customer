import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final customers = [
  {
    'name': 'Ava Thompson',
    'email': 'ava.thompson@email.com',
    'phone': '+977-9841234567',
    'image': 'assets/images/profile.jpg',
    'loyalty_point': '450',
    'date purchase': '2025/12/12',
    'status ': 'Active',
  },
  {
    'name': 'Liam Patel',
    'email': 'liam.patel@email.com',
    'phone': '+977-9812345678',
    'city': 'Pokhara',
    'image': 'assets/images/profile.jpg',
    'loyalty_point': '450',
    'date purchase': '2025/12/12',
    'status ': 'Active',
  },

  {
    'name': 'Sofia Chen',
    'email': 'sofia.chen@email.com',
    'phone': '+977-9823456789',
    'city': 'Lalitpur',
    'image': 'assets/images/profile.jpg',
    'loyalty_point': '450',
    'date purchase': '2025/12/12',
    'status ': 'Active',
  },
  {
    'name': 'Noah Williams',
    'email': 'noah.williams@email.com',
    'phone': '+977-9823456789',
    'city': 'Lalitpur',
    'image': 'assets/images/profile.jpg',
    'loyalty_point': '450',
    'date purchase': '2025/12/12',
    'status ': 'Active',
  },
  {
    'name': 'Isabella Garcia',
    'email': 'isabella.garcia@email.com',
    'phone': '+977-9823456789',
    'city': 'Lalitpur',
    'image': 'assets/images/profile.jpg',
    'loyalty_point': '450',
    'date purchase': '2025/12/12',
    'status ': 'Active',
  },
  {
    'name': 'Ethan Kim',
    'email': 'ethan.kim@email.com',
    'phone': '+977-9823456789',
    'city': 'Lalitpur',
    'image':'assets/images/profile.jpg',
    'loyalty_point': '450',
    'date purchase': '2025/12/12',
    'status ': 'Active',
  },
  {
    'name': 'Ethan Kim',
    'email': 'ethan.kim@email.com',
    'phone': '+977-9823456789',
    'city': 'Lalitpur',
    'image': 'assets/images/profile.jpg',
    'loyalty_point': '450',
    'date purchase': '2025/12/12',
    'status ': 'Active',
  },
];

void main() {
  final uuid = Uuid();

  final formattedCustomers = customers.map((customer) {
    return {
      "uuid": uuid.v4(),
      "full_name": customer['name'],
      "phone": customer['phone']?.replaceAll('+977-', ''),
      "email": customer['email'],
      "is_active": (customer['status ']?.toLowerCase() == 'active'),
      "loyalty_points": int.tryParse(customer['loyalty_point'] ?? '0') ?? 0,
      "last_purchase_date": customer['date purchase']?.replaceAll('/', '-'),
    };
  }).toList();

  debugPrint(jsonEncode(formattedCustomers));
}
