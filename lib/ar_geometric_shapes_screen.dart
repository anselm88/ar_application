import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArGeometrucShapeScreen extends StatefulWidget {
  const ArGeometrucShapeScreen({Key? key}) : super(key: key);

  @override
  State<ArGeometrucShapeScreen> createState() => _ArGeometricShapeScreenState();
}

class _ArGeometricShapeScreenState extends State<ArGeometrucShapeScreen> {
  ArCoreController? coreController;

  augmentedRealityViewCreated(ArCoreController controller) {
    coreController = controller;
    displayCube(coreController!);
    displayCylinder(coreController!);
  }
  displayCylinder(ArCoreController? controller) {
    final material = ArCoreMaterial(color: Colors.green, reflectance: 2,);
    final cylinder = ArCoreCylinder(materials: [material], radius: 0.5, height: 0.5);
    final node = ArCoreNode(
      shape: cylinder,
      position:  vector64.Vector3(0.0, -0.5, -2.0),
    );
    coreController!.addArCoreNode(node);
  }
  displayCube(ArCoreController? controller) {
    final material = ArCoreMaterial(color: Colors.amberAccent, metallic: 2,);
    final cube = ArCoreCube(materials: [material], size: vector64.Vector3(0.5, 0.5, 0.5));
    final node = ArCoreNode(
      shape: cube,
      position:  vector64.Vector3(-0.5, 0.5, -3.5),
    );
    coreController!.addArCoreNode(node);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geometric Shapes'),
        centerTitle: true,
      ),
      body: ArCoreView(
        onArCoreViewCreated: augmentedRealityViewCreated,
      ),
    );
  }
}
