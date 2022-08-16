enum Gender {
  male,
  female,
}

enum AccessibilityStaysType {
  approved,
  notApproved,
  notRegistered,
  notVerified,
  blocked,
  isRejected,
}

enum TransportationType {
  bicycle,
  electricBicycle,
  motoCycle,
  car,
}

enum OrderStatus {
  pending,
  approved,
  notApproved,
  prepared,
  failedAssigning,
  picked,
  delivered,
  notDelivered,
  canceled,
}

String orderStatusToMessage(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return "معلق";
    case OrderStatus.delivered:
      return "تم توصيله";
    case OrderStatus.picked:
      return "قيد التوصيل";
    case OrderStatus.notApproved:
      return "تم رفضه";
    case OrderStatus.failedAssigning:
      return "فشل إسناده";
    case OrderStatus.canceled:
      return "ملغى";
    case OrderStatus.approved:
      return "مقبول";
    case OrderStatus.prepared:
      return "تم تحضيره";
    case OrderStatus.notDelivered:
      return "فشل توصيله";
    default:
      return '';
  }
}
