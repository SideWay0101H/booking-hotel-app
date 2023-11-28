import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:booking_hotel_ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 0.4, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(3)),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'Hãy chọn phòng bạn ưng ý nhất',
              style: TextStyle(fontFamily: FontFamily.roboto, fontSize: 18),
            ),
            const SizedBox(height: 20),
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(30.0),
              child: TextFormField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                    hintText: "Tìm phòng có giá ...",
                    labelStyle: TextStyle(
                        color: Colors.black12,
                        fontFamily: FontFamily.roboto,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomButton(text: ''),
          ],
        ));
  }
}
