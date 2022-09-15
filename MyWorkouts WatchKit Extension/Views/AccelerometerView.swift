/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The elapsed time.
*/

import SwiftUI
import CoreMotion

struct AccelerometerView: View {
    var acceleration: CMAcceleration?
    var reps: Int?
    @State private var accelerometerFormatter = AccelerometerFormatter()

    var body: some View {
        Text("\(acceleration, format: AccelerometerFormatter())")
            //.fontWeight(.semibold)
        
    }
}

struct AccelerometerFormatter: FormatStyle {
    func format(_ data: CMAcceleration?) -> String {
        guard let data else { return "" }
        let millis = Date().timeIntervalSince1970 * 1000
        let str = "\(data.x),\(data.y),\(data.z)"
        let avg = (data.x + data.y + data.z) / 3
        print("\(millis), \(avg)")
        if avg <= 0 {
            return "down"
        } else {
            return "up"
        }
    }
}

extension CMAcceleration: Equatable {
    public static func == (lhs: CMAcceleration, rhs: CMAcceleration) -> Bool {
        false
    }
    
    
}

struct Accelerometer_Previews: PreviewProvider {
    static var previews: some View {
        AccelerometerView()
    }
}
