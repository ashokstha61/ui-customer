import 'package:customer_ui/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:customer_ui/core/constant/app_color.dart';

class CustomProductListItem extends StatelessWidget {
  final String title;
  final String variant;
  final int quantity;
  final String price;
  final IconData leadingIcon;
  final VoidCallback? onMoreTap;
  final String imagePath;

  const CustomProductListItem({
    super.key,
    required this.title,
    required this.variant,
    required this.quantity,
    required this.price,
    this.leadingIcon = Icons.shopping_basket_rounded,
    this.onMoreTap,
    required,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366,
      height: 112,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey[200],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Icon(leadingIcon, size: 80),
          Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.contain),
          const SizedBox(width: 12),

          /// Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Row(
                  children: [
                    Text(
                      variant,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 16,
                      width: 1,
                      color: AppColor.secondaryTextColor,
                    ),
                    const SizedBox(width: 8),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'QTY: ',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: AppColor.searchTextcolor,
                            ),
                          ),
                          TextSpan(
                            text: quantity.toString().padLeft(2, '0'),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColor.searchTextcolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColor.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ),

          PopupMenuButton(
            color: Colors.transparent,
            elevation: 0,
            offset: Offset(-35, 600),

            itemBuilder: (context) => [
              PopupMenuItem(
                enabled: false,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomButton(
                        width: 382,
                        height: 56,
                        iconPath: 'assets/images/delete.png',
                        buttonType: ButtonType.outlined,
                        text: 'Delete Category',
                        textColor: AppColor.redTextColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 12),
                      CustomButton(
                        width: 382,
                        height: 56,
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
            child: const Icon(Icons.more_vert, size: 24),
          ),

          // InkWell(
          //   onTap: () {
          //     showModalBottomSheet(
          //       context: context,
          //       backgroundColor: Colors.transparent, 
          //       isScrollControlled: true,
          //       builder: (context) {
          //         return Column(
          //           children: [
          //             Spacer(),
          //             Center(
          //               child: Container(
          //                 width: double.infinity,
          //                 height: 200,
          //                 padding: const EdgeInsets.all(20),
          //                 decoration: BoxDecoration(
          //                   color: Colors.transparent,
          //                   borderRadius: BorderRadius.circular(16),
          //                 ),
          //                 child: Column(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     CustomButton(
          //                       width: 382,
          //                       height: 56,
          //                       iconPath: 'assets/images/delete.png',
          //                       buttonType: ButtonType.outlined,
          //                       text: 'Delete Category',
          //                       onPressed: () {
          //                         Navigator.pop(context);
          //                       },
          //                     ),
          //                     const SizedBox(height: 12),
          //                     CustomButton(
          //                       width: 382,
          //                       height: 56,
          //                       text: 'Cancel',
          //                       onPressed: () {
          //                         Navigator.pop(context);
          //                       },
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         );
          //       },
          //     );
          //   },
          //   child: const Icon(Icons.more_vert, size: 24),
          // ),
        ],
      ),
    );
  }
}
