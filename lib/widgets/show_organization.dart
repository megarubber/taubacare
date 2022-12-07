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
		this.height = 120
	});

	@override
	Widget build(BuildContext context) {
		return Container(
			width: this.width,
			height: this.height,
			child: Padding(
				padding: const EdgeInsets.all(15),
				child: Column(
					children: <Widget>[
						Text(
							this.title, 
							style: TextStyle(
								fontFamily: 'Poppins',
								fontSize: 20
							),
						),
						Text(
							this.address,
							style: TextStyle(
								fontFamily: 'Poppins',
								fontSize: 15
							),
						),
						Text(
							this.contact,
							style: TextStyle(
								fontFamily: 'Poppins',
								fontSize: 15
							),
						),
					]
				)
			),
			decoration: const BoxDecoration(
				color: ProjectColors.lowRed,
				borderRadius: BorderRadius.all(Radius.circular(15))
			)
		);
	}
}
