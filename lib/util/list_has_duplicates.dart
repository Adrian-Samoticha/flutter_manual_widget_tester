extension ListHasDuplicates<T> on List<T> {
  bool hasDuplicates(dynamic Function(T) predicate) {
    final iteratedOver = <dynamic>{};
    
    for (final element in this) {
      final value = predicate(element);
      
      if (iteratedOver.contains(value)) {
        return true;
      }
      iteratedOver.add(value);
    }
    
    return false;
  }
}