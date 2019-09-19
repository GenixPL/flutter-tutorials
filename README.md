# Scoped Model
This architecture is good when we are passing data (encapsulated inside one class) between widgets that have a common parent (it's just a nice replacement of a `State` and it's not suited for changing routes).

### __Usage:__
+ We encapsulate fields into a single class, which inherits from a `Model` class (remember about `notifyListeners()`).
+ We wrap our parent widget with `ScopedModel<T>`.
+ We wrap widgets which will use given model with `ScopedModelDescendant<T>` and they will be rebuilt after each notification.