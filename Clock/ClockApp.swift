




import SwiftUI





@main struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            
            TabView {
                ClockView()
                    .tabItem {
                        Label("CLOCK", systemImage: "clock")
                    }
                
                TimerView()
                    .tabItem {
                        Label("TIMER", systemImage: "timer")
                    }
                
                StopwatchView()
                    .tabItem {
                        Label("STOPWATCH", systemImage: "stopwatch")
                    }
            }
        }
    }
}
