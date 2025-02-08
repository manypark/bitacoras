
class AppMetadata {
  
    final String provider;
    final List<String> providers;

    AppMetadata({
        required this.provider,
        required this.providers,
    });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'provider': provider,
      'providers': providers,
    };
  }

  factory AppMetadata.fromMap(Map<String, dynamic> map) {
    return AppMetadata(
      provider: map['provider'] as String,
      providers: List<String>.from((map['providers'] as List<String>)),
    );
  }
}
