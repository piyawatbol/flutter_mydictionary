//
//  ramdom_wordLiveActivity.swift
//  ramdom_word
//
//  Created by piyawat sakdadet on 26/1/2567 BE.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ramdom_wordAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ramdom_wordLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ramdom_wordAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ramdom_wordAttributes {
    fileprivate static var preview: ramdom_wordAttributes {
        ramdom_wordAttributes(name: "World")
    }
}

extension ramdom_wordAttributes.ContentState {
    fileprivate static var smiley: ramdom_wordAttributes.ContentState {
        ramdom_wordAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ramdom_wordAttributes.ContentState {
         ramdom_wordAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ramdom_wordAttributes.preview) {
   ramdom_wordLiveActivity()
} contentStates: {
    ramdom_wordAttributes.ContentState.smiley
    ramdom_wordAttributes.ContentState.starEyes
}
