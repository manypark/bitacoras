// ignore_for_file: use_build_context_synchronously
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/features/tasks/domain/models/models.dart';
import 'package:bitacoras/core/utils/constants/layout_constans.dart';
import 'package:bitacoras/core/configs/theme/fonts/fonts_global.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/tasks/presentation/blocs/blocs.dart';

class RangeDatesWidget extends StatelessWidget {

  const RangeDatesWidget({ super.key });

  @override
  Widget build(BuildContext context) {

      return MultiBlocProvider(
        providers : [
          BlocProvider<LoginBloc>( create: (_) => LoginBloc() ),
          BlocProvider<RangeDatesBloc>( create: (_) => RangeDatesBloc() ),
        ],
        child     : Padding(
          padding : EdgeInsets.all(LayoutConstants.paddingL),
          child   : Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(LayoutConstants.paddingL),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color       : Colors.white,
                    border      : Border.all( width: 0.5, ),
                  ),
                  child: Row(
                    children: [
        
                      Text( 
                        '${DateFormat('yyyy-MM-dd').format( context.watch<RangeDatesBloc>().state.startDate )} -  ', 
                        style: GlobalFonts.paragraphBodyMediumRegular,
                      ),
        
                      Text( 
                        DateFormat('yyyy-MM-dd').format( context.watch<RangeDatesBloc>().state.endDate ), 
                        style: GlobalFonts.paragraphBodyMediumRegular,
                      ),
        
                    ],
                  ),
                ),
              ),
        
              SizedBox(width: LayoutConstants.spaceL),
        
              FloatingActionButton(
                heroTag: 'RangeDates',
                backgroundColor: Colors.blueAccent,
                child: const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                onPressed: () async {
                  final DateTimeRange? picked = await showDateRangePicker(
                    context             : context,
                    firstDate           : DateTime(2000),
                    lastDate            : DateTime(2100),
                    initialEntryMode    : DatePickerEntryMode.calendarOnly,
                    cancelText          : 'Cancelar',
                    confirmText         : 'Filtrar',
                    helpText            : 'Selecciona el rango de fechas',
                    fieldEndLabelText   : 'Fecha fin',
                    fieldStartLabelText : 'Fecha inicio',
                    initialDateRange    : DateTimeRange(
                      start : context.read<RangeDatesBloc>().state.startDate,
                      end   : context.read<RangeDatesBloc>().state.endDate,
                    ),
                  );
      
                  if( picked != null ) {
      
                    context.read<RangeDatesBloc>().onUpdateStartAdnEndDate( picked.start, picked.end );
      
                    context.read<TasksBloc>().loadListTasks(
                      GetTasksModel(
                        idUserAssigned: context.read<LoginBloc>().state.userLogin?.idUser ?? 0, 
                        initDate      : DateFormat('yyyy-MM-dd').format( picked.start ),
                        endDate       : DateFormat('yyyy-MM-dd').format( picked.end ),
                      )
                    );
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
