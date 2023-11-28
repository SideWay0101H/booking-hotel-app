import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:booking_hotel_ui/pages/booking/widgets/SelectDate.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final TextEditingController _quantityController = TextEditingController();

  String? _validateQuantity(String value) {
    if (value.isEmpty) {
      return 'Số lượng không được bỏ trống';
    }
    return null;
  }

  Widget _buildQuanity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Số lượng',
          style: TextStyle(
              fontFamily: FontFamily.roboto, fontSize: 15, color: Colors.white),
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0x0FF28384),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5)
                ],
              ),
              border: Border.all(width: 0.2),
              borderRadius: BorderRadius.circular(9)),
          height: 60.0,
          child: TextFormField(
            validator: (value) {
              _validateQuantity(value!);
            },
            controller: _quantityController,
            keyboardType: TextInputType.number,
            style: const TextStyle(
                color: Colors.white, fontFamily: FontFamily.roboto),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Nhập số lượng người ở',
                hintStyle: TextStyle(
                    fontSize: 15,
                    fontFamily: FontFamily.roboto,
                    color: Colors.white)),
          ),
        )
      ],
    );
  }

  Widget _buttonBack() {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.topCenter,
                  colors: [
                Color(0x0ff3aef5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5)
              ],
                  stops: [
                0.1,
                0.4,
                0.7,
                0.9
              ])),
          child: const Row(
            children: [],
          ),
        ),
        SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 110.0),
            child: Column(
              children: [
                Row(
                  children: [
                    _buttonBack(),
                    const SizedBox(
                      width: 50,
                    ),
                    const Center(
                      child: Text(
                        'Đặt phòng',
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: FontFamily.roboto,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SelectDate(),
                const SizedBox(height: 20),
                _buildQuanity(),
                const SizedBox(
                  height: 20,
                ),
                const Text('Tổng số tiền 1.0100.000 vnd'),
                const SizedBox(
                  height: 20,
                ),
                const Text('Trạng thái phòng: Đã đặt'),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
