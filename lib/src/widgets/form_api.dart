import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled1/src/models/Mantenimiento.dart';
import 'package:untitled1/src/services/mantenimiento_service.dart';

class formAPI2 extends StatefulWidget {
  const formAPI2({super.key});

  @override
  State<formAPI2> createState() => _formAPI2State();
}

class _formAPI2State extends State<formAPI2> {
  List<Mantenimiento>? _lista;

  loadMantenimientos() async {
    MantenimientoService service = MantenimientoService();
    _lista = await service.getMantenimientos();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    loadMantenimientos();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: _lista == null
          ? const Center(
              child: SizedBox.square(
                  dimension: 50.0, child: CircularProgressIndicator()),
            )
          : ListView(
              children: _lista!
                  .map((e) =>
                      Card(child: ListTile(title: Text(e.titulo.toString()))))
                  .toList(),
            ),
    );
  }
}
