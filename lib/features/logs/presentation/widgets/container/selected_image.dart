import 'dart:io';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/logs/presentation/blocs/blocs.dart';

class SelectedImage extends StatelessWidget {

  final double height;

  const SelectedImage({ super.key, required this.height });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
              child : SizedBox(
              width : 200,
              height: height * 0.3,
              child : Image.file(
                File( context.read<TaksLogFormBloc>().state.pathImage ),
                fit: BoxFit.contain,
              ),
            ),
          ),
    
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () => context.read<TaksLogFormBloc>().selectPathImage(''),
              child: CircleAvatar(
                maxRadius : 26,
                backgroundColor: Colors.white,
                child     : Icon( Icons.close, size: 36, ),
              ),
            ),
          )
        ]
      ),
    ).fadeIn().fadeIn( delay: Duration( milliseconds: 300 ) );
  }
}