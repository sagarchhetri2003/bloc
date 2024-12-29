import 'package:flutter/material.dart';

class AreaOfCircleView extends StatefulWidget {
  const AreaOfCircleView({super.key});

  @override
  _CircleAreaScreenState createState() => _CircleAreaScreenState();
}

class _CircleAreaScreenState extends State<AreaOfCircleView> {
  final _radiusController = TextEditingController();
  double? _circleArea;

  void _calculateCircleArea() {
    final radius = double.tryParse(_radiusController.text);
    if (radius != null) {
      setState(() {
        _circleArea = 3.14159 * radius * radius;
      });
    } else {
      setState(() {
        _circleArea = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Area Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _radiusController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Radius',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: _calculateCircleArea,
                child: const Text(
                  'Calculate Area',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              if (_circleArea != null)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Circle Area:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _circleArea!.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              if (_circleArea == null && _radiusController.text.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Please enter a valid radius!',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
