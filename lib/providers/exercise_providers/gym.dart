import 'package:gym_mate/models/exercise/exercise.dart';
import 'package:gym_mate/models/exercise/instruction.dart';

final List<Exercise> gym = [
  Exercise(
      id: "",
      name: "Barbell Bench Press",
      category: "Strength",
      muscleGroup: "Chest",
      equipment: "Barbell",
      animationUrl:
          "https://images.pexels.com/photos/14623620/pexels-photo-14623620.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      difficulty: "Intermediate",
      instructions: [
        Instruction(
            details:
                "Lie on a flat bench with your feet firmly on the ground."),
        Instruction(
            details:
                "Hold the barbell with a grip slightly wider than shoulder-width, and lift it off the rack."),
        Instruction(
            details:
                "Lower the barbell to your chest while keeping your elbows at a 45-degree angle."),
        Instruction(
            details:
                "Press the barbell back up until your arms are fully extended."),
        Instruction(
            details:
                "Keep your core engaged and your back flat against the bench throughout the movement.")
      ]),
  Exercise(
      id: "",
      name: "Squats",
      category: "Strength",
      muscleGroup: "Legs",
      equipment: "Barbell",
      animationUrl:
          "https://images.pexels.com/photos/5837242/pexels-photo-5837242.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      difficulty: "Intermediate",
      instructions: [
        Instruction(
            details:
                "Stand with feet shoulder-width apart, holding the barbell across your upper back."),
        Instruction(
            details:
                "Engage your core and lower your hips back and down as if sitting into a chair."),
        Instruction(
            details:
                "Keep your chest up and knees in line with your toes while descending."),
        Instruction(
            details:
                "Push through your heels to return to a standing position."),
        Instruction(
            details:
                "Make sure to maintain a neutral spine throughout the squat to avoid injury.")
      ]),
  Exercise(
      id: "",
      name: "Deadlifts",
      category: "Strength",
      muscleGroup: "Back, Legs",
      equipment: "Barbell",
      animationUrl:
          "https://images.pexels.com/photos/12652601/pexels-photo-12652601.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      difficulty: "Advanced",
      instructions: [
        Instruction(
            details:
                "Stand with feet hip-width apart, with the barbell positioned over your mid-foot."),
        Instruction(
            details:
                "Bend your knees and grasp the bar with an overhand or mixed grip."),
        Instruction(
            details:
                "Lift the bar by extending your hips and knees simultaneously, keeping your back straight."),
        Instruction(
            details:
                "Stand tall with your shoulders back and the bar close to your body at the top of the lift."),
        Instruction(
            details:
                "Avoid rounding your back during the lift to reduce the risk of injury.")
      ]),
  Exercise(
      id: "",
      name: "Dumbbell Bicep Curl",
      category: "Strength",
      muscleGroup: "Arms",
      equipment: "Dumbbells",
      animationUrl:
          "https://images.pexels.com/photos/6550875/pexels-photo-6550875.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      difficulty: "Beginner",
      instructions: [
        Instruction(
            details:
                "Stand with a dumbbell in each hand, arms fully extended at your sides."),
        Instruction(
            details:
                "Curl the weights up by bending your elbows, keeping your upper arms stationary."),
        Instruction(
            details:
                "Slowly lower the dumbbells back to the starting position."),
        Instruction(
            details: "Maintain a controlled motion throughout the exercise."),
        Instruction(
            details:
                "Avoid using momentum; focus on engaging your biceps to lift the weights.")
      ]),
  Exercise(
      id: "",
      name: "Lat Pulldown",
      category: "Strength",
      muscleGroup: "Back",
      equipment: "Pulldown Machine",
      animationUrl:
          "https://images.pexels.com/photos/29084397/pexels-photo-29084397/free-photo-of-back-view-of-a-man-doing-pull-ups-in-a-gym.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      difficulty: "Beginner",
      instructions: [
        Instruction(
            details:
                "Sit on the machine with your knees secured under the pad."),
        Instruction(
            details:
                "Grip the bar with a wide grip, palms facing away from you."),
        Instruction(
            details:
                "Pull the bar down to your chest while squeezing your shoulder blades together."),
        Instruction(
            details:
                "Slowly return the bar to the starting position while maintaining control."),
        Instruction(
            details:
                "Keep your back straight and avoid leaning back excessively during the pull.")
      ]),
];
