//
//  chimeApp.swift
//  chime
//
//  Created by Dan Susman on 7/4/24.
//

import AVFAudio
import Combine
import SwiftUI

@main
struct chimeApp: App {
    var body: some Scene {
        MenuBarExtra("Chime", systemImage: "bell.circle") {
            EmptyView()
                .frame(width: 0, height: 0)
                .onReceive(ChimeUtil.timer) { _ in ChimeUtil.playSound() }
        }
        .menuBarExtraStyle(.window)
    }
}

struct ChimeUtil {
    static var timer: Publishers.Autoconnect<Timer.TimerPublisher> {
        let interval = 60
        return Timer.publish(every: TimeInterval(interval),
                             on: .main,
                             in: .common).autoconnect()
    }

    static func playSound() {
        NSSound(named: "chime1")?.play()
    }
}
