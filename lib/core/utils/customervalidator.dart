class CustomerValidators {
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Customer name is required';
    }
    if (value.trim().length > 50) {
      return 'Customer name must be less than or equal to 50 characters';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final email = value.trim();
    if (email.length > 50) {
      return 'Email must not exceed 50 characters';
    }
    if (!email.contains('@') || !email.endsWith('.com')) {
      return 'Enter a valid email (must contain @ and end with .com)';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final regx = RegExp(r'^9\d{9}$');
    if (!regx.hasMatch(value.trim())) {
      return 'Phone number must contain exactly 10 digits';
    }
    return null;
  }

  static String? address(String? value) {
    if (value == null || value.isEmpty) {
      return 'Street address is required';
    }
    if (value.length > 100) {
      return 'Street address cannot exceed 100 characters';
    }
    return null;
  }

  static String? ward(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ward number is required';
    }
    final numValue = int.tryParse(value);
    if (numValue == null || numValue <= 0) {
      return 'Enter a valid ward number';
    }
    return null;
  }

  static String? onlyLetters(String fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Only letters allowed';
    }
    return null;
  }

  static String? citizenship(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Citizenship number is required';
    }
    if (!RegExp(r'^\d{14}$').hasMatch(value.trim())) {
      return 'Citizenship number must contain exactly 14 digits';
    }
    return null;
  }

  static String? pan(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'PAN number is required';
    }
    if (!RegExp(r'^\d{9}$').hasMatch(value.trim())) {
      return 'PAN number must contain exactly 9 digits';
    }
    return null;
  }

  static String? dropdown(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }
}
