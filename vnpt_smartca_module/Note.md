ENV['SWIFT_VERSION'] = '5'

flutter_3x pub run build_runner build --delete-conflicting-outputs


## **Các lệnh hay dùng**

&nbsp;\
**Lệnh tạo file cấu hình Dependency Injection**
&nbsp;\

***For watch***

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

***For build***

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

***Lệnh build app có làm rối code***

```bash
flutter build apk --obfuscate --split-debug-info=debug-info

flutter build ios --obfuscate --split-debug-info=debug-info
```

**Lệnh tự động tìm các lỗi về cú pháp, API migration**

```bash
dart fix --dry-run 
```

**Lệnh tự fix các lỗi về cú pháp, API migration**

```bash
dart fix --apply
```
&nbsp;
## **Các lệnh build SDK**

**Lệnh build cho Android**
```bash
flutter_3x build aar --no-profile
```

**Lệnh build cho iOS**
```bash
// Không build Flutter.xcframework, tải từ cocoapods

flutter_3x build ios-framework --cocoapods --no-profile --no-debug  --output=ios_cocoapods_framework
flutter_3x build ios-framework --cocoapods --no-profile --output=ios_framework


// Build tất cả ra xcframework 

flutter build ios-framework --no-profile --output=ios_framework
```