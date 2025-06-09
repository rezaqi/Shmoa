import 'package:flutter/material.dart';

class PageMed extends StatelessWidget {
  const PageMed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset("assets/mossa.png")),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 172,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/david.png",
                  )),
              SizedBox(
                width: 200,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/1.png",
                      fit: BoxFit.cover,
                    )),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Text(
          "قبل الخلاص",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        const Text(
          "ويظهر تدبير الخلاص في العهد القديم من خلال الآباء والوصايا والشرائع والذبائح والأنبياء ورموز واضحة للمسيح",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
