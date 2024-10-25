// import 'package:flutter/material.dart';
// import 'location_with_timeline.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Location App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LocationWithTimeline(),
//     );
//   }
// }

// 2nd
// import 'package:flutter/material.dart';

// void main() {
//   runApp(EmployeeApp());
// }

// class EmployeeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Employee Time Tracker',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: EmployeeLandingPage(),
//     );
//   }
// }

// class Employee {
//   final String name;
//   final String timeIn;

//   Employee({required this.name, required this.timeIn});
// }

// class EmployeeLandingPage extends StatelessWidget {
//   final List<Employee> employees = [
//     Employee(name: "Abhinav Goyal", timeIn: "09:00 AM"),
//     Employee(name: "Harsh ", timeIn: "09:15 AM"),
//     Employee(name: "Shivam", timeIn: "08:45 AM"),
//     Employee(name: "Chirag", timeIn: "09:30 AM"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Employee Time-In Tracker'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Employee Check-in Times",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: employees.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     elevation: 3,
//                     margin: EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       leading: Icon(Icons.person, size: 40),
//                       title: Text(
//                         employees[index].name,
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w500),
//                       ),
//                       subtitle: Text(
//                         "Time In: ${employees[index].timeIn}",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// 3rd

import 'package:flutter/material.dart';

void main() {
  runApp(EmployeeApp());
}

class EmployeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Time Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: EmployeeLandingPage(),
      debugShowCheckedModeBanner: false, // Removes the debug banner
    );
  }
}

class Employee {
  final String name;
  final String timeIn;

  Employee({required this.name, required this.timeIn});
}

class EmployeeLandingPage extends StatelessWidget {
  final List<Employee> employees = [
    Employee(name: "Abhinav Goyal", timeIn: "09:00 AM"),
    Employee(name: "Harsh", timeIn: "09:15 AM"),
    Employee(name: "Shivam", timeIn: "08:45 AM"),
    Employee(name: "Chirag", timeIn: "09:30 AM"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Employee Time-In Tracker',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0, // Removes the shadow
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Check-In Times",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  return _buildEmployeeCard(employees[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmployeeCard(Employee employee) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 28,
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Time In: ${employee.timeIn}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
