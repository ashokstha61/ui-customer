import 'package:customer_ui/core/constant/customer_drop.dart';
import 'package:customer_ui/core/constant/language.dart';
import 'package:customer_ui/core/constant/payment.dart';
import 'package:customer_ui/core/widgets/custom_button.dart';
import 'package:customer_ui/core/widgets/customdropdown.dart';
import 'package:customer_ui/core/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExtendedOnAdded extends StatefulWidget {
  const ExtendedOnAdded({super.key});

  @override
  State<ExtendedOnAdded> createState() => _ExtendedOnAddedState();
}

class _ExtendedOnAddedState extends State<ExtendedOnAdded> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController adderssController = TextEditingController();
  final TextEditingController alterPhoneController = TextEditingController();
  final TextEditingController wardController = TextEditingController();
  final TextEditingController municipalityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController citizenNoController = TextEditingController();
  final TextEditingController panController = TextEditingController();
  String? selectedPayment;
  String? selectedLanguage;
  String? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: SafeArea(
        
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 8),
                    Text(
                      'Add New Customer',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),

                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 15,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset(
                          'assets/images/x-close.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
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
                        SizedBox(height: 8),
                        CustomTextField(
                          controller: phoneController,
                          hintText: 'Enter Customer Phone Number',
                          labelText: 'Customer Phone Number',
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          controller: adderssController,
                          hintText: 'Enter Customer Street Address',
                          labelText: 'Customer Street Address',
                          keyboardType: TextInputType.streetAddress,
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          controller: alterPhoneController,
                          hintText: 'Enter Customer Alternative Phone',
                          labelText: 'Alternative Phone',
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          controller: wardController,
                          hintText: 'Enter Customer Ward ',
                          labelText: 'Customer Ward No',
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          controller: municipalityController,
                          hintText: 'Enter Customer Municapility',
                          labelText: 'Customer Municapility',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          controller: districtController,
                          hintText: 'Enter Customer Disrtict',
                          labelText: 'Customer District',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          controller: provinceController,
                          hintText: 'Enter Customer Province',
                          labelText: 'Province',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          controller: citizenNoController,
                          hintText: 'Enter Citizenship No ',
                          labelText: 'Customer Citizenship No',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 8),
                        CustomTextField(
                          controller: panController,
                          hintText: 'Enter Customer Pan No',
                          labelText: 'Customer Pan No',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          hint: 'Select the options',
                          items: paymentMethods,
                          onChanged: (val) {
                            setState(() {
                              selectedPayment = val;
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          hint: 'Select the options',
                          items: nepaliLanguages,
                          onChanged: (val) {
                            setState(() {
                              selectedLanguage = val;
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        CustomDropdown(
                          hint: 'Select the options',
                          items: customerCategories,
                          onChanged: (val) {
                            setState(() {
                              selectedCategory = val;
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        Center(
                          child: CustomButton(
                            height: 60,
                            width: 366,
                            text: 'Save Customer',
                            iconPath: 'assets/images/addcustomer.png',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    
    );
  }
}
