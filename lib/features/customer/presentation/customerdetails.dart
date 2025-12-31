import 'package:beamer/beamer.dart';
import 'package:customer_ui/core/constant/app_color.dart';
import 'package:customer_ui/core/constant/customer_drop.dart';
import 'package:customer_ui/core/constant/language.dart';
import 'package:customer_ui/core/constant/payment.dart';
import 'package:customer_ui/core/widgets/custom_appbar.dart';
import 'package:customer_ui/core/widgets/custom_button.dart';
import 'package:customer_ui/core/widgets/custom_section.dart';
import 'package:customer_ui/core/widgets/customdropdown.dart';
import 'package:customer_ui/core/widgets/customtextfield.dart';
import 'package:customer_ui/features/customer/widget/displayrow.dart';
import 'package:flutter/material.dart';

final Map<String, dynamic> customerData = {
  "uuid": "550e8400-e29b-41d4-a716-446655440000",
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
  },
};

class Customerdetails extends StatefulWidget {
  const Customerdetails({super.key});

  @override
  State<Customerdetails> createState() => _CustomerdetailsState();
}

class _CustomerdetailsState extends State<Customerdetails> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController wardController;
  late TextEditingController municipalityController;
  late TextEditingController districtController;
  late TextEditingController provinceController;
  late TextEditingController addressLineController;

  String? selectedPayment;
  String? selectedLanguage;
  String? selectedCategory;

  bool isEditMode = false;

  @override
  void initState() {
    super.initState();

    final address = customerData['address'] as Map<String, dynamic>;
    final preferences = customerData['preferences'] as Map<String, dynamic>;

    nameController = TextEditingController(
      text: customerData['full_name'] ?? '',
    );
    emailController = TextEditingController(text: customerData['email'] ?? '');
    phoneController = TextEditingController(text: customerData['phone'] ?? '');
    wardController = TextEditingController(
      text: address['ward']?.toString() ?? '',
    );
    municipalityController = TextEditingController(
      text: address['municipality'] ?? '',
    );
    districtController = TextEditingController(text: address['district'] ?? '');
    provinceController = TextEditingController(text: address['province'] ?? '');
    addressLineController = TextEditingController(
      text: address['address_line'] ?? '',
    );

    selectedPayment = preferences['payment'];
    selectedLanguage = preferences['language'];
    selectedCategory = preferences['category'];
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    wardController.dispose();
    municipalityController.dispose();
    districtController.dispose();
    provinceController.dispose();
    addressLineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isActive = customerData['is_active'] as bool;
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Customer Details',
      ),
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          // decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SectionCard(
                  title: 'Basic Info ',
                  children: [
                    if (isEditMode) ...[
                      CustomTextField(
                        controller: nameController,
                        hintText: 'Enter Customer Name',
                        labelText: 'Customer Name',
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Enter email',
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: phoneController,
                        hintText: 'Enter Customer Phone Number',
                        labelText: 'Customer Phone Number',
                        keyboardType: TextInputType.phone,
                      ),
                    ] else ...[
                      DisplayRowWidget(
                        label: 'Full Name',
                        value: customerData['full_name'] ?? 'N/A',
                      ),
                      const SizedBox(height: 12),
                      DisplayRowWidget(
                        label: 'Email',
                        value: customerData['email'] ?? 'N/A',
                      ),
                      const SizedBox(height: 12),
                      DisplayRowWidget(
                        label: 'Phone',
                        value: customerData['phone'] ?? 'N/A',
                      ),
                    ],
                    const SizedBox(height: 8),

                    DisplayRowWidget(
                      label: 'Loyalty Points',
                      value: '${customerData['loyalty_points'] ?? 0} points',
                    ),
                    Text(
                      isActive ? 'Active' : 'Inactive',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SectionCard(
                  title: 'Address Info',
                  children: [
                    if (isEditMode) ...[
                      CustomTextField(
                        controller: addressLineController,
                        hintText: 'Enter Address Line',
                        labelText: 'Address Line',
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: wardController,
                        hintText: 'Enter Ward Number',
                        labelText: 'Ward No',
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: municipalityController,
                        hintText: 'Enter Municipality',
                        labelText: 'Municipality',
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: districtController,
                        hintText: 'Enter District',
                        labelText: 'District',
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: provinceController,
                        hintText: 'Enter Province',
                        labelText: 'Province',
                        keyboardType: TextInputType.text,
                      ),
                    ] else ...[
                      DisplayRowWidget(
                        label: 'Address Line',
                        value: customerData['address']['address_line'] ?? 'N/A',
                      ),
                      const SizedBox(height: 12),
                      DisplayRowWidget(
                        label: 'Ward No',
                        value:
                            customerData['address']['ward']?.toString() ??
                            'Not specified',
                      ),
                      const SizedBox(height: 12),
                      DisplayRowWidget(
                        label: 'Municipality',
                        value: customerData['address']['municipality'] ?? 'N/A',
                      ),
                      const SizedBox(height: 12),
                      DisplayRowWidget(
                        label: 'District',
                        value: customerData['address']['district'] ?? 'N/A',
                      ),
                      const SizedBox(height: 12),
                      DisplayRowWidget(
                        label: 'Province',
                        value: customerData['address']['province'] ?? 'N/A',
                      ),
                    ],
                  ],
                ),
                SectionCard(
                  title: 'Preferences & Loyalty',
                  children: [
                    if (isEditMode) ...[
                      CustomDropdown(
                        hint: 'Select payment method',
                        items: paymentMethods,
                        onChanged: (val) {
                          setState(() {
                            selectedPayment = val;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CustomDropdown(
                        hint: 'Select language',
                        items: nepaliLanguages,
                        onChanged: (val) {
                          setState(() {
                            selectedLanguage = val;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CustomDropdown(
                        hint: 'Select category',
                        items: customerCategories,
                        onChanged: (val) {
                          setState(() {
                            selectedCategory = val;
                          });
                        },
                      ),
                    ] else ...[
                      DisplayRowWidget(
                        label: 'Preferred Language',
                        value: customerData['preferences']['language'] ?? 'N/A',
                      ),
                      const SizedBox(height: 12),
                      DisplayRowWidget(
                        label: 'Preferred Payment',
                        value: customerData['preferences']['payment'] ?? 'N/A',
                      ),
                      const SizedBox(height: 12),
                      DisplayRowWidget(
                        label: 'Category',
                        value: customerData['preferences']['category'] ?? 'N/A',
                      ),
                    ],
                  ],
                ),
                if (isEditMode) ...[
                  CustomButton(
                    text: 'Save',
                    iconPath: 'assets/images/addcustomer.png',
                    onPressed: () {
                      saveChanges();
                      setState(() {
                        isEditMode = false;
                      });
                    },
                  ),
                ] else ...[
                  CustomButton(
                    text: 'Edit',
                    iconPath: 'assets/images/addcustomer.png',
                    onPressed: () {
                      setState(() {
                        isEditMode = true;
                      });
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveChanges() {
    final updatedCustomer = {
      ...customerData,
      "full_name": nameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      "address": {
        ...customerData['address'],
        "address_line": addressLineController.text,
        "ward": wardController.text.isNotEmpty
            ? int.tryParse(wardController.text)
            : null,
        "municipality": municipalityController.text,
        "district": districtController.text,
        "province": provinceController.text,
      },
      "preferences": {
        ...customerData['preferences'],
        "language": selectedLanguage,
        "payment": selectedPayment,
        "category": selectedCategory,
      },
    };
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Customer details updated successfully!. '),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
    debugPrint('Updated customer: $updatedCustomer');
  }
}
