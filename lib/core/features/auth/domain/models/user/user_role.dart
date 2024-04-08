enum UserRole {
  parent,
  child;

  bool get isParent => this == parent;
  bool get isChild => this == child;
}
