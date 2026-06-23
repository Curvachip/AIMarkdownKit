
import SwiftUI

public extension AttributedString {
    static func aiMarkdown(_ text: String) -> AttributedString {

        var result = AttributedString()

        let cleaned = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let lines = cleaned.components(separatedBy: .newlines)
        
        var hasRenderedContent = false

        for (index, line) in lines.enumerated() {
            
            if line.hasPrefix("### ") {
                
                if hasRenderedContent {
                    result += AttributedString("\n")
                }

                var header = AttributedString(String(line.dropFirst(4)))
                header.font = .system(.title3, weight: .semibold)

                result += header
                result += AttributedString("\n\n")
                
                hasRenderedContent = true

            } else if line.hasPrefix("## ") {
                
                if hasRenderedContent {
                    result += AttributedString("\n")
                }

                var header = AttributedString(String(line.dropFirst(3)))
                header.font = .title2.bold()

                result += header
                result += AttributedString("\n\n")

            } else if line.hasPrefix("# ") {
                
                if hasRenderedContent {
                    result += AttributedString("\n")
                }

                var header = AttributedString(String(line.dropFirst(2)))
                header.font = .title.bold()

                result += header
                result += AttributedString("\n\n")

            } else {

                let parsed =
                    (try? AttributedString(
                        markdown: line,
                        options: .init(
                            interpretedSyntax: .inlineOnlyPreservingWhitespace
                        )
                    ))
                    ?? AttributedString(line)

                result += parsed
                if index != lines.indices.last {
                        result += AttributedString("\n")
                }
                
                if !line.trimmingCharacters(in: .whitespaces).isEmpty {
                    hasRenderedContent = true
                }
                
            }
        }

        return result
    }
}

public extension Text {
    init(markdown content: String) {
        self.init(
            AttributedString.aiMarkdown(content)
        )
    }
}

public struct MarkdownText: View {
    private let content: String
    public init(_ content: String) {
        self.content = content
    }
    public var body: some View {
        Text(
            AttributedString.aiMarkdown(content)
        )
    }
}
