import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown extends FormField<String> {
  CustomDropdown({
    super.key,
    required List<String> items,
    required void Function(String) onChanged,
    String hint = "Select an item",
    super.validator,
    super.initialValue,
  }) : super(
         builder: (FormFieldState<String> state) {
           String? selectedItem = state.value;

           bool isOpen = false;

           return StatefulBuilder(
             builder: (context, setStateSB) {
               return Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   GestureDetector(
                     onTap: () {
                       setStateSB(() {
                         isOpen = !isOpen;
                       });
                     },
                     child: Container(
                       padding: const EdgeInsets.symmetric(
                         horizontal: 12,
                         vertical: 16,
                       ),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         border: Border.all(
                           color: state.hasError ? Colors.red : Colors.grey,
                         ),
                         borderRadius: BorderRadius.circular(8),
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                             selectedItem ?? hint,
                             style: GoogleFonts.nunito(
                               color: selectedItem == null
                                   ? Colors.grey
                                   : Colors.black,
                               fontSize: 17,
                             ),
                           ),
                           Icon(
                             isOpen
                                 ? Icons.keyboard_arrow_up
                                 : Icons.keyboard_arrow_down,
                           ),
                         ],
                       ),
                     ),
                   ),
                   if (isOpen)
                     Container(
                       margin: const EdgeInsets.only(top: 4),
                       padding: const EdgeInsets.symmetric(vertical: 4),
                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.grey.shade400),
                         borderRadius: BorderRadius.circular(8),
                         color: Colors.white,
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.shade300,
                             blurRadius: 5,
                             offset: const Offset(0, 3),
                           ),
                         ],
                       ),
                       child: SizedBox(
                         height: 220,
                         child: ListView(
                           shrinkWrap: true,
                           scrollDirection: Axis.vertical,
                           itemExtent: 48,
                           children: items.map((item) {
                             return InkWell(
                               onTap: () {
                                 state.didChange(item);
                                 onChanged(item);
                                 setStateSB(() => isOpen = false);
                               },
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(
                                   horizontal: 12,
                                   vertical: 12,
                                 ),
                                 child: Text(
                                   item,
                                   style: GoogleFonts.nunito(fontSize: 16),
                                 ),
                               ),
                             );
                           }).toList(),
                         ),
                       ),
                     ),
                   if (state.hasError)
                     Padding(
                       padding: const EdgeInsets.only(top: 4, left: 12),
                       child: Text(
                         state.errorText!,
                         style: const TextStyle(
                           color: Colors.red,
                           fontSize: 12,
                         ),
                       ),
                     ),
                 ],
               );
             },
           );
         },
       );
}
