extension CallExtensions<T> on T {
  TOut let<TOut>(TOut Function(T) transform) {
    if (this == null) {
      return null;
    }
    return transform(this);
  }
}