import 'package:beamer/beamer.dart';
import 'package:customer_ui/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Onpressdot extends StatelessWidget {
  const Onpressdot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Spacer(),
            CustomButton(
              iconPath: 'assets/images/delete.png',
              buttonType: ButtonType.outlined,
              text: 'Delete Category',
              onPressed: () {},
            ),
            SizedBox(height: 12,),
            CustomButton(text: 'Cancel', onPressed: (){
              Beamer.of(context).beamBack() ;
            })
          ],
        ),
      ),
    );
  }
}
