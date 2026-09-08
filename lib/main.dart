import 'package:flutter/material.dart';

void main() {
  runApp(const StayNEventApp());
}

class StayNEventApp extends StatelessWidget {
  const StayNEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StayNEvent',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class Venue {
  final String name;
  final String type;
  final String location;
  final String price;
  final IconData icon;

  Venue({
    required this.name,
    required this.type,
    required this.location,
    required this.price,
    required this.icon,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Venue> venues = [
      Venue(
        name: 'The Grand Palace Hotel',
        type: 'Hotel',
        location: 'Pune, Maharashtra',
        price: '₹4,500/night',
        icon: Icons.hotel,
      ),
      Venue(
        name: 'Royal Banquet Hall',
        type: 'Banquet Hall',
        location: 'Pimpri, Maharashtra',
        price: '₹80,000/day',
        icon: Icons.event,
      ),
      Venue(
        name: 'Sunset Garden Venue',
        type: 'Wedding Venue',
        location: 'Mumbai, Maharashtra',
        price: '₹1,50,000/day',
        icon: Icons.favorite,
      ),
      Venue(
        name: 'Skyline Convention Center',
        type: 'Corporate Events',
        location: 'Pune, Maharashtra',
        price: '₹60,000/day',
        icon: Icons.business_center,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('StayNEvent'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: venues.length,
        itemBuilder: (context, index) {
          final venue = venues[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: CircleAvatar(
                radius: 28,
                child: Icon(venue.icon, size: 28),
              ),
              title: Text(
                venue.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${venue.type} • ${venue.location}\n${venue.price}'),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on ${venue.name}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}