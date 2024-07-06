import 'package:flutter/material.dart';

enum Models {
  lang,
  profile,
  icon,
}

class CustomButtonTop extends StatefulWidget {
  final Models models;
  final String? text;
  final String? nameFileImage;
  final Function()? onTap;

  const CustomButtonTop({
    super.key,
    required this.models,
    this.text,
    this.nameFileImage,
    this.onTap,
  });

  @override
  State<CustomButtonTop> createState() => _CustomButtonTopState();
}

class _CustomButtonTopState extends State<CustomButtonTop> {
  bool _liked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(0.69, -0.73),
          end: Alignment(-0.69, 0.73),
          colors: [Color(0xFF21262E), Color(0xFF0C0F14)],
        ),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF21262E)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Center(
        child: _buildChild(),
      ),
    );
  }

  Widget _buildChild() {
    switch (widget.models) {
      case Models.lang:
        if (widget.text == null) {
          return const Text(
            'N/A',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          );
        }
        return Text(
          widget.text!,
          style: const TextStyle(
            color: Colors.white30,
            fontWeight: FontWeight.w500,
          ),
        );
      case Models.profile:
        return const Icon(
          Icons.person,
          size: 18,
          color: Colors.white30,
        );
      case Models.icon:
        if (widget.nameFileImage == null) {
          return InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onTap: () {
              setState(() {
                _liked = !_liked;
              });
            },
            child: Icon(
              _liked ? Icons.favorite : Icons.favorite_border,
              size: 18,
              color: _liked ? Colors.red : Colors.white30,
            ),
          );
        }
        return InkWell(
          onTap: widget.onTap,
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          child: Image.asset(
            widget.nameFileImage!,
            width: 18,
            height: 18,
            color: Colors.white30,
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
