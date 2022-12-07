import 'dart:convert';

List<Organization> organizationsFromJson(String receivedJson) => List<Organization>.from(
	jsonDecode(receivedJson).map((x) => Organization.fromJson(x))
);

class Organization {
	final String name;
	final String phone;
	final String type;
	final String year;
	final String address;
	final String contact;
	
	Organization({
		required this.name,
		required this.address,
		required this.contact,
		required this.phone,
		required this.year,
		required this.type
	});

	factory Organization.fromJson(Map json) {
		return Organization(
			name: json['name'],
			address: json['address'],
			phone: json['phone'],
			year: json['year'],
			type: json['type'],
			contact: json['contact']
		);
	}

	Map<String, dynamic> toJson() => {
		'name': this.name,
		'address': this.address,
		'phone': this.phone,
		'year': this.year,
		'type': this.type,
		'contact': this.contact
	};
}
