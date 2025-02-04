
class AppMetadataDto {
  
    final String provider;
    final List<String> providers;

    AppMetadataDto({
        required this.provider,
        required this.providers,
    });

  factory AppMetadataDto.fromMap(Map<String, dynamic> map) {
    return AppMetadataDto(
      provider: map['provider'] as String,
      providers: List<String>.from((map['providers']),
    ));
  }

}
