import 'package:uuid/uuid.dart';

final uuid = const Uuid();

final List<Map<String, dynamic>> customer = [
  {
    "uuid": uuid.v4(),
    "full_name": "Ava Thompson",
    "phone": "9841234567",
    "email": "ava.thompson@email.com",
    "is_active": true,
    "loyalty_points": 450,
    "last_purchase_date": "2025-12-12",
    "address": {
      "address_line": "Unknown",
      "ward": null,
      "municipality": "Kathmandu",
      "district": "Kathmandu",
      "province": "Bagmati",
    },
    "preferences": {
      "language": "English",
      "payment": "Cash",
      "category": "Retail",
    }
  },
  {
    "uuid": uuid.v4(),
    "full_name": "Liam Patel",
    "phone": "9812345678",
    "email": "liam.patel@email.com",
    "is_active": true,
    "loyalty_points": 450,
    "last_purchase_date": "2025-12-12",
    "address": {
      "address_line": "Unknown",
      "ward": null,
      "municipality": "Pokhara",
      "district": "Kaski",
      "province": "Gandaki",
    },
    "preferences": {
      "language": "English",
      "payment": "eSewa",
      "category": "Retail",
    }
  },
  {
    "uuid": uuid.v4(),
    "full_name": "Sofia Chen",
    "phone": "9823456789",
    "email": "sofia.chen@email.com",
    "is_active": true,
    "loyalty_points": 450,
    "last_purchase_date": "2025-12-12",
    "address": {
      "address_line": "Unknown",
      "ward": null,
      "municipality": "Lalitpur",
      "district": "Lalitpur",
      "province": "Bagmati",
    },
    "preferences": {
      "language": "English",
      "payment": "Cash",
      "category": "Retail",
    }
  },
  {
    "uuid": uuid.v4(),
    "full_name": "Noah Williams",
    "phone": "9823456789",
    "email": "noah.williams@email.com",
    "is_active": true,
    "loyalty_points": 450,
    "last_purchase_date": "2025-12-12",
    "address": {
      "address_line": "Unknown",
      "ward": null,
      "municipality": "Lalitpur",
      "district": "Lalitpur",
      "province": "Bagmati",
    },
    "preferences": {
      "language": "English",
      "payment": "Cash",
      "category": "Retail",
    }
  },
  {
    "uuid": uuid.v4(),
    "full_name": "Isabella Garcia",
    "phone": "9823456789",
    "email": "isabella.garcia@email.com",
    "is_active": true,
    "loyalty_points": 450,
    "last_purchase_date": "2025-12-12",
    "address": {
      "address_line": "Unknown",
      "ward": null,
      "municipality": "Lalitpur",
      "district": "Lalitpur",
      "province": "Bagmati",
    },
    "preferences": {
      "language": "English",
      "payment": "Cash",
      "category": "Retail",
    }
  },
  {
    "uuid": uuid.v4(),
    "full_name": "Ethan Kim",
    "phone": "9823456789",
    "email": "ethan.kim@email.com",
    "is_active": true,
    "loyalty_points": 450,
    "last_purchase_date": "2025-12-12",
    "address": {
      "address_line": "Unknown",
      "ward": null,
      "municipality": "Lalitpur",
      "district": "Lalitpur",
      "province": "Bagmati",
    },
    "preferences": {
      "language": "English",
      "payment": "Cash",
      "category": "Retail",
    }
  }
];
