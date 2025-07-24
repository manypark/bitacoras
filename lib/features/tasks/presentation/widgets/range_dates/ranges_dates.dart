// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bitacoras/core/utils/constants/layout_constans.dart';
import 'package:bitacoras/core/configs/theme/fonts/fonts_global.dart';
import 'package:bitacoras/features/auth/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/tasks/presentation/blocs/blocs.dart';
import 'package:bitacoras/features/tasks/infrastructure/infrastructure.dart';

class RangeDatesWidget extends StatelessWidget {

  const RangeDatesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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

                  Text( '2025-07-01  -  ', style: GlobalFonts.paragraphBodyMediumRegular,),

                  Text( '2025-07-23', style: GlobalFonts.paragraphBodyMediumRegular, ),

                ],
              ),
            ),
          ),

          SizedBox(width: LayoutConstants.spaceL),

          BlocBuilder<LoginBloc, LoginState>( builder: (context, state) {

              return FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                child: const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                onPressed: () async {
                  final DateTimeRange? picked = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                    cancelText: 'Cancelar',
                    confirmText: 'Filtrar',
                    helpText: 'Selecciona el rango de fechas',
                    fieldEndLabelText: 'Fecha fin',
                    fieldStartLabelText: 'Fecha inicio',
                    initialDateRange: DateTimeRange(
                      start : DateTime.now(),
                      end   : DateTime.now().add(const Duration(days: 7)),
                    ),
                  );

                  if( picked != null ) {
                    context.read<TasksBloc>().loadListTasks(
                      GetTasksRequestDto(
                        idUserAssigned: context.read<LoginBloc>().state.userLogin?.idUser ?? 26, 
                        initDate      : picked.start.toString().split(' ')[0].toString(),
                        endDate       : picked.end.toString().split(' ')[0].toString(),
                      )
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
