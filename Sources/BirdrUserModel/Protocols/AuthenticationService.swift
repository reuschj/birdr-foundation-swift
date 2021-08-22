import Foundation

public typealias AuthenticationToken = String

/// A service which authenticates a user
public protocol AuthenticationService {
    associatedtype User: UserProtocol

    func requestAuthentication(
        forUser user: User,
        completionHandler: (AuthenticationToken?) -> Void
    ) -> Void
    
    func invalidateToken(forUser user: User) -> Void
}
