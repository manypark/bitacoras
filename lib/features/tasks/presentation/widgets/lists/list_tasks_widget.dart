import 'package:flutter/material.dart';

import 'package:bitacoras/core/configs/configs.dart';
import 'package:bitacoras/features/tasks/domain/domain.dart';

class ListTasksWidget extends StatelessWidget {

  final List<TasksEntity> tasks;
  
  const ListTasksWidget({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
    
          ...tasks.map( (task) {
            return Container(
              margin    : EdgeInsets.symmetric( horizontal: 12, vertical: 12 ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color       : Colors.white,
                boxShadow   : [
                  BoxShadow(
                    blurRadius: 5,
                    color     : Colors.black12,
                    offset    : Offset(0, 5)
                  )
                ]
              ),
              child: InkWell(
                onTap: () {
                  
                },
                child: ListTile(
                  title   : Text(task.title, style: GlobalFonts.paragraphBodyLargeBold,),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( task.description ),
                      Chip( 
                        label: Text(
                          task.status, 
                          style: GlobalFonts.paragraphBodyMediumBold.copyWith( 
                            color: Colors.red.shade300
                          )
                        ),
                        backgroundColor: Colors.red.shade100, side: BorderSide.none,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    
        ],
      ),
    );
  }
}