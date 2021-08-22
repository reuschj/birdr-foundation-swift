import Foundation
import BirdrFoundation

public class BirdrUserSession: UniquelyIdentified, Timestamped {
    public typealias User = BirdrUser
    
    public var user: User
    public let identification: UUID
    public let timestamp: Int
    
    // Private
    
    private var internalState: State = .unauthenticated
    
    // Computed
    
    public var state: State { internalState }
    public var token: AuthenticationToken? {
        switch internalState {
        case .authenticated(token: let token):
            return token
        default:
            return nil
        }
    }
    
    public init(
        user: BirdrUser
    ) {
        self.user = user
        self.identification = UUID()
        self.timestamp = getCurrentUnixTimestamp()
    }
    
    /// Requests authentication but delegates to an authentication service which will handle user authentication
    /// This eliminates any authentication and/or security logic at this level
    public func requestAuthentication<AuthService>(with authenticationService: AuthService) -> Void
    where AuthService: AuthenticationService, AuthService.User == BirdrUserSession.User {
        internalState = .authenticationInProgress
        authenticationService.requestAuthentication(forUser: user) { possibleToken in
            guard let token = possibleToken else {
                internalState = .unauthenticated
                return
            }
            internalState = .authenticated(token: token)
        }
    }
    
    /// Effectively signs out
    public func invalidateToken<AuthService>(with authenticationService: AuthService) -> Void
    where AuthService: AuthenticationService, AuthService.User == BirdrUserSession.User {
        authenticationService.invalidateToken(forUser: user)
        internalState = .unauthenticated
    }
    
    /// Enum with states of user session
    public enum State {
        case unauthenticated
        case authenticationInProgress
        case authenticated(token: AuthenticationToken)
    }
}
