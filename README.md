# booking_hotel_ui

A new Flutter project.

# Example localhost convert -> Local IpV4
"http://localhost:5000/v1/room" -> "http://127.?.?.1/v1/room" 


# Part logic select date from and date to 
// final locationTextController = TextEditingController();
    // final dateFromTextController = TextEditingController();
    // final dateToTextController = TextEditingController();

    // locationTextController.text = 'Vietnam';
    // dateFromTextController.text = dateToTextController.text =
    //     DateFormat('dd MMM yyyy').format(DateTime.now());

    // Future<void> _selectDate(
    //     BuildContext context, TextEditingController controller) async {
    //   final DateTime? picked = await showDatePicker(
    //     context: context,
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(2000),
    //     lastDate: DateTime(2101),
    //   );

    //   if (picked != null && picked != controller.text) {
    //     controller.text = DateFormat('dd MM yyyy').format(picked);
    //   }
    // }