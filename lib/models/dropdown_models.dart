class DropdownModels {
  
  final int id;
  final String name;

  DropdownModels(this.id, this.name);

  factory DropdownModels.fromJson(Map<String, dynamic> data) {
    return DropdownModels(data['id'], data['name']);
  }
}