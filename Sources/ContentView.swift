import SwiftUI

struct Contact: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let email: String
    let avatar: String
}

struct ContentView: View {
    @State private var contacts = [
        Contact(name: "张三", email: "zhangsan@example.com", avatar: "person.circle.fill"),
        Contact(name: "李四", email: "lisi@example.com", avatar: "person.circle.fill"),
        Contact(name: "王五", email: "wangwu@example.com", avatar: "person.circle.fill")
    ]
    @State private var selectedContact: Contact?
    @State private var showAddSheet = false

    var body: some View {
        VStack(spacing: 0) {
            // List 基础用法
            List(contacts, selection: $selectedContact) { contact in
                ContactRow(contact: contact)
            }
            .listStyle(.inset)
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            Divider()

            // 底部信息栏
            HStack {
                Text("共 \(contacts.count) 个联系人")
                    .foregroundColor(.secondary)
                Spacer()
                if let selected = selectedContact {
                    Text("选中: \(selected.name)")
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color(nsColor: .windowBackgroundColor))
        }
    }
}

struct ContactRow: View {
    let contact: Contact

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: contact.avatar)
                .font(.title)
                .foregroundColor(.blue)

            VStack(alignment: .leading, spacing: 2) {
                Text(contact.name)
                    .font(.headline)
                Text(contact.email)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .contentShape(Rectangle())
    }
}
