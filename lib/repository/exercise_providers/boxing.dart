import 'package:gym_mate/models/exercise/exercise.dart';
import 'package:gym_mate/models/exercise/instruction.dart';

final List<Exercise> boxing = [
  Exercise(
      name: "Jab-Cross Combination",
      category: "Boxing",
      muscleGroup: "Arms",
      equipment: "None",
      animationUrl: "https://example.com/jab_cross_combination.gif",
      difficulty: "Beginner",
      instructions: [
        Instruction(
            details:
                "Stand in a fighting stance with your feet shoulder-width apart, dominant foot slightly back."),
        Instruction(
            details:
                "Jab forward with your lead hand (left if you're orthodox), keeping your elbow slightly bent."),
        Instruction(
            details:
                "As you retract your lead hand, throw a cross punch with your rear hand (right if you're orthodox), rotating your hips for power."),
        Instruction(
            details: "Return to your guard position quickly after the cross."),
        Instruction(
            details:
                "Keep your non-punching hand up to protect your face, and engage your core for balance.")
      ]),
  Exercise(
      name: "Uppercut",
      category: "Boxing",
      muscleGroup: "Arms",
      equipment: "None",
      animationUrl: "https://example.com/uppercut.gif",
      difficulty: "Intermediate",
      instructions: [
        Instruction(
            details: "Start in your fighting stance, with your guard up."),
        Instruction(
            details:
                "Bend your knees slightly to generate power from your legs."),
        Instruction(
            details:
                "Punch upward in a curved motion with your rear hand, targeting the chin of your opponent."),
        Instruction(
            details:
                "Rotate your hips and shoulders as you throw the uppercut to add power."),
        Instruction(
            details:
                "Return to your guard position after completing the punch."),
        Instruction(
            details:
                "Focus on speed and precision rather than brute strength to land an effective uppercut.")
      ]),
  Exercise(
      name: "Hook",
      category: "Boxing",
      muscleGroup: "Arms",
      equipment: "None",
      animationUrl: "https://example.com/hook.gif",
      difficulty: "Intermediate",
      instructions: [
        Instruction(details: "Assume a fighting stance, with your guard up."),
        Instruction(
            details:
                "Pivot your lead foot (left foot if orthodox) and rotate your hips."),
        Instruction(
            details:
                "Throw a hook punch with your lead arm in a horizontal motion, aiming for your opponent's jaw or temple."),
        Instruction(
            details:
                "Keep your elbow bent at 90 degrees as you swing your arm."),
        Instruction(
            details:
                "Quickly retract your arm and return to your guard position."),
        Instruction(
            details:
                "Rotate your body for more power, and avoid overextending your arm during the hook.")
      ]),
  Exercise(
      name: "Body Shot",
      category: "Boxing",
      muscleGroup: "Core",
      equipment: "None",
      animationUrl: "https://example.com/body_shot.gif",
      difficulty: "Intermediate",
      instructions: [
        Instruction(details: "Start in a fighting stance with your guard up."),
        Instruction(
            details: "Bend your knees slightly and dip your upper body lower."),
        Instruction(
            details:
                "Drive a punch into your opponent's midsection with your rear hand."),
        Instruction(
            details: "Rotate your hips for additional power as you punch."),
        Instruction(
            details:
                "Immediately return to your guard position to protect yourself."),
        Instruction(
            details:
                "Maintain a strong core and stay balanced during the punch to avoid leaving yourself exposed.")
      ]),
  Exercise(
      name: "Speed Bag",
      category: "Boxing",
      muscleGroup: "Arms",
      equipment: "Speed Bag",
      animationUrl: "https://example.com/speed_bag.gif",
      difficulty: "Beginner",
      instructions: [
        Instruction(
            details:
                "Stand in front of the speed bag, feet shoulder-width apart."),
        Instruction(
            details:
                "Hold your fists up near the speed bag, with elbows bent."),
        Instruction(
            details:
                "Begin punching the bag with alternating hands, using a circular motion."),
        Instruction(
            details:
                "Maintain a steady rhythm to keep the bag moving consistently."),
        Instruction(
            details:
                "Focus on speed, coordination, and keeping your punches light to maintain control."),
        Instruction(
            details:
                "Keep your punches compact and your movements smooth to avoid losing rhythm.")
      ]),
];
