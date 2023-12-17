enum Complexity {
  Simple,
  Medium,
  Difficult,
}

enum Cost {
  Cheap,
  Fair,
  Expensive,
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final List categories;
  final List ingredients;
  final List steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  Meal({
    required this.title, 
    required this.id,
    required this.imageUrl,
    required this.categories, 
    required this.ingredients, 
    required this.steps, 
    required this.duration, 
    required this.isGlutenFree, 
    required this.isLactoseFree, 
    required this.isVegan, 
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

  String get complexityText {
    switch (complexity) {
      case (Complexity.Simple):
        return 'Simples';
      case (Complexity.Medium):
        return 'Médio';
      case (Complexity.Difficult):
        return 'Difícil';
      default:
        return 'Desconhecido';
    }
  }

  String get costText {
    switch (cost) {
      case (Cost.Cheap):
        return 'Barato';
      case (Cost.Fair):
        return 'Justo';
      case (Cost.Expensive):
        return 'Caro';
      default:
        return 'Desconhecido';
    }
  }

}