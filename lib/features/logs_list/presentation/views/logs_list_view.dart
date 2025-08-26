import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/core.dart';
import 'package:bitacoras/features/logs_list/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/logs_form/infrastructure/enums/enums.dart';
import 'package:bitacoras/features/logs_list/presentation/widgets/widgets.dart';

class LogsListView extends StatelessWidget {
  
  const LogsListView({super.key});

  @override
  Widget build(BuildContext context) {

    final logsList = context.watch<LogsListBloc>().state.logsList;

    return Padding(
      padding : const EdgeInsets.symmetric( horizontal:LayoutConstants.paddingL ),
      child   : Column(
        children: [

          Expanded(
            child: ListView.builder(
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
            
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing           : LayoutConstants.spaceL,
                              children          : [
                                
                                Row(
                                  crossAxisAlignment : CrossAxisAlignment.start,
                                  children          : [

                                    ImageLogWidget(log:log),
                                    SizedBox( width:  LayoutConstants.spaceL,),
                                    
                                    ConceptAndTasktitleTextWidget(log:log),
            
                                    Spacer(),
            
                                    if( log.status == LogStatusEnum.capturated )
                                    UploadLogButtonWidget(log:log),
            
                                    if( log.status == LogStatusEnum.uploaded )
                                    DeletelogButtonWidget( idLog: log.idLog ,)
                                  ],
                                ),
            
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  spacing : LayoutConstants.spaceL,
                                  children: [
                                    LogDescriptionTextWidget(log:log),
                                    TimeLogAndStatusWidget(log:log),
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
          ),

          const SizedBox( height: LayoutConstants.spaceXL * 2.8 ,),
        ],
      ),
    );
  }
}