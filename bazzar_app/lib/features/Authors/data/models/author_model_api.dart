class AuthorModelApi {
  final String id;
  final String name;
  final String? image;
  final String role;
  final String? description;
  final double rate;

  AuthorModelApi({
    required this.id,
    required this.name,
    this.image,
    this.role = 'Author',
    this.description,
    this.rate = 4.0,
  });

  factory AuthorModelApi.fromJson(Map<String, dynamic> json) {
    try {
      final volumeInfo = json['volumeInfo'] as Map<String, dynamic>? ?? {};
      final List<dynamic> authors =
          volumeInfo['authors'] as List<dynamic>? ?? [];
      final List<dynamic> categories =
          volumeInfo['categories'] as List<dynamic>? ?? [];

      // صورة الكتاب
      String imageUrl = '';
      final imageLinks = volumeInfo['imageLinks'] as Map<String, dynamic>?;
      if (imageLinks != null) {
        imageUrl = imageLinks['thumbnail']?.toString() ?? '';
        if (imageUrl.startsWith('http://')) {
          imageUrl = imageUrl.replaceFirst('http://', 'https://');
        }
      }

      // تحديد الدور بناءً على التصنيفات
      String role = _determineRole(categories);

      // وصف المؤلف من الكتاب
      String description = volumeInfo['description']?.toString() ?? '';
      if (description.isEmpty) {
        final title = volumeInfo['title']?.toString() ?? 'various books';
        description = 'Author of "$title"';
      }

      // Rating عشوائي بين 4.0 و 4.9
      final randomRating =
          4.0 + (DateTime.now().millisecondsSinceEpoch % 10) / 10;

      return AuthorModelApi(
        id: json['id']?.toString() ?? '',
        name: authors.isNotEmpty ? authors[0].toString() : 'Unknown Author',
        image: imageUrl,
        role: role,
        description: description,
        rate: randomRating > 4.9 ? 4.9 : randomRating,
      );
    } catch (e) {
      print('⚠️ Error parsing author: $e');
      return AuthorModelApi(
        id: json['id']?.toString() ?? '',
        name: 'Unknown Author',
        role: 'Author',
        description: 'Author of various books',
        rate: 4.0,
      );
    }
  }

  static String _determineRole(List<dynamic> categories) {
    if (categories.isEmpty) return 'Author';

    final categoryStr = categories.join(' ').toLowerCase();

    if (categoryStr.contains('poetry')) return 'Poet';
    if (categoryStr.contains('drama') || categoryStr.contains('play'))
      return 'Playwright';
    if (categoryStr.contains('fiction') || categoryStr.contains('novel'))
      return 'Novelist';
    if (categoryStr.contains('journalism') || categoryStr.contains('news'))
      return 'Journalist';

    return 'Author';
  }
}
