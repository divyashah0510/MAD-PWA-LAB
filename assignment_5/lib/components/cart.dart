import 'package:flutter/material.dart';
import 'products.dart';
import 'confirmation.dart';

class CartPage extends StatelessWidget {
  final List<Product> products;

  const CartPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: const Color.fromARGB(255, 97, 170, 70),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Name: ${products[index].name}\nPrice: \$${products[index].price}\nQuantity: ${products[index].quantity}',
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the OrderDetails page when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailsPage(),
                ),
              );
            },
            child: const Text('Proceed to Order Details'),
          ),
        ],
      ),
    );
  }
}

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  TextEditingController _deliveryAddressController = TextEditingController();
  TextEditingController _deliveryTimeController = TextEditingController();
  TextEditingController _orderDateController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _orderDateController.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
        _deliveryTimeController.text = pickedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        backgroundColor: const Color.fromARGB(255, 97, 170, 70),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _deliveryAddressController,
            decoration: InputDecoration(labelText: 'Delivery Address'),
          ),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: const Text('Select Date'),
          ),
          TextField(
            controller: _orderDateController,
            decoration: InputDecoration(labelText: 'Order Date'),
          ),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: const Text('Select Time'),
          ),
          TextField(
            controller: _deliveryTimeController,
            decoration: InputDecoration(labelText: 'Delivery Time'),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the ConfirmationPage when the "Confirm Order" button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConfirmationPage(
                    productName: 'Product Name', // Replace with the actual product details
                    productPrice: 10.0, // Replace with the actual product details
                    productQuantity: 1, // Replace with the actual product details
                    deliveryAddress: _deliveryAddressController.text,
                    deliveryTime: _deliveryTimeController.text,
                    orderDate: _orderDateController.text,
                  ),
                ),
              );
            },
            child: const Text('Confirm Order'),
          ),
        ],
      ),
    );
  }
}
