class WhatsData {
  String id;
  String description;
  WhatsData({
    this.id = "",
    required this.description,
  });

  WhatsData.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          description: json['description'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'description': description,
    };
  }
}
