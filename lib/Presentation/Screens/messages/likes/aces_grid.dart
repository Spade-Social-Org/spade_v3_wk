import 'package:flutter/material.dart';

class AcesGrid extends StatelessWidget {
  const AcesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 9 / 12,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 2),
      itemCount: 41,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/image1.png'))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                      width: 35,
                      child: CircularProgressIndicator(
                        value: 0.6,
                        strokeWidth: 6,
                        color: const Color(0xff0C964C),
                        backgroundColor: Colors.black45.withOpacity(0.5),
                      ),
                    ),
                    const Text(
                      '60%',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                'Maria, 27',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xff827070).withOpacity(0.8)),
                child: const Text(
                  'Guinea',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
