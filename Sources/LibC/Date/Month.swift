//
//  Month.swift
//  LibC
//

public enum Month: Int {
	case January = 0
	case February
	case March
	case April
	case May
	case June
	case July
	case August
	case September
	case October
	case November
	case December
}

extension Month: CustomStringConvertible {
	public var description: String {
		switch self {
			case .January:   return "Jan"
			case .February:  return "Feb"
			case .March:     return "Mar"
			case .April:     return "Apr"
			case .May:       return "May"
			case .June:      return "Jun"
			case .July:      return "Jul"
			case .August:    return "Aug"
			case .September: return "Sep"
			case .October:   return "Oct"
			case .November:  return "Nov"
			case .December:  return "Dec"
		}
	}
}
