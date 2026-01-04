import 'package:customer_ui/core/constant/app_color.dart';
import 'package:customer_ui/core/constant/productitem.dart';
import 'package:customer_ui/core/constant/sizeconstant.dart';
import 'package:customer_ui/core/widgets/custom_appbar.dart';
import 'package:customer_ui/core/widgets/custom_button.dart';
import 'package:customer_ui/core/widgets/customtextfield.dart';
import 'package:customer_ui/features/customer/presentation/customerorder.dart';
import 'package:customer_ui/features/customer/widget/productlistcustom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ordersummary extends StatelessWidget {
  const Ordersummary({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: CustomAppbar(title: 'Order Summary'),
      backgroundColor: AppColor.appbackground,
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(height: 12),
            CustomTextField(
              width: 366,
              icons: Image.asset(
                'assets/images/magnifying.png',
                width: 24,
                height: 24,
              ),
              hintText: 'Search by product name or SKU',
              labelText: '',
              controller: searchController,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 12),

            // CustomProductListItem(
            //   title: 'CozyCore Knit Sweater',
            //   variant: 'M/ Gray',
            //   quantity: 01,
            //   price: 'Rs 1999',
            // ),
            // SizedBox(height: 12),
            // CustomProductListItem(
            //   title: 'NoirFlex Casual Shirt',
            //   variant: 'L/ Gray',
            //   quantity: 02,
            //   price: 'Rs 4098',
            // ),
            // SizedBox(height: 12),
            // CustomProductListItem(
            //   title: 'VoltSprint X1',
            //   variant: 'XL/ Gray',
            //   quantity: 01,
            //   price: 'Rs 5970',
            // ),
            // SizedBox(height: 12),
            // CustomProductListItem(
            //   title: 'UrbanStride Neo',
            //   variant: 'M/ Black',
            //   quantity: 02,
            //   price: 'Rs 8869',
            // ),
            // SizedBox(height: 12),
            // Container(
            //   height: 88,
            //   width: 366,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(6),
            //     border: Border.all(width: 1, color: Color(0xFFE6E6E6)),
            //   ),
            //   child: Padding(
            //     padding: EdgeInsetsGeometry.symmetric(
            //       horizontal: 16,
            //       vertical: 12,
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(
            //               'Order Summary',
            //               style: GoogleFonts.nunito(
            //                 fontSize: AppSize.primaryTextSize,
            //                 fontWeight: FontWeight.w700,
            //                 color: AppColor.buttonColor,
            //               ),
            //             ),
            //             SizedBox(height: 8),
            //             RichText(
            //               text: TextSpan(
            //                 children: [
            //                   TextSpan(
            //                     text: 'Grand total: ',
            //                     style: GoogleFonts.poppins(
            //                       fontSize: AppSize.size14text,
            //                       color: AppColor.searchTextcolor,
            //                     ),
            //                   ),
            //                   TextSpan(
            //                     text: 'Rs 27274',
            //                     style: GoogleFonts.poppins(
            //                       fontSize: AppSize.size14text,
            //                       fontWeight: FontWeight.w600,
            //                       color: AppColor.searchTextcolor,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         ),
            //         Icon(
            //           Icons.keyboard_arrow_down,
            //           size: 24,
            //           color: AppColor.searchTextcolor,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              child: ListView.separated(
                itemCount: products.length + 1,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  if (index < products.length) {
                    final product = products[index];

                    return CustomProductListItem(
                      title: product.title,
                      variant: product.variant,
                      quantity: product.quantity,
                      price: 'Rs ${product.price}',
                      imagePath: product.image,
                      onMoreTap: () {
                        // Beamer.of(context).beamToNamed('/')
                      },
                    );
                  }

                  return Container(
                    height: 88,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xFFE6E6E6),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order Summary',
                              style: GoogleFonts.nunito(
                                fontSize: AppSize.primaryTextSize,
                                fontWeight: FontWeight.w700,
                                color: AppColor.buttonColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Grand total: ',
                                    style: GoogleFonts.poppins(
                                      fontSize: AppSize.size14text,
                                      color: AppColor.searchTextcolor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Rs $grandTotal',
                                    style: GoogleFonts.poppins(
                                      fontSize: AppSize.size14text,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.searchTextcolor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                          color: AppColor.searchTextcolor,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Center(
              child: CustomButton(
                text: 'Create Order',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CustomerOrder();
                    },
                  );
                },
                width: 334,
                height: 56,
              ),
            ),
            SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
