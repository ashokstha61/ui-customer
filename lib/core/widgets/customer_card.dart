import 'package:beamer/beamer.dart';
import 'package:customer_ui/core/widgets/custom_button.dart';
import 'package:customer_ui/core/widgets/info_card.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool isExpanded;
  final VoidCallback onTap;

  const CustomerCard({
    super.key,
    required this.data,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundImage: AssetImage(data['image']!),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['name']!,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text(
                        data['email']!,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  isExpanded
                      ? 'assets/images/uparrow.png'
                      : 'assets/images/downarrow.png',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),

          if (isExpanded) ...[
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(
                  label: 'Phone',
                  value: data['phone']!,
                  label1: 'Status',
                  value1: data['status'] ?? 'n/a',
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                InfoCard(
                  label: 'Loyanty point',
                  value: data['loyalty_point']!,
                  label1: 'Last Date Purchase',
                  value1: data['purchase date'] ?? 'N/A',
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Create Order',
                    iconPath: 'assets/images/cart.png',
                    onPressed: () {},
                    buttonType: ButtonType.elevated,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    text: 'View',
                    iconPath: 'assets/images/eye.png',
                    onPressed: () {
                      Beamer.of(context).beamToNamed('/customer/details',data:data);
                    },
                    buttonType: ButtonType.outlined,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
