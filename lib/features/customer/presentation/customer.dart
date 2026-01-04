import 'package:customer_ui/core/constant/app_color.dart';
import 'package:customer_ui/core/constant/data.dart';
import 'package:customer_ui/core/widgets/custom_appbar.dart';
import 'package:customer_ui/core/widgets/custom_button.dart';
import 'package:customer_ui/core/widgets/customer_card.dart';
import 'package:customer_ui/core/widgets/customtextfield.dart';
import 'package:customer_ui/core/widgets/singlebutton.dart';
import 'package:customer_ui/features/customer/presentation/extended_on_added.dart';
import 'package:customer_ui/provider/add_customer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Customer extends ConsumerStatefulWidget {
  const Customer({super.key});

  @override
  ConsumerState<Customer> createState() => _CustomerState();
}

class _CustomerState extends ConsumerState<Customer> {
  final TextEditingController textController = TextEditingController();
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    final showAddForm = ref.watch(addCustomerVisibleProvider);

    return Scaffold(
      appBar: CustomAppbar(
        title: 'Customer',
        showBack: false,
        notificationCount: 52,
      ),
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextField(
                  width: 320,
                  icons: Image.asset(
                    'assets/images/magnifying.png',
                    width: 24,
                    height: 24,
                  ),
                  hintText: 'Search..',
                  labelText: 'Search',
                  controller: textController,
                  keyboardType: TextInputType.text,
                ),
                Singlebutton(
                  icon: Image.asset(
                    'assets/images/funnel.png',
                    width: 24,
                    height: 24,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 12),

            if (showAddForm) const ExtendedOnAdded(),

            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: customers.length,
                  itemBuilder: (context, index) {
                    return CustomerCard(
                      data: customers[index],
                      isExpanded: expandedIndex == index,
                      onTap: () {
                        setState(() {
                          expandedIndex = expandedIndex == index ? null : index;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomButton(
        text: 'Add new Customer',
        iconPath: 'assets/images/addcustomer.png',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return ExtendedOnAdded();
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
