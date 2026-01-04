import 'package:customer_ui/core/constant/app_color.dart';
import 'package:customer_ui/core/utils/customervalidator.dart';
import 'package:customer_ui/core/widgets/custom_button.dart';
import 'package:customer_ui/core/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerOrder extends StatelessWidget {
  const CustomerOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.appbackground,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 24),
                Text(
                  'Create Customer Order',
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 12),
            CustomTextField(
              width: 366,
              height: 56,
              hintText: 'Enter Name',
              labelText: 'Full Name ',
              keyboardType: TextInputType.text,
              validator: CustomerValidators.name,
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
            ),
            SizedBox(height: 8),
            CustomTextField(
              width: 366,
              height: 56,
              hintText: 'Enter Email',
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
              validator: CustomerValidators.email,
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
            ),
            SizedBox(height: 8),
            CustomTextField(
              width: 366,
              height: 56,
              hintText: 'Enter Phone',
              labelText: 'Phone',
              keyboardType: TextInputType.phone,
              validator: CustomerValidators.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(10)],
            ),
            SizedBox(height: 8),
            CustomTextField(
              width: 366,
              height: 56,
              hintText: 'Enter City',
              labelText: 'City',
              keyboardType: TextInputType.text,
              validator: (v) => CustomerValidators.onlyLetters('City', v),
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
            ),
            SizedBox(height: 8),
            CustomTextField(
              width: 366,
              height: 56,
              hintText: 'Enter Street Name',
              labelText: 'Street Name ',
              keyboardType: TextInputType.text,
              validator: CustomerValidators.address,
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
            ),
            SizedBox(height: 12),
            CustomButton(
              width: 366,
              height: 56,
              text: 'Save Changes',
              onPressed: () {},
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
