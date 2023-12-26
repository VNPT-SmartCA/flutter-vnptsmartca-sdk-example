enum AuthenticationStatus {
  unknown,
  authenticated,
  unauthenticated,
  unactivated,
  expired
}

// "            [Description(""Chờ sinh cặp khóa"")]
// WAITING_GENERATE_KEYPAIR = 1,
// [Description(""Chờ người dùng kích hoạt"")]
// WAITING_ASSIGNED_TO_SIGNER = 2,
// [Description(""Chờ cấp chứng thư số"")]
// WAITING_GENERATE_CERTIFICATE = 3,
// [Description(""Đang hoạt động"")]
// VALID = 0,
//
// [Description(""Hết hạn"")]
// EXPIRED = 4,
// [Description(""Đã thu hồi"")]
// REVOKED = 5,
// [Description(""Đang tạm dừng"")]
// SUSPENDED = 6,
// [Description(""Chờ ký biên bản nghiệm thu"")]
// WAITING_SIGN_ACCEPTANCE = 7,
// [Description(""Ký BBNT lỗi, chữ ký không hợp lệ"")]
// SIGN_ACCEPTANCE_FAILED = 8,
// [Description(""Chờ đồng bộ biên bản nghiệm thu"")]
// WAITING_SYNC_ACCEPTANCE = 9,
// [Description(""Đồng bộ biên bản nghiệm thu không thành công"")]
// SYNC_ACCEPTANCE_FAILED = 10,
// [Description(""Chờ duyệt"")]
// WAITING_APPROVE = 11,"

enum StatusCertEnum {
  VALID, // 0: Đang hoạt động
  WAITING_GENERATE_KEYPAIR, // 1: Chờ sinh cặp khóa
  WAITING_ASSIGNED_TO_SIGNER, // 2: Chờ người dùng kích hoạt
  WAITING_GENERATE_CERTIFICATE, // 3: Chờ cấp chứng thư số
  EXPIRED, // 4: Hết hạn
  REVOKED, // 5: Đã thu hồi
  SUSPENDED, // 6: Đang tạm dừng
  WAITING_SIGN_ACCEPTANCE, // 7: Chờ ký biên bản nghiệm thu
  SIGN_ACCEPTANCE_FAILED, // 8: Ký BBNT lỗi, chữ ký không hợp lệ
  WAITING_SYNC_ACCEPTANCE, // 9: Chờ đồng bộ biên bản nghiệm thu
  SYNC_ACCEPTANCE_FAILED, // 10: Đồng bộ biên bản nghiệm thu không thành công
  WAITING_APPROVE, // 11: Chờ duyệt
}

enum TransactionType { confirm, cancel }
