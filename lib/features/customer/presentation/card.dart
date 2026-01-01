import 'package:customer_ui/core/constant/customer_drop.dart';
import 'package:customer_ui/core/constant/language.dart';
import 'package:customer_ui/core/constant/payment.dart';
import 'package:customer_ui/core/utils/phonenovalid.dart';
import 'package:customer_ui/core/widgets/custom_button.dart';
import 'package:customer_ui/core/widgets/customdropdown.dart';
import 'package:customer_ui/core/widgets/customtextfield.dart';
import 'package:customer_ui/features/customer/widget/sectiontitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomerSection { personal, address, legal, preference }

class ExtendedOnAdded extends StatefulWidget {
  const ExtendedOnAdded({super.key});

  @override
  State<ExtendedOnAdded> createState() => _ExtendedOnAddedState();
}

class _ExtendedOnAddedState extends State<ExtendedOnAdded> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = {
    'name': TextEditingController(),
    'email': TextEditingController(),
    'phone': TextEditingController(),
    'altPhone': TextEditingController(),
    'address': TextEditingController(),
    'ward': TextEditingController(),
    'municipality': TextEditingController(),
    'district': TextEditingController(),
    'province': TextEditingController(),
    'citizenship': TextEditingController(),
    'pan': TextEditingController(),
  };

  String? selectedPayment;
  String? selectedLanguage;
  String? selectedCategory;
  CustomerSection? openSection;

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      minChildSize: 0.6,
      maxChildSize: 0.95,
      builder: (_, scrollController) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _header(context),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitle(
                          'Personal Information',
                          title: 'Personal Information',
                          expanded: openSection == CustomerSection.personal,
                          onTap: () => setState(() {
                            openSection =
                                openSection == CustomerSection.personal
                                ? null
                                : CustomerSection.personal;
                          }),
                        ),
                        if (openSection == CustomerSection.personal) ...[
                          field(
                            'Customer Name',
                            'Enter full name',
                            _controllers['name']!,

                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Customer name is required';
                              }
                              if (value.trim().length > 50) {
                                return 'Customer name must be less than or equal to 50 characters';
                              }
                              return null;
                            },
                          ),
                          field(
                            'Email',
                            'Enter email',
                            _controllers['email']!,
                            type: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email is required';
                              }
                              final email = value.trim();
                              if (email.length > 50) {
                                return 'Email must not exceed 50 characters';
                              }
                              if (!email.contains('@') ||
                                  !email.endsWith('.com')) {
                                return 'Enter a valid email (must contain @ and end with .com)';
                              }
                              return null;
                            },
                          ),
                          field(
                            'Phone',
                            'Enter phone number',
                            _controllers['phone']!,
                            type: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Phone number is required';
                              }
                              final phone = value.trim();
                              final regx = RegExp(r'9\d{9}$');
                              if (!regx.hasMatch(phone)) {
                                return 'Phone number must contain exactly 10 digits';
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                          ),
                          field(
                            'Alternative Phone',
                            'Alternative Phone',
                            _controllers['altPhone']!,
                            type: TextInputType.phone,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Phone number is required';
                              }
                              final phone = value.trim();
                              final regx = RegExp(r'9\d{9}$');
                              if (!regx.hasMatch(phone)) {
                                return 'Phone number must contain exactly 10 digits';
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              PhoneNumberFormatter(maxLength: 10),
                            ],
                          ),
                        ],

                        SectionTitle(
                          'Address Information',
                          title: 'Address Information',
                          expanded: openSection == CustomerSection.address,
                          onTap: () {
                            setState(() {
                              openSection =
                                  openSection == CustomerSection.address
                                  ? null
                                  : CustomerSection.address;
                            });
                          },
                        ),
                        if (openSection == CustomerSection.address) ...[
                          field(
                            'Street Address',
                            'Enter address',
                            _controllers['address']!,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Street address is required';
                              }
                              if (value.length > 100) {
                                return 'Street address cannot exceed 100 characters';
                              }
                              return null;
                            },
                          ),
                          field(
                            'Ward No',
                            'Enter ward',
                            _controllers['ward']!,
                            type: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ward number is required';
                              }
                              final numValue = int.tryParse(value);
                              if (numValue == null || numValue <= 0) {
                                return 'Enter a valid ward number';
                              }
                              return null;
                            },
                          ),
                          field(
                            'Municipality',
                            'Enter municipality',
                            _controllers['municipality']!,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Municipality is required';
                              }
                              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                                return 'Only letters allowed';
                              }
                              return null;
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                            ],
                          ),
                          field(
                            'District',
                            'Enter district',
                            _controllers['district']!,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'District is required';
                              }
                              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                                return 'Only letters allowed';
                              }
                              return null;
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                            ],
                          ),
                          field(
                            'Province',
                            'Enter province',
                            _controllers['province']!,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Province is required';
                              }
                              if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                                return 'Only letters allowed';
                              }
                              return null;
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                            ],
                          ),
                        ],

                        SectionTitle(
                          'Legal Information',
                          title: 'Legal Information',
                          expanded: openSection == CustomerSection.legal,
                          onTap: () {
                            setState(() {
                              openSection = openSection == CustomerSection.legal
                                  ? null
                                  : CustomerSection.legal;
                            });
                          },
                        ),
                        if (openSection == CustomerSection.legal) ...[
                          field(
                            'Citizenship No',
                            'Enter citizenship no',
                            _controllers['citizenship']!,
                            type: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Citizenship number is required';
                              }
                              final cnum = value.trim();
                              final regx = RegExp(r'\d{14}$');
                              if (!regx.hasMatch(cnum)) {
                                return 'citizenship number must contain exactly 14 digits';
                              }
                              return null;
                            },
                          ),
                          field(
                            'PAN No',
                            'Enter PAN no',
                            _controllers['pan']!,
                            type: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Phone number is required';
                              }
                              final pan = value.trim();
                              final regx = RegExp(r'\d{9}$');
                              if (!regx.hasMatch(pan)) {
                                return 'Pan number must contain exactly 9 digits';
                              }
                              return null;
                            },
                          ),
                        ],

                        SectionTitle(
                          'Legal Information',
                          title: 'Preferences',
                          expanded: openSection == CustomerSection.preference,
                          onTap: () {
                            setState(() {
                              openSection =
                                  openSection == CustomerSection.preference
                                  ? null
                                  : CustomerSection.preference;
                            });
                          },
                        ),
                        if (openSection == CustomerSection.preference) ...[
                          CustomDropdown(
                            hint: 'Payment Method',
                            items: paymentMethods,
                            onChanged: (val) =>
                                setState(() => selectedPayment = val),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select Payment Methods';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          CustomDropdown(
                            hint: 'Preferred Language',
                            items: nepaliLanguages,
                            onChanged: (val) =>
                                setState(() => selectedLanguage = val),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select Language.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          CustomDropdown(
                            hint: 'Customer Category',
                            items: customerCategories,
                            onChanged: (val) =>
                                setState(() => selectedCategory = val),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select Customer Type';
                              }
                              return null;
                            },
                          ),
                        ],

                        const SizedBox(height: 24),
                        Center(
                          child: SizedBox(
                            width: 240,

                            child: CustomButton(
                              height: 56,
                              text: 'Save Customer',
                              iconPath: 'assets/images/addcustomer.png',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final customerData = {
                                    'name': _controllers['name']!.text.trim(),
                                    'email': _controllers['email']!.text.trim(),
                                    'phone': _controllers['phone']!.text.trim(),
                                    'address': _controllers['address']!.text
                                        .trim(),
                                    'ward': _controllers['ward']!.text.trim(),
                                    'municipality':
                                        _controllers['municipality']!.text
                                            .trim(),
                                    'district': _controllers['district']!.text
                                        .trim(),
                                    'province': _controllers['province']!.text
                                        .trim(),
                                    'citizenship': _controllers['citizenship']!
                                        .text
                                        .trim(),
                                    'pan': _controllers['pan']!.text.trim(),
                                    'payment': selectedPayment,
                                    'language': selectedLanguage,
                                    'category': selectedCategory,
                                  };

                                  debugPrint('Saving customer: $customerData');
                                }
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _header(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 24),
        Text(
          'Add New Customer',
          style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

Widget field(
  String label,
  String hint,
  TextEditingController controller, {
  TextInputType type = TextInputType.text,
  FormFieldValidator<String>? validator,
  List<dynamic>? inputFormatters,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: CustomTextField(
      controller: controller,
      labelText: label,
      enabled: true,
      hintText: hint,
      keyboardType: type,
      validator: validator,
      inputFormatters: inputFormatters,
    ),
  );
}
