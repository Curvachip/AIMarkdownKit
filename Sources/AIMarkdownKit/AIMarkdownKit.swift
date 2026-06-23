// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public extension AttributedString {
    static func aiMarkdown(_ text: String) -> AttributedString {

        var result = AttributedString()

        let lines = text.components(separatedBy: .newlines)

        for (index, line) in lines.enumerated() {

            if line.hasPrefix("### ") {

                var header = AttributedString(String(line.dropFirst(4)))
                header.font = .system(.title3, weight: .semibold)

                result += header
                result += AttributedString("\n")

            } else if line.hasPrefix("## ") {

                var header = AttributedString(String(line.dropFirst(3)))
                header.font = .title2.bold()

                result += header
                result += AttributedString("\n")

            } else if line.hasPrefix("# ") {

                var header = AttributedString(String(line.dropFirst(2)))
                header.font = .title.bold()

                result += header
                result += AttributedString("\n")

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
