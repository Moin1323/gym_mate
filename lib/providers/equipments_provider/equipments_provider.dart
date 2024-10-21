import 'package:gym_mate/models/equipments/equipments.dart';

final List<Equipment> equipmentList = [
  Equipment(
    name: "Barbell",
    description:
        "A long bar with weights on each end, used for strength training.",
    category: "Strength",
    imageUrl: "https://example.com/barbell.jpg",
    availableSizes: ["Standard", "Olympic"],
  ),
  Equipment(
    name: "Dumbbell",
    description:
        "A short bar with weights on both ends, used for strength training.",
    category: "Strength",
    imageUrl: "https://example.com/dumbbell.jpg",
    availableSizes: ["5 lbs", "10 lbs", "15 lbs", "20 lbs"],
  ),
  Equipment(
    name: "Kettlebell",
    description:
        "A cast-iron weight with a handle, used for functional training.",
    category: "Strength",
    imageUrl: "https://example.com/kettlebell.jpg",
    availableSizes: ["10 lbs", "20 lbs", "30 lbs", "40 lbs"],
  ),
  Equipment(
    name: "Pull-up Bar",
    description: "A horizontal bar for performing pull-ups and chin-ups.",
    category: "Strength",
    imageUrl: "https://example.com/pullup_bar.jpg",
    availableSizes: null, // No specific sizes available
  ),
  Equipment(
    name: "Speed Bag",
    description:
        "A small, air-filled bag used for training hand speed and coordination.",
    category: "Boxing",
    imageUrl: "https://example.com/speed_bag.jpg",
    availableSizes: ["Small", "Medium", "Large"],
  ),
  Equipment(
    name: "Jump Rope",
    description: "A rope used for skipping to improve cardiovascular fitness.",
    category: "Cardio",
    imageUrl: "https://example.com/jump_rope.jpg",
    availableSizes: ["8 ft", "10 ft", "12 ft"],
  ),
  Equipment(
    name: "Resistance Bands",
    description: "Elastic bands used for strength training and rehabilitation.",
    category: "Strength",
    imageUrl: "https://example.com/resistance_bands.jpg",
    availableSizes: ["Light", "Medium", "Heavy"],
  ),
  Equipment(
    name: "Medicine Ball",
    description:
        "A weighted ball used for strength training and core exercises.",
    category: "Strength",
    imageUrl: "https://example.com/medicine_ball.jpg",
    availableSizes: ["4 lbs", "8 lbs", "12 lbs", "16 lbs"],
  ),
  Equipment(
    name: "Treadmill",
    description: "A machine used for running or walking indoors.",
    category: "Cardio",
    imageUrl: "https://example.com/treadmill.jpg",
    availableSizes: null, // No specific sizes available
  ),
  Equipment(
    name: "Stationary Bike",
    description: "A bike designed for indoor cycling workouts.",
    category: "Cardio",
    imageUrl: "https://example.com/stationary_bike.jpg",
    availableSizes: null, // No specific sizes available
  ),
];
