import Foundation
import Moya

/// The BART API service.
public enum APIService {
    /// The public BART API key.
    public static let apiKey = "MW9S-E7SL-26DU-VV8V"

    /// Fetch service advisories
    /// - SeeAlso:
    /// [BART API documentation](http://api.bart.gov/docs/bsa/bsa.aspx)
    case serviceAdvisories

    /// Fetch estimated departures for every station
    /// - SeeAlso:
    /// [BART API documentation](http://api.bart.gov/docs/etd/etd.aspx)
    case estimatedDepartures

    /// Fetch the list of routes
    /// - SeeAlso:
    /// [BART API documentation](http://api.bart.gov/docs/route/routeinfo.aspx)
    case routes

    /// Fetch a route's schedule
    /// - SeeAlso:
    /// [BART API documentation](http://api.bart.gov/docs/sched/routesched.aspx)
    case routeSchedule(route: Int, kind: ScheduleKind)

    /// Fetch the list of stations
    /// - SeeAlso:
    /// [BART API documentation](http://api.bart.gov/docs/stn/stns.aspx)
    case stations
}

extension APIService {
    fileprivate var sampleDataName: String {
        switch self {
        case .serviceAdvisories:
            return "serviceAdvisories"
        case .estimatedDepartures:
            return "estimatedDepartures"
        case .routes:
            return "routes"
        case .routeSchedule:
            return "routeSchedule"
        case .stations:
            return "stations"
        }
    }

    fileprivate var sampleDataURL: URL! {
        return Bundle.main.url(forResource: self.sampleDataName, withExtension: "json", subdirectory: "SampleData")
    }
}

extension APIService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.bart.gov/api/")!
    }

    public var path: String {
        switch self {
        case .serviceAdvisories:
            return "bsa.aspx"
        case .estimatedDepartures:
            return "etd.aspx"
        case .routes:
            return "route.aspx"
        case .routeSchedule:
            return "sched.aspx"
        case .stations:
            return "stn.aspx"
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var sampleData: Data {
        guard let sampleData = try? Data(contentsOf: self.sampleDataURL) else {
            fatalError("Failed to load sample data at \(String(describing: self.sampleDataURL))")
        }

        return sampleData
    }

    public var task: Task {
        switch self {
        case .serviceAdvisories:
            return .requestParameters(parameters: [
                "cmd": "bsa",
                "orig": "all",
                "key": APIService.apiKey,
                "json": "y"
                ], encoding: Moya.URLEncoding.queryString)
        case .estimatedDepartures:
            return .requestParameters(parameters: [
                "cmd": "etd",
                "orig": "all",
                "key": APIService.apiKey,
                "json": "y"
                ], encoding: Moya.URLEncoding.queryString)
        case .routes:
            return .requestParameters(parameters: [
                "cmd": "routeinfo",
                "route": "all",
                "key": APIService.apiKey,
                "json": "y"
                ], encoding: Moya.URLEncoding.queryString)
        case let .routeSchedule(routeNumber, kind):
            return .requestParameters(parameters: [
                "cmd": "routesched",
                "route": routeNumber,
                "date": kind.rawValue,
                "key": APIService.apiKey,
                "json": "y"
                ], encoding: Moya.URLEncoding.queryString)
        case .stations:
            return .requestParameters(parameters: [
                "cmd": "stns",
                "key": APIService.apiKey,
                "json": "y"
                ], encoding: Moya.URLEncoding.queryString)
        }
    }

    public var headers: [String: String]? {
        return nil
    }
}
