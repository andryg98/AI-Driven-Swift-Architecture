import SwiftUI

struct NoteRowView: View {
    let note: Note
    let onDelete: () -> Void

    var body: some View {
        HStack(spacing: 8) {
            // Priority indicator with accessibility
            Rectangle()
                .fill(priorityColor(note.priority))
                .frame(width: 4)
                .accessibilityHidden(true) // Hidden because priority is communicated via label

            VStack(alignment: .leading, spacing: 4) {
                Text(note.title)
                    .font(.headline)

                Text(note.content)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }

            Spacer()

            // Delete button; hidden from accessibility since its action is exposed
            // as a named accessibility action on the row (see below) rather than
            // as a separately focusable element, avoiding ambiguity about what
            // double-tapping the row does.
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
                    .font(.system(size: 14))
            }
            .frame(width: 44, height: 44)  // Minimum 44x44 touch target
            .accessibilityHidden(true)
        }
        .padding(.vertical, 8)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(note.title), \(priorityLabel(note.priority)) priority, \(note.content)")
        .accessibilityIdentifier("note-row-\(note.id)")
        .accessibilityAction(.default) { }
        .accessibilityAction(named: Text("Delete \(note.title) note"), onDelete)
    }

    private func priorityColor(_ priority: NotePriority) -> Color {
        switch priority {
        case .high: .red
        case .medium: .orange
        case .low: .green
        }
    }

    private func priorityLabel(_ priority: NotePriority) -> String {
        switch priority {
        case .high: "high"
        case .medium: "medium"
        case .low: "low"
        }
    }
}
