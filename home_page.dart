import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama dan NIM dengan style menarik
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hilda Nurhasanah 232101144",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.blueAccent,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 2,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                Text(
                  "Hani Firyal 232101159",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.blueAccent,
                    shadows: [
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 2,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Gambar utama
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/image/photo-1506744038136-46273834b3fb.jpg",
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Kolom pencarian
            TextField(
              decoration: InputDecoration(
                hintText: "Cari destinasi, hotel, atau aktivitas...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tombol kategori
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBookingButton(Icons.hotel, "Hotel"),
                _buildBookingButton(Icons.flight, "Pesawat"),
                _buildBookingButton(Icons.hiking, "Kegiatan"),
                _buildBookingButton(Icons.train, "Kereta"),
                _buildBookingButton(Icons.restaurant, "Kuliner"),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              "Ulasan Destinasi Populer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Review card
            _buildReviewCard(
              imageUrl: "assets/image/entrance-candi-borobudur.jpg",
              title: "Candi Borobudur",
              rating: 4.8,
              review: "Arsitektur megah dan penuh filosofi!",
            ),
            _buildReviewCard(
              imageUrl: "assets/image/photo-1500530855697-b586d89ba3ee.jpg",
              title: "Valley of Fire State Park, Nevada",
              rating: 4.7,
              review: "Sunrise & sunset dengan warna langit yang memukau!",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade100,
          ),
          child: Icon(icon, size: 28, color: Colors.blue),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }

  Widget _buildReviewCard({
    required String imageUrl,
    required String title,
    required double rating,
    required String review,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(" $rating"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(review, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
