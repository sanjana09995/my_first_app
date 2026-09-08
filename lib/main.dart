import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const StayNEventApp());
}

// ---------------- COLORS ----------------

class AppColors {
  static const Color primaryPurple = Color(0xFF6C3CE9);
  static const Color darkNavy = Color(0xFF171525);
  static const Color offWhite = Color(0xFFFAF9FC);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color lavender = Color(0xFFEDE7FF);
  static const Color gold = Color(0xFFD8B56A);
  static const Color success = Color(0xFF20A464);
  static const Color error = Color(0xFFE5484D);
  static const Color greyText = Color(0xFF777580);
}

class StayNEventApp extends StatelessWidget {
  const StayNEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StayNEvent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.offWhite,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryPurple,
          primary: AppColors.primaryPurple,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.offWhite,
          foregroundColor: AppColors.darkNavy,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins(
            color: AppColors.darkNavy,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.lavender,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ---------------- SPLASH SCREEN ----------------

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkNavy,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.primaryPurple,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  'SN',
                  style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('StayNEvent',
                style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w600, color: Colors.white)),
            const SizedBox(height: 6),
            Text('Stay • Celebrate • Experience',
                style: GoogleFonts.poppins(fontSize: 13, color: AppColors.gold, letterSpacing: 0.5)),
          ],
        ),
      ),
    );
  }
}

// ---------------- LOGIN SCREEN ----------------

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(color: AppColors.primaryPurple, borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text('SN',
                          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Welcome back',
                      style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w600, color: AppColors.darkNavy)),
                  const SizedBox(height: 6),
                  Text('Find your perfect stay & celebration',
                      style: GoogleFonts.poppins(fontSize: 13, color: AppColors.greyText)),
                  const SizedBox(height: 36),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined, color: AppColors.primaryPurple),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline, color: AppColors.primaryPurple),
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility,
                            color: AppColors.primaryPurple),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                    child: Text("Don't have an account? Sign up",
                        style: GoogleFonts.poppins(color: AppColors.primaryPurple, fontSize: 13)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- SIGN UP SCREEN ----------------

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                TextField(
                  decoration: const InputDecoration(
                      labelText: 'Full Name', prefixIcon: Icon(Icons.person_outline, color: AppColors.primaryPurple)),
                ),
                const SizedBox(height: 14),
                TextField(
                  decoration: const InputDecoration(
                      labelText: 'Email', prefixIcon: Icon(Icons.email_outlined, color: AppColors.primaryPurple)),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 14),
                TextField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline, color: AppColors.primaryPurple),
                    suffixIcon: IconButton(
                      icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.primaryPurple),
                      onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  obscureText: _obscureConfirm,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: const Icon(Icons.lock_outline, color: AppColors.primaryPurple),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility,
                          color: AppColors.primaryPurple),
                      onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  },
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- VENUE MODEL ----------------

class Venue {
  final String name;
  final String type;
  final String location;
  final String price;
  final IconData icon;
  final String description;
  final double rating;
  final List<String> amenities;

  Venue({
    required this.name,
    required this.type,
    required this.location,
    required this.price,
    required this.icon,
    required this.description,
    required this.rating,
    required this.amenities,
  });
}

final List<Venue> venues = [
  Venue(
    name: 'The Grand Palace Hotel',
    type: 'Hotel',
    location: 'Pune, Maharashtra',
    price: '₹4,500/night',
    icon: Icons.hotel,
    rating: 4.7,
    description:
        'A luxurious hotel in the heart of Pune, offering elegant rooms, a rooftop pool, and 24/7 room service.',
    amenities: ['Pool', 'Restaurant', 'Wi-Fi', 'Parking', 'AC', 'Gym'],
  ),
  Venue(
    name: 'Royal Banquet Hall',
    type: 'Banquet Hall',
    location: 'Pimpri, Maharashtra',
    price: '₹80,000/day',
    icon: Icons.event,
    rating: 4.5,
    description:
        'A spacious banquet hall with a capacity of 500 guests, fully air-conditioned, with in-house catering.',
    amenities: ['Catering', 'Parking', 'AC', 'Sound System'],
  ),
  Venue(
    name: 'Sunset Garden Venue',
    type: 'Wedding Venue',
    location: 'Mumbai, Maharashtra',
    price: '₹1,50,000/day',
    icon: Icons.favorite,
    rating: 4.8,
    description:
        'A breathtaking outdoor wedding venue with garden views, perfect for sunset ceremonies and grand receptions.',
    amenities: ['Parking', 'Catering', 'Photography Area', 'Bridal Suite'],
  ),
  Venue(
    name: 'Skyline Convention Center',
    type: 'Corporate Events',
    location: 'Pune, Maharashtra',
    price: '₹60,000/day',
    icon: Icons.business_center,
    rating: 4.4,
    description:
        'A modern convention center equipped with AV systems, high-speed WiFi, and flexible seating arrangements.',
    amenities: ['Wi-Fi', 'AV System', 'AC', 'Parking'],
  ),
];

// ---------------- HOME SCREEN ----------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good morning 👋', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.greyText)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 16, color: AppColors.primaryPurple),
                        Text(' Pune, Maharashtra',
                            style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.darkNavy)),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(color: AppColors.primaryPurple, borderRadius: BorderRadius.circular(14)),
                  child: Center(
                    child: Text('SN', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchFilterScreen()));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: AppColors.primaryPurple),
                    const SizedBox(width: 10),
                    Text('Where do you want to stay?', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.greyText)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('Explore', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.darkNavy)),
            const SizedBox(height: 12),
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _CategoryChip(icon: Icons.hotel, label: 'Hotels'),
                  _CategoryChip(icon: Icons.celebration, label: 'Events'),
                  _CategoryChip(icon: Icons.favorite, label: 'Weddings'),
                  _CategoryChip(icon: Icons.business_center, label: 'Corporate'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular near you', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.darkNavy)),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchFilterScreen()));
                  },
                  child: Text('Filters', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.primaryPurple, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...venues.map((venue) => _VenueCard(venue: venue)),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(color: AppColors.lavender, borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, color: AppColors.primaryPurple, size: 26),
          ),
          const SizedBox(height: 6),
          Text(label, style: GoogleFonts.poppins(fontSize: 11, color: AppColors.darkNavy)),
        ],
      ),
    );
  }
}

class _VenueCard extends StatelessWidget {
  final Venue venue;

  const _VenueCard({required this.venue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => VenueDetailScreen(venue: venue)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppColors.cardWhite,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(color: AppColors.lavender, borderRadius: BorderRadius.circular(14)),
                child: Icon(venue.icon, color: AppColors.primaryPurple, size: 30),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(venue.name, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.darkNavy)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 13, color: AppColors.greyText),
                        Expanded(child: Text(' ${venue.location}', style: GoogleFonts.poppins(fontSize: 11, color: AppColors.greyText))),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: AppColors.gold),
                        Text(' ${venue.rating}', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.darkNavy)),
                        const Spacer(),
                        Text(venue.price, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primaryPurple)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- SEARCH + FILTERS SCREEN ----------------

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  String? selectedPrice;
  String? selectedRating;
  final Set<String> selectedTypes = {};
  final Set<String> selectedAmenities = {};

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(title, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.darkNavy)),
    );
  }

  Widget chip(String label, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryPurple : AppColors.lavender,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: selected ? Colors.white : AppColors.darkNavy,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search & Filters')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Destination',
                prefixIcon: Icon(Icons.location_on_outlined, color: AppColors.primaryPurple),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Check-in',
                      prefixIcon: Icon(Icons.calendar_today, color: AppColors.primaryPurple, size: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Check-out',
                      prefixIcon: Icon(Icons.calendar_today, color: AppColors.primaryPurple, size: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Guests',
                prefixIcon: Icon(Icons.people_outline, color: AppColors.primaryPurple),
              ),
              keyboardType: TextInputType.number,
            ),
            sectionTitle('Price range'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                chip('₹1,000–₹3,000', selectedPrice == 'low', () => setState(() => selectedPrice = 'low')),
                chip('₹3,000–₹5,000', selectedPrice == 'mid', () => setState(() => selectedPrice = 'mid')),
                chip('₹5,000+', selectedPrice == 'high', () => setState(() => selectedPrice = 'high')),
              ],
            ),
            sectionTitle('Rating'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                chip('⭐ 4+', selectedRating == '4', () => setState(() => selectedRating = '4')),
                chip('⭐ 4.5+', selectedRating == '4.5', () => setState(() => selectedRating = '4.5')),
              ],
            ),
            sectionTitle('Property type'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: ['Hotel', 'Resort', 'Villa', 'Apartment'].map((type) {
                final isSelected = selectedTypes.contains(type);
                return chip(type, isSelected, () {
                  setState(() {
                    isSelected ? selectedTypes.remove(type) : selectedTypes.add(type);
                  });
                });
              }).toList(),
            ),
            sectionTitle('Amenities'),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: ['Wi-Fi', 'Pool', 'Parking', 'Breakfast', 'Gym', 'AC'].map((a) {
                final isSelected = selectedAmenities.contains(a);
                return chip(a, isSelected, () {
                  setState(() {
                    isSelected ? selectedAmenities.remove(a) : selectedAmenities.add(a);
                  });
                });
              }).toList(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Filters applied!')),
                );
              },
              child: const Text('Apply Filters'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ---------------- VENUE DETAIL SCREEN ----------------

class VenueDetailScreen extends StatelessWidget {
  final Venue venue;

  const VenueDetailScreen({super.key, required this.venue});

  IconData amenityIcon(String amenity) {
    switch (amenity) {
      case 'Pool':
        return Icons.pool;
      case 'Restaurant':
        return Icons.restaurant;
      case 'Wi-Fi':
        return Icons.wifi;
      case 'Parking':
        return Icons.local_parking;
      case 'AC':
        return Icons.ac_unit;
      case 'Gym':
        return Icons.fitness_center;
      case 'Catering':
        return Icons.restaurant_menu;
      case 'Sound System':
        return Icons.speaker;
      case 'Photography Area':
        return Icons.camera_alt;
      case 'Bridal Suite':
        return Icons.bed;
      case 'AV System':
        return Icons.cast;
      default:
        return Icons.check_circle_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(venue.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(color: AppColors.primaryPurple, borderRadius: BorderRadius.circular(28)),
                child: Icon(venue.icon, size: 56, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Text(venue.name, style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.darkNavy)),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.star, size: 16, color: AppColors.gold),
                Text(' ${venue.rating}  •  ${venue.location}', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.greyText)),
              ],
            ),
            const SizedBox(height: 10),
            Text(venue.price, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primaryPurple)),
            const SizedBox(height: 20),
            Text('About this property', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.darkNavy)),
            const SizedBox(height: 8),
            Text(venue.description, style: GoogleFonts.poppins(fontSize: 14, height: 1.5, color: AppColors.greyText)),
            const SizedBox(height: 24),
            Text('Amenities', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.darkNavy)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: venue.amenities.map((a) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(color: AppColors.lavender, borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(amenityIcon(a), size: 16, color: AppColors.primaryPurple),
                      const SizedBox(width: 6),
                      Text(a, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.darkNavy)),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Text('Available rooms', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.darkNavy)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.cardWhite,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Deluxe Room', style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.darkNavy)),
                        const SizedBox(height: 4),
                        Text('👤 2 Guests  •  🛏️ King Bed', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.greyText)),
                        const SizedBox(height: 6),
                        Text(venue.price, style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.primaryPurple)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10)),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Room selected at ${venue.name}!')),
                      );
                    },
                    child: const Text('Select', style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Booking flow coming soon for ${venue.name}!')),
                  );
                },
                child: const Text('Book Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}