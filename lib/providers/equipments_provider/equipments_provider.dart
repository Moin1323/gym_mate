import 'package:gym_mate/models/equipments/equipments.dart';

final List<Equipment> equipmentList = [
  Equipment(
    id: "", // Placeholder, to be set with Firestore document ID
    name: "Dumbbells",
    description:
        "Versatile hand weights used for strength training exercises. They help in building muscle mass, endurance, and coordination. Available in various sizes to suit different fitness levels.",
    category: "Strength",
    imageUrl:
        "https://images.pexels.com/photos/3289711/pexels-photo-3289711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    availableSizes: [
      "2.5kg",
      "5kg",
      "10kg",
      "15kg",
      "20kg",
      "25kg",
      "30kg",
      "35kg"
    ],
  ),
  Equipment(
    id: "",
    name: "Speed Bag",
    description:
        "A small, air-filled bag used for improving hand-eye coordination, speed, and rhythm. It's a staple in boxing gyms and can be mounted on a stand or attached to the ceiling.",
    category: "Boxing",
    imageUrl:
        "https://images.pexels.com/photos/17279413/pexels-photo-17279413/free-photo-of-man-training-box-at-the-gym.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  ),
  Equipment(
    id: "",
    name: "Heavy Bag",
    description:
        "A large, cylindrical bag used for practicing punches, kicks, and strikes. It helps in improving power, technique, and endurance. Typically filled with sand or fabric.",
    category: "Boxing",
    imageUrl: "https://example.com/heavy_bag.png",
  ),
  Equipment(
    id: "",
    name: "Boxing Gloves",
    description:
        "Padded gloves used in boxing to protect the hands and wrists during punches. They come in various weights and are essential for sparring and hitting the heavy bag.",
    category: "Boxing",
    imageUrl: "https://example.com/boxing_gloves.png",
  ),
  Equipment(
    id: "",
    name: "Jump Rope",
    description:
        "A lightweight rope used for cardio exercises, improving agility, footwork, and endurance. It's a common warm-up tool in boxing and other sports.",
    category: "Cardio",
    imageUrl: "https://example.com/jump_rope.png",
  ),
  Equipment(
    id: "",
    name: "Focus Mitts",
    description:
        "Handheld pads used by a trainer to catch punches and kicks during training. They help improve accuracy, speed, and timing.",
    category: "Boxing",
    imageUrl: "https://example.com/focus_mitts.png",
  ),
  Equipment(
    id: "",
    name: "Boxing Ring",
    description:
        "A square platform surrounded by ropes where boxers engage in matches or sparring. It's essential for competition and practicing footwork in a confined space.",
    category: "Boxing",
    imageUrl: "https://example.com/boxing_ring.png",
  ),
  Equipment(
    id: "",
    name: "Resistance Bands",
    description:
        "Elastic bands used for strength training, helping to increase muscle resistance. They can be used in boxing to enhance punching power and improve endurance.",
    category: "Strength",
    imageUrl:
        "https://images.pexels.com/photos/11869773/pexels-photo-11869773.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  ),
  Equipment(
    id: "",
    name: "Kettlebell",
    description:
        "A cast-iron weight with a handle, used for strength and conditioning exercises. It's often used in cross-training to improve functional strength and endurance.",
    category: "Strength",
    imageUrl:
        "https://images.pexels.com/photos/7689289/pexels-photo-7689289.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  ),
  Equipment(
    id: "",
    name: "Medicine Ball",
    description:
        "A weighted ball used for dynamic strength training, particularly in core exercises. It helps improve power and coordination, especially in rotational movements like punches.",
    category: "Strength",
    imageUrl: "https://example.com/medicine_ball.png",
  ),
  Equipment(
    id: "",
    name: "Punching Dummy",
    description:
        "A freestanding dummy designed to withstand strikes and simulate a real opponent. Used in boxing and MMA training to practice accuracy and power.",
    category: "Boxing",
    imageUrl: "https://example.com/punching_dummy.png",
  ),
  Equipment(
    id: "",
    name: "Skipping Rope",
    description:
        "A weighted jump rope designed to provide additional resistance and build endurance, strength, and coordination. Commonly used for cardio and boxing training.",
    category: "Cardio",
    imageUrl: "https://example.com/weighted_skipping_rope.png",
  ),
  Equipment(
    id: "",
    name: "Treadmill",
    description:
        "A cardio machine that allows users to run or walk in place. It can simulate various terrains and is widely used to improve cardiovascular endurance.",
    category: "Cardio",
    imageUrl:
        "https://images.pexels.com/photos/11175793/pexels-photo-11175793.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  ),
  Equipment(
    id: "",
    name: "Elliptical Machine",
    description:
        "A stationary exercise machine used to simulate stair climbing, walking, or running without causing excessive pressure on the joints. It's commonly used in cardio workouts.",
    category: "Cardio",
    imageUrl: "https://example.com/elliptical.png",
  ),
  Equipment(
    id: "",
    name: "Stationary Bike",
    description:
        "An exercise bike used for indoor cycling workouts, helping to build cardiovascular fitness while minimizing impact on joints.",
    category: "Cardio",
    imageUrl:
        "https://images.pexels.com/photos/7689289/pexels-photo-7689289.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  ),
  Equipment(
    id: "",
    name: "Boxing Shoes",
    description:
        "Specialized shoes designed for boxing, offering ankle support and grip for better footwork and stability in the ring.",
    category: "Boxing",
    imageUrl: "https://example.com/boxing_shoes.png",
  ),
  Equipment(
    id: "",
    name: "Agility Ladder",
    description:
        "A flat ladder placed on the ground to help athletes improve their foot speed, coordination, and agility. It's widely used in cardio and boxing drills.",
    category: "Cardio",
    imageUrl: "https://example.com/agility_ladder.png",
  ),
  Equipment(
    id: "",
    name: "Battle Ropes",
    description:
        "Heavy-duty ropes used for strength and cardio workouts. They help improve upper body strength, endurance, and overall conditioning.",
    category: "Cardio",
    imageUrl: "https://example.com/battle_ropes.png",
  ),
  Equipment(
    id: "",
    name: "Speed Chute",
    description:
        "A parachute-like device worn while sprinting, creating resistance to improve acceleration, speed, and endurance.",
    category: "Cardio",
    imageUrl: "https://example.com/speed_chute.png",
  ),
  Equipment(
    id: "",
    name: "Smith Machine",
    description:
        "A weight training machine designed to provide stability and safety during heavy lifts such as squats and bench presses.",
    category: "Strength",
    imageUrl: "https://example.com/smith_machine.png",
  ),
  Equipment(
    id: "",
    name: "Pull-Up Bar",
    description: "A horizontal bar for performing pull-ups and chin-ups.",
    category: "Strength",
    imageUrl:
        "https://images.pexels.com/photos/7671462/pexels-photo-7671462.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    availableSizes: null,
  ),
  Equipment(
    id: "",
    name: "Barbell",
    description:
        "A long bar with weights on each end, used for strength training.",
    category: "Strength",
    imageUrl:
        "https://images.pexels.com/photos/1552106/pexels-photo-1552106.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    availableSizes: ["Standard", "Olympic"],
  ),
];
