// lib/features/homepage/data/homepage_data.dart
import 'package:intl/intl.dart';

class HomepageData {
  final String firstContainerTitle;
  final String firstContainerSubtitle;
  final List<Map<String, String>> firstContainerItems;
  final String secondContainerTitle;
  final String secondContainerSubtitle;
  final String educationText;
  final String atSectionText; // New for AtSection header
  final List<Map<String, String>> atSectionItems; // New for AtSection cards

  HomepageData({
    required this.firstContainerTitle,
    required this.firstContainerSubtitle,
    required this.firstContainerItems,
    required this.secondContainerTitle,
    required this.secondContainerSubtitle,
    required this.educationText,
    required this.atSectionText,
    required this.atSectionItems,
  });

  static HomepageData getData() {
    final now = DateTime.now();
    final day = DateFormat('d').format(now);
    final month = DateFormat('MMMM', 'id_ID').format(now);

    return HomepageData(
      firstContainerTitle: 'Aliran Menstruasi',
      firstContainerSubtitle: 'Siklus Menstruasi Hari ke 3',
      firstContainerItems: [
        {
          'title': 'Hari ini',
          'image': day, // Special value for the day
          'subtitle': month
        },
        {
          'title': 'Status',
          'image': 'assets/images/13.png',
          'subtitle': 'Netral'
        },
        {
          'title': 'Menstruasi',
          'image': 'assets/images/12.png',
          'subtitle': 'Normal'
        },
      ],
      secondContainerTitle: 'Mulai obrolan baru dengan',
      secondContainerSubtitle: 'CERINCE AI',
      educationText: 'Edukasi',
      atSectionText: 'Artikel & Tips', // Placeholder header
      atSectionItems: [
        {
          'image': 'assets/images/03.png',
          'title': 'At Title 1',
          'subtitle': 'At Subtitle 1'
        },
        {
          'image': 'assets/images/04.png',
          'title': 'At Title 2',
          'subtitle': 'At Subtitle 2'
        },
      ],
    );
  }
}
