import 'dart:io';
import 'package:bitacoras/shared/widgets/chips/chips.dart';
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
      padding : const EdgeInsets.symmetric(horizontal: LayoutConstants.paddingL),
      child   : ListView.builder(
        addAutomaticKeepAlives: false,
        itemCount   : logsList.length,
        itemBuilder : (context, index) {

          final log = logsList[index];

          return Padding(
            padding : const EdgeInsets.only(bottom: LayoutConstants.spaceXL),
            child   : Material(
              borderRadius: BorderRadius.circular(LayoutConstants.spaceL),
              elevation   : LayoutConstants.spaceS,
              child       : Padding(
                padding : const EdgeInsets.all(LayoutConstants.paddingL),
                child   : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children          : [

                    // Textos
                    Expanded(
                      child: Column(
                        spacing: LayoutConstants.spaceL,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          Row(
                            crossAxisAlignment : CrossAxisAlignment.start,
                            children          : [

                              // Imagen
                              ClipRRect(
                                borderRadius: BorderRadius.circular(LayoutConstants.spaceL),
                                child: Image.file(
                                  File(log.imageUrl),
                                  width : 60,
                                  height: 60,
                                  fit   : BoxFit.cover,
                                ),
                              ),
                          
                              SizedBox( width:  LayoutConstants.spaceL,),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children          : [
                              
                                  Text(
                                    log.conceptText,
                                    style   : GlobalFonts.paragraphBodyMediumSemiBold,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          
                                  Text(
                                    log.taskTitle,
                                    style   : GlobalFonts.paragraphBodyMediumSemiBold,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                      
                              Spacer(),
                              
                              IconButton(
                                onPressed: (){},
                                icon: Icon( Icons.cloud_upload_outlined, color: Colors.white ),
                                style     : ButtonStyle(
                                  backgroundColor : WidgetStatePropertyAll( Colors.blueAccent ),
                                  shape           : WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(LayoutConstants.spaceM),
                                    )
                                  ),
                                )
                              )
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing : LayoutConstants.spaceL,
                            children: [

                              Text(
                                log.description,
                                style   : GlobalFonts.paragraphBodySmallRegular.copyWith(color: Colors.grey),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                      
                              Row(
                                spacing: LayoutConstants.spaceM,
                                children: [

                                  Icon( Icons.timer_outlined, size: 18, color: Colors.grey,),

                                  Text(
                                    formatDayMonthHour( log.dateCapturated ),
                                    style   : GlobalFonts.paragraphBodySmallRegular.copyWith(color: Colors.grey),
                                  ),

                                  Spacer(),

                                  CustomChip( 
                                    text            : 'Capturada',
                                    backgroundColor : Colors.green.shade100,
                                    textColor       : Colors.green.shade300,
                                  ),

                                  // CountLogsChip( text:'Capturada' ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
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
