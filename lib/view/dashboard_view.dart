import 'package:flutter/material.dart';

import 'area_of_circle_view.dart';
import 'simple_interest_view.dart';
import 'student_list_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2, // Adjusts the size ratio of the grid items
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            final titles = [
              'Area of Circle',
              'Simple Interest',
              'Student List'
            ];
            final icons = [
              Icons.circle,
              Icons.percent,
              Icons.person,
            ];
            final destinations = [
              AreaOfCircleView(),
              SimpleInterestView(),
              StudentListView(),
            ];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => destinations[index]),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icons[index],
                      size: 48,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      titles[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
