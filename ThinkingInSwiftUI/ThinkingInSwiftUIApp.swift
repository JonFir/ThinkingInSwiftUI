import SwiftUI

@main
struct ThinkingInSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            screenViewFactory.makeContentView()
        }
    }
}
