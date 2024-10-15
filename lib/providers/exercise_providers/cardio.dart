import 'package:gym_mate/models/exercise/exercise.dart';
import 'package:gym_mate/models/exercise/instruction.dart';

final List<Exercise> cardio = [
  Exercise(
      name: "Jumping Jacks",
      category: "Cardio",
      muscleGroup: "Full Body",
      equipment: "None",
      animationUrl: "https://example.com/jumping_jacks.gif",
      difficulty: "Beginner",
      instructions: [
        Instruction(
            details:
                "Stand upright with your feet together and hands resting at your sides."),
        Instruction(
            details:
                "Jump your feet out to shoulder-width apart while simultaneously raising your arms overhead."),
        Instruction(
            details:
                "Immediately jump back to the starting position, bringing your feet together and lowering your arms."),
        Instruction(
            details:
                "Repeat these movements rapidly, ensuring a controlled breathing pattern (inhale as you raise your arms, exhale as you return)."),
        Instruction(
            details:
                "Land softly on the balls of your feet to minimize impact on your knees and joints."),
      ]),
  Exercise(
      name: "Burpees",
      category: "Cardio",
      muscleGroup: "Full Body",
      equipment: "None",
      animationUrl: "https://example.com/burpees.gif",
      difficulty: "Intermediate",
      instructions: [
        Instruction(
            details: "Stand upright with your feet shoulder-width apart."),
        Instruction(
            details:
                "Drop into a squat position by bending your knees and lowering your hips."),
        Instruction(
            details:
                "Place your hands on the ground and kick your feet back into a plank position."),
        Instruction(
            details:
                "Perform one push-up, keeping your body straight and core engaged."),
        Instruction(
            details: "Jump your feet forward, back into the squat position."),
        Instruction(
            details: "Explosively jump upward, reaching your arms overhead."),
        Instruction(
            details:
                "Maintain a smooth flow between movements, and breathe out as you jump up."),
      ]),
  Exercise(
      name: "High Knees",
      category: "Cardio",
      muscleGroup: "Legs",
      equipment: "None",
      animationUrl: "https://example.com/high_knees.gif",
      difficulty: "Beginner",
      instructions: [
        Instruction(details: "Stand tall with your feet hip-width apart."),
        Instruction(
            details:
                "Begin jogging in place, raising your knees as high as possible (to at least hip height)."),
        Instruction(
            details:
                "Pump your arms as you move, using them to maintain a steady rhythm."),
        Instruction(
            details:
                "Keep your torso upright and avoid leaning back as you bring your knees up."),
        Instruction(
            details:
                "Continue alternating your legs quickly, ensuring your knees are aligned with your hips."),
        Instruction(
            details:
                "Maintain a fast pace while keeping your core engaged to prevent excessive sway."),
      ]),
  Exercise(
      name: "Mountain Climbers",
      category: "Cardio",
      muscleGroup: "Core",
      equipment: "None",
      animationUrl: "https://example.com/mountain_climbers.gif",
      difficulty: "Intermediate",
      instructions: [
        Instruction(
            details:
                "Start in a high plank position with your hands directly under your shoulders and legs extended."),
        Instruction(
            details:
                "Drive one knee towards your chest while keeping the other leg extended."),
        Instruction(
            details:
                "Quickly switch legs, bringing the opposite knee to your chest as you extend the other leg."),
        Instruction(
            details:
                "Continue alternating legs rapidly while maintaining a strong plank position."),
        Instruction(
            details:
                "Ensure your hips stay level throughout the movement, without sagging or lifting."),
        Instruction(
            details:
                "Focus on speed, but maintain proper form by keeping your core tight and shoulders stable."),
      ]),
  Exercise(
      name: "Butt Kicks",
      category: "Cardio",
      muscleGroup: "Legs",
      equipment: "None",
      animationUrl: "https://example.com/butt_kicks.gif",
      difficulty: "Beginner",
      instructions: [
        Instruction(details: "Start jogging in place with a controlled pace."),
        Instruction(
            details:
                "Kick your heels up towards your glutes, alternating legs as you jog."),
        Instruction(
            details:
                "Maintain a steady rhythm, kicking back as high as possible with each step."),
        Instruction(
            details:
                "Keep your core engaged and your knees pointing straight down during the movement."),
        Instruction(
            details:
                "Continue alternating legs rapidly, focusing on smooth, controlled movements."),
        Instruction(
            details:
                "Avoid arching your back as you kick, and use your arms to maintain balance and rhythm."),
      ]),
];
