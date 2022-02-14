import Foundation
import UIKit

// Model

// TRiple 
struct Records: Codable {
    let records: [Events]?
    
}

struct Events: Codable {
    var id: String
    var fields: Fields
}

struct Fields: Codable {
    var Activity: String?
    var Location: String?
    var EventType: String?
    var End: String?
    var Start: String?
    enum CodingKeys: String, CodingKey {
        case Activity = "Activity"
        case Location = "Location"
        case EventType = "Type"
        case End = "End"
        case Start = "Start"
    }
}


