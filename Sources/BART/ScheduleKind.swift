import Foundation

/// Enumeration of typical kinds of schedule
public enum ScheduleKind: String {
    /// A typical weekday schedule
    case weekday = "wd"

    /// A typical Saturday schedule
    case saturday = "sa"

    /// A typical Sunday schedule
    case sunday = "su"
}

extension ScheduleKind: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .weekday:
            return "weekday"
        case .saturday:
            return "saturday"
        case .sunday:
            return "sunday"
        }
    }
}
