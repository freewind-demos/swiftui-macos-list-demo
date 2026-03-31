# SwiftUI macOS List 列表

## 简介

演示 SwiftUI 中 List 的用法，List 是 macOS 上用于显示列表的首选组件，支持选择和交互。

## 快速开始

```bash
cd swiftui-macos-list-demo
xcodegen generate
open SwiftUIListDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 基础 List

```swift
List(contacts) { contact in
    ContactRow(contact: contact)
}
```

### List + selection

```swift
@State private var selected: Contact?

List(contacts, selection: $selected) { contact in
    ContactRow(contact: contact)
}
```

### List 样式

```swift
.listStyle(.inset)         // 嵌入式
.listStyle(.sidebar)       // 侧边栏样式
.listStyle(.sourceList)    // 源码列表样式
```

### 自定义行内容

```swift
struct ContactRow: View {
    let contact: Contact

    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
            VStack(alignment: .leading) {
                Text(contact.name)
                Text(contact.email)
            }
        }
    }
}
```

## 完整示例

```swift
struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let email: String
}

struct ContentView: View {
    @State private var contacts = [...]
    @State private var selected: Contact?

    var body: some View {
        List(contacts, selection: $selected) { contact in
            Text(contact.name)
        }
    }
}
```

## 完整讲解（中文）

### List vs ScrollView + ForEach

| 特性 | List | ScrollView + ForEach |
|------|------|---------------------|
| 选择支持 | 是 | 否 |
| 性能优化 | 自动虚拟化 | 需要 Lazy |
| macOS 样式 | 原生 | 需要自己实现 |

### List 的优势

1. **自动虚拟化**：只渲染可见的行
2. **原生选择**：支持单选和多选
3. **上下文菜单**：支持右键菜单
4. **拖放**：支持拖放操作

### 适用场景

- 联系人列表
- 文件列表
- 设置项列表
- 任何需要选择的长列表
