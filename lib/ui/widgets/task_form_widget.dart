import 'package:flutter/material.dart';
import 'package:tasks/ui/general/colors.dart';
import 'package:tasks/ui/widgets/button_normal_widget.dart';
import 'package:tasks/ui/widgets/general.widgets.dart';
import 'package:tasks/ui/widgets/textfield_normal_widget.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({super.key});

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  showSelectDate() async {
    DateTime? datetime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      cancelText: "Cancelar",
      confirmText: "Aceptar",
      helpText: "Seleccionar fecha",
      builder: (BuildContext context, Widget? widget) {
        return Theme(
          data: ThemeData.light().copyWith(
            dialogBackgroundColor: Colors.white,
            dialogTheme: DialogTheme(
              elevation: 0,
              backgroundColor: kBrandPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            colorScheme: ColorScheme.light(
              primary: kBrandPrimaryColor,
            ),
          ),
          child: widget!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22.0),
          topRight: Radius.circular(22.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Agregar tarea",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
            ),
          ),
          divider10(),
          TextFieldNormalWidget(
            hintText: "Titulo",
            icon: Icons.text_fields,
          ),
          divider10(),
          TextFieldNormalWidget(
            hintText: "Descripción",
            icon: Icons.description,
          ),
          divider10(),
          Text("Categorias: "),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            spacing: 10.0,
            children: [
              FilterChip(
                selected: true,
                backgroundColor: kBrandSecondaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                selectedColor: categoryColor["Personal"],
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                label: Text("Personal"),
                onSelected: (bool value) {},
              ),
              FilterChip(
                selected: true,
                backgroundColor: kBrandSecondaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                selectedColor: categoryColor["Trabajo"],
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                label: Text("Trabajo"),
                onSelected: (bool value) {},
              ),
              FilterChip(
                selected: true,
                backgroundColor: kBrandSecondaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                selectedColor: categoryColor["Otro"],
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                label: Text("Otro"),
                onSelected: (bool value) {},
              ),
            ],
          ),
          divider10(),
          TextFieldNormalWidget(
            hintText: "Fecha",
            icon: Icons.date_range,
            onTap: () {
              showSelectDate();
            },
          ),
          divider20(),
          ButtonNormalWidget(),
        ],
      ),
    );
  }
}
