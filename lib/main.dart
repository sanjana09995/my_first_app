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
  final String description;

  Venue({
    required this.name,
    required this.type,
    required this.location,
    required this.price,
    required this.icon,
    required this.description,
  });
}

final List<Venue> venues = [
  Venue(
    name: 'The Grand Palace Hotel',
    type: 'Hotel',
    location: 'Pune, Maharashtra',
    price: '₹4,500/night',
    icon: Icons.hotel,
    description:
        'A luxurious hotel in the heart of Pune, offering elegant rooms, a rooftop pool, and 24/7 room service. Perfect for both business and leisure stays.',
  ),
  Venue(
    name: 'Royal Banquet Hall',
    type: 'Banquet Hall',
    location: 'Pimpri, Maharashtra',
    price: '₹80,000/day',
    icon: Icons.event,
    description:
        'A spacious banquet hall with a capacity of 500 guests, fully air-conditioned, with in-house catering and decoration services available.',
  ),
  Venue(
    name: 'Sunset Garden Venue',
    type: 'Wedding Venue',
    location: 'Mumbai, Maharashtra',
    price: '₹1,50,000/day',
    icon: Icons.favorite,
    description:
        'A breathtaking outdoor wedding venue with garden views, perfect for sunset ceremonies and grand receptions. Includes bridal suite and parking for 200 cars.',
  ),
  Venue(
    name: 'Skyline Convention Center',
    type: 'Corporate Events',
    location: 'Pune, Maharashtra',
    price: '₹60,000/day',
    icon: Icons.business_center,
    description:
        'A modern convention center equipped with AV systems, high-speed WiFi, and flexible seating arrangements. Ideal for conferences and corporate meetings.',
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VenueDetailScreen(venue: venue),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class VenueDetailScreen extends StatelessWidget {
  final Venue venue;

  const VenueDetailScreen({super.key, required this.venue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(venue.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                child: Icon(venue.icon, size: 60),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              venue.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${venue.type} • ${venue.location}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Text(
              venue.price,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'About this venue',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              venue.description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Booking flow coming soon for ${venue.name}!')),
                  );
                },
                child: const Text('Book Now', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}