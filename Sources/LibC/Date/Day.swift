//
//  Day.swift
//  LibC
//

public enum Day: Int {
	case Sunday = 0
	case Monday
	case Tuesday
	case Wednesday
	case Thursday
	case Friday
	case Saturday
}

extension Day: CustomStringConvertible {
	public var description: String {
		switch self {
			case .Sunday:    return "Sun"
			case .Monday:    return "Mon"
			case .Tuesday:   return "Tue"
			case .Wednesday: return "Wed"
			case .Thursday:  return "Thu"
			case .Friday:    return "Fri"
			case .Saturday:  return "Sat"
		}
	}
}
