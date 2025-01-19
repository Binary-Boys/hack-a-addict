import 'package:flutter/material.dart';

class Event {
  final String title;
  final String date;
  final String time;
  final String location;
  final String imageUrl;
  final Color backgroundColor;

  Event({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.imageUrl,
    required this.backgroundColor,
  });
}

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  int selectedDay = 24;
  final List<Event> events = [
    Event(
      title: 'A Virtual Evening on De-addicting Society',
      date: 'Sat, May 1',
      time: '7:00 PM',
      location: 'Online - Gmeet',
      imageUrl: 'assets/images/event1.jpeg',
      backgroundColor: Colors.deepPurple,
    ),
    Event(
      title: 'Tech Talk: Future of AI',
      date: 'Sun, May 2',
      time: '6:00 PM',
      location: 'Online - Zoom',
      imageUrl: 'assets/images/event2.png',
      backgroundColor: Colors.blue[700]!,
    ),
    Event(
      title: 'Mental Health Workshop',
      date: 'Mon, May 3',
      time: '5:30 PM',
      location: 'Community Center',
      imageUrl: 'assets/images/event3.png',
      backgroundColor: Colors.green[700]!,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Events',
          style: TextStyle(color: Color(0xFF2563EB)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 28, color: Color(0xFF2563EB)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, size: 27, color: Color(0xFF2563EB)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF2563EB)),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            _buildCalendar(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ...events.map((event) => _buildEventCard(event)),
                  const SizedBox(height: 80), // Space for FAB
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildAddButton(),
    );
  }

  Widget _buildCalendar() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: 7,
        itemBuilder: (context, index) {
          final day = 21 + index;
          final isSelected = day == selectedDay;
          return GestureDetector(
            onTap: () => setState(() => selectedDay = day),
            child: Container(
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue[600] : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ['S', 'M', 'T', 'W', 'T', 'F', 'S'][index],
                    style: TextStyle(
                      color: isSelected ? Colors.white70 : Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    day.toString(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventCard(Event event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: event.backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              event.imageUrl,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${event.date} • ${event.time}',
                  style: TextStyle(
                    color: Colors.blue[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      event.location,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.blue[600],
        icon: const Icon(Icons.add),
        label: const Text(
          'Add',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
