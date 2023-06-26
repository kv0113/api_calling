
class ServiceClass {
  final int id;
  final String name;
  final double price;
  final String no;
  final int?

  taxId;
  final List<Collection> brands;
  final List<Collection> models;

  ServiceClass({
    required this.id,
    required this.name,
    required this.no,
    required this.price,
    required this.taxId,
    required this.brands,
    required this.models,
  });

  factory ServiceClass.fromJson(Map<String, dynamic> json) =>
      ServiceClass(
        id: json["id"],
        name: json["name"],
        no: json["no"],
        price: json["price"],
        taxId: json["tax_id"],
        brands: List.from(json['Brand'].map((e) => Collection.fromJson(e))),
        models :List.from(json['Model'].map((e) => Collection.fromJson(e))),
      );
}

class Collection {
  final int id;
  final String name;
  final int? brandId;

  Collection({
    required this.id,
    required this.name,
    this.brandId,
  });

  factory Collection.fromJson(Map<String, dynamic> json) =>
      Collection(
        id: json["id"],
        name: json['name'],
        brandId: json['brand_id'],
      );
}
