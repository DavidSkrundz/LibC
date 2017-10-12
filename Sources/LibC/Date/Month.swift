//
//  Month.swift
//  LibC
//

public enum Month: Int {
	case january = 0
	case february
	case march
	case april
	case may
	case june
	case july
	case august
	case september
	case october
	case november
	case december
}

extension Month: CustomStringConvertible {
	public var description: String {
		switch self {
			case .january:   return "Jan"
			case .february:  return "Feb"
			case .march:     return "Mar"
			case .april:     return "Apr"
			case .may:       return "May"
			case .june:      return "Jun"
			case .july:      return "Jul"
			case .august:    return "Aug"
			case .september: return "Sep"
			case .october:   return "Oct"
			case .november:  return "Nov"
			case .december:  return "Dec"
		}
	}
}
