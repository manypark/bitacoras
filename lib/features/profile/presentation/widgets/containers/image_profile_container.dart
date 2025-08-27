import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:bitacoras/shared/progres/progres.dart';

class ImageProfileContainer extends StatelessWidget {

  final String avatarUrl;
  
  const ImageProfileContainer({
    super.key,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular( 10 ),
      child       : SizedBox(
        width : double.infinity,
        height: 200,
        child : (avatarUrl != '' ) ?
    
        Image.network( 
          avatarUrl,
          fit           : BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center( child: CircularProgress( color: Colors.white ) , );
          },
          errorBuilder: (context, error, stackTrace) => Icon( Icons.person, size: 64, color: Colors.blueGrey.shade700, ), 
        ) :
    
        Icon( Icons.person, size: 64, color: Colors.blueGrey.shade700, ),
      ),
    ).fadeIn( delay: Duration( milliseconds: 100 ), animate: true );
  }
}