# AIMarkdownKit

A lightweight Swift Package for rendering AI-generated Markdown in SwiftUI while preserving whitespace and supporting common formatting elements.

Many AI models return Markdown-formatted text such as:

```markdown
# Title

This is **bold** text.

This is *italic* text.

### Section Header

~~Strikethrough~~
```

SwiftUI's native Markdown support often forces developers to choose between:

- Correct Markdown parsing (`.full`)
- Preserved whitespace (`.inlineOnlyPreservingWhitespace`)

AIMarkdownKit provides a hybrid approach that preserves whitespace while still rendering Markdown headers and common inline formatting.

## Features

- Supports `#`, `##`, and `###` headers
- Supports bold text (`**bold**`)
- Supports italic text (`*italic*`)
- Supports strikethrough (`~~text~~`)
- Supports inline links
- Preserves whitespace and line breaks
- Prevents unwanted trailing blank lines
- Native SwiftUI integration
- No third-party dependencies

## Requirements

- iOS 17+
- macOS 14+
- Swift 6+

## Installation

### Swift Package Manager

In Xcode:

**File → Add Package Dependencies**

Enter:

```text
https://github.com/USERNAME/AIMarkdownKit
```

Select the latest version.

## Usage

### MarkdownText View

```swift
import AIMarkdownKit

MarkdownText(response)
```

### Text Initializer

```swift
import AIMarkdownKit

Text(markdown: response)
```

### AttributedString Extension

```swift
import AIMarkdownKit

let attributed = AttributedString.aiMarkdown(response)

Text(attributed)
```

## Example

Input:

```markdown
# Welcome

This is **bold**.

This is *italic*.

### Details

~~Deprecated~~
```

Output:

- Large title header
- Bold text
- Italic text
- Section headers
- Strikethrough text
- Preserved spacing

## Why AIMarkdownKit?

SwiftUI's native Markdown parser presents a tradeoff:

```swift
.full
```

Supports headers but modifies whitespace.

```swift
.inlineOnlyPreservingWhitespace
```

Preserves whitespace but ignores headers.

AIMarkdownKit combines both approaches by:

1. Detecting and styling Markdown headers.
2. Parsing inline Markdown using native SwiftUI APIs.
3. Preserving user-visible spacing.

This makes it especially useful for:

- AI chat applications
- LLM-powered assistants
- Streaming responses
- Documentation viewers
- Knowledge-base interfaces

## License

MIT License
