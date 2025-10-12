class Device {
  /// The device type (mobile, tablet, desktop, etc.)
  final String type;

  /// The device vendor (Apple, Samsung, etc.)
  final String vendor;

  /// The device model
  final String model;

  /// The regex that was used to parse this device
  final String parsedWithRegex;

  Device({
    required this.type,
    required this.vendor,
    required this.model,
    required this.parsedWithRegex,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Device &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          vendor == other.vendor &&
          model == other.model &&
          parsedWithRegex == other.parsedWithRegex;

  @override
  int get hashCode => type.hashCode ^ vendor.hashCode ^ model.hashCode;
}
