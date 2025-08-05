import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/core.dart';
import 'package:bitacoras/features/logs_list/presentation/blocs/blocs.dart';

class LogsListView extends StatelessWidget {
  const LogsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final logsList = context.watch<LogsListBloc>().state.logsList;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: LayoutConstants.paddingL),
      child: ListView.builder(
        addAutomaticKeepAlives: false,
        itemCount: logsList.length,
        itemBuilder: (context, index) {
          final log = logsList[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: LayoutConstants.spaceXL),
            child: Material(
              borderRadius: BorderRadius.circular(LayoutConstants.spaceL),
              elevation: LayoutConstants.spaceS,
              child: Padding(
                padding: const EdgeInsets.all(LayoutConstants.paddingL),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imagen
                    ClipRRect(
                      borderRadius: BorderRadius.circular(LayoutConstants.spaceL),
                      child: Image.file(
                        File(log.imageUrl),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: LayoutConstants.spaceL),
                    // Textos
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children          : [

                          Text(
                            log.conceptText,
                            style   : GlobalFonts.paragraphBodyLargeSemiBold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 4),
                          
                          Text(
                            log.description,
                            style   : GlobalFonts.paragraphBodyMediumRegular.copyWith(color: Colors.grey),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),

                    CircleAvatar(
                      backgroundColor : Colors.blueAccent,
                      child           : Text('${log.idTasks}', style: GlobalFonts.paragraphBodySmallSemiBold.copyWith( color: Colors.white) ,),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
