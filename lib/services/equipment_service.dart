import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gym_mate/models/equipments/equipments.dart';

class EquipmentService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void uploadAllEquipments(List<Equipment> equipments) {
    for (var equipment in equipments) {
      final docRef = _firestore.collection("Equipments").doc();
      final newEquipment = Equipment(
        id: docRef.id,
        name: equipment.name,
        description: equipment.description,
        category: equipment.category,
        imageUrl: equipment.imageUrl,
        availableSizes: equipment.availableSizes,
      );

      docRef.set(newEquipment.toJson()).then((_) {
        print("Equipment '${newEquipment.name}' uploaded successfully!");
      }).catchError((error) {
        print("Failed to upload equipment '${newEquipment.name}': $error");
      });
    }
  }

  Future<List<Equipment>> fetchAllEquipments() async {
    List<Equipment> equipmentList = [];

    try {
      // Fetch all equipments from Firestore
      QuerySnapshot snapshot = await _firestore.collection("Equipments").get();

      // Loop through the documents and create Equipment objects
      for (var doc in snapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        Equipment equipment = Equipment(
          id: doc.id, // Set ID from document ID
          name: data['name'],
          description: data['description'],
          category: data['category'],
          imageUrl: data['imageUrl'],
          availableSizes: data['availableSizes'] != null
              ? List<String>.from(data['availableSizes'])
              : null,
        );

        equipmentList.add(equipment);
      }
    } catch (e) {
      print("Error fetching equipments: $e");
    }

    return equipmentList;
  }
}
