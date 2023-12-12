class CommonModels {
  
  final int id;
  final String name;

  CommonModels(this.id, this.name);

  factory CommonModels.fromJson(Map<String, dynamic> data) {
    return CommonModels(data['id'], data['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name
    };
  }
}