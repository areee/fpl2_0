import 'dart:math';

enum AppBarValues { settings, about }

enum TimerStatus {
  running,
  paused,
  stopped,
}

/// Test data for multi avatar participants
List<String> testParticipantNamesInList = [
  'Amy',
  'Bob',
  'Cathy',
  'David',
  'Eve',
  'Frank',
  'George',
  'Hannah',
  'Irene',
  'Jack',
  'Kathy',
  'Linda',
  // 'Mandy',
  // 'Nancy',
  // 'Olivia',
  // 'Penny',
  // 'Quinn',
  // 'Ruth',
  // 'Sally',
  // 'Tina',
  // 'Ursula',
  // 'Vicky',
  // 'Wendy',
  // 'Xavier',
  // 'Yvonne',
  // 'Zoe'
];

/// Returns days of the week in English
List<String> weekDays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

/// Returns the day of the week in Finnish
String getWeekDay(int day) {
  return weekDays[day];
}

/// Returns adjectives in English
List<String> adjectives = [
  'amazing',
  'beautiful',
  'crazy',
  'delightful',
  'elegant',
  'fabulous',
  'gorgeous',
  'happy',
  'intelligent',
  'joyful',
  'kind',
  'lovely',
  'magnificent',
  'nice',
  'optimistic',
  'perfect',
  'quiet',
  'rational',
  'silly',
  'talented',
  'unique',
  'victorious',
  'wonderful',
  'xenial',
  'young',
  'zealous',
];

/// Returns a random adjective
String getAdjective() {
  return adjectives[Random().nextInt(adjectives.length)];
}
