//
//  VibrationsCoreHaptics.swift
//  Haptics
//
//  Created by Ryan J. W. Kim on 2021/11/07.
//
import CoreHaptics
import SwiftUI

struct VibrationsCoreHaptics: View {
    // MARK: - Properties
    @State private var engine: CHHapticEngine?
    var body: some View {
        Text("Tap here")
            .onAppear(perform: prepareHaptics)
            .onTapGesture(perform: complexSuccess)
    } //: body
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    } //: simpleSuccess func
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
            print("Haptic engine prepared")
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    } //: Haptic prepare func
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        //        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        //        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        //        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        
        // get several taps of increasing then decreasing intensity and sharpness - Start
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }
        // get several taps of increasing then decreasing intensity and sharpness - End
        
        //        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.stop(atTime: 0)
            print("Haptic success")
        } catch {
            print("Failed to play pattern:\(error.localizedDescription).")
        }
    }
} //: ContentView

struct VibrationsCoreHaptics_Previews: PreviewProvider {
    static var previews: some View {
        VibrationsCoreHaptics()
    }
}
