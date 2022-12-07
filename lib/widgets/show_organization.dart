import 'package:flutter/material.dart';
import '../utilities/colors.dart';

class ShowOrganization extends StatelessWidget {
	final String title;
	final String address;
	final String contact;
	final double width;
	final double height;

	ShowOrganization({
		required this.title,
		required this.address,
		required this.contact,
		required this.width,
		required this.height
	});

	@override
	Widget build(BuildContext context) {
		return Container(
			width: this.width,
			height: this.height,
			child: Column(
				children: <Widget>[
					Text(this.title),
					Text(this.address),
					Text(this.contact),
				]
			),
			decoration: const BoxDecoration(
				color: ProjectColors.lowRed,
				borderRadius: BorderRadius.all(Radius.circular(15))
			)
		);
	}
}
