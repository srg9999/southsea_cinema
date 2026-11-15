import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';

class OrderScreen extends StatelessWidget {
  final Movie movie;
  final int maxQuantity;

  const OrderScreen({
    super.key,
     required this.movie,
     this.maxQuantity = 10
    });

  @override
  State<OrderScreen> createState(){
    return _OrderScreenState();
  }
}



class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;

  void _increaseQuantity() {
    if (_quantity < widget.maxQuantity) {
      setState(() {
        _quantity++;
      });
    }
  }

  void _decreaseQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tickets for ${widget.movie.title}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OrderItemDisplay(
              _quantity,
              widget.movie.title,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _decreaseQuantity,
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: _increaseQuantity,
                  child: Text('+'),
                ),
              ],
            )
          ])
      ),
    );
  }
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tickets for ${widget.movie.title}'),
      ),
      body: Center(
        child: Text('Ordering tickets for ${widget.movie.title}'),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemName;
  final int quantity;
  final double price;

  const OrderItemDisplay({
    super.key,
    required this.itemName,
    required this.quantity,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(itemName),
      subtitle: Text('Quantity: $quantity'),
      trailing: Text('\$${(price * quantity).toStringAsFixed(2)}'),
    );
  }
}