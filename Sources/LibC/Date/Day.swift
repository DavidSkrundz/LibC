//
//  Day.swift
//  LibC
//

public enum Day: Int {
	case sunday = 0
	case monday
	case tuesday
	case wednesday
	case thursday
	case friday
	case saturday
}

extension Day: CustomStringConvertible {
	public var description: String {
		switch self {
			case .sunday:    return "Sun"
			case .monday:    return "Mon"
			case .tuesday:   return "Tue"
			case .wednesday: return "Wed"
			case .thursday:  return "Thu"
			case .friday:    return "Fri"
			case .saturday:  return "Sat"
		}
	}
}
