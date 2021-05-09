import Chronicle
import SwiftFu

extension Chronicle: Fuable { }
extension Chronicle.DefaultFormatters.DefaultFormatter: Fuable { }

@dynamicMemberLookup
public struct Yarn {
    @dynamicMemberLookup
    public struct SomeError: Error {
        public var message: String
        
        public static subscript(dynamicMember member: String) -> SomeError {
            SomeError(message: member)
        }
        
        public init(message: String) {
            self.message = message
        }
    }
    
    public static var console: Chronicle = Chronicle(
        label: "yarn.console.log.expectation",
        formatter: Chronicle.DefaultFormatters.DefaultFormatter()
            .modify { formatter in
                formatter.dateFormatter.dateStyle = .short
                formatter.dateFormatter.timeStyle = .short
            }
    )
    .func { console in
        Chronicle.LogLevel.errorEmoji = "❌"
        return console
    }
    
    public static subscript(dynamicMember member: String) -> (() throws -> Bool) -> Bool {
        { expectation in
            do {
                let outcome = try expectation()
                
                console.log(level: outcome ? .success(member) : .error(member, nil))
                
                return outcome
            } catch {
                console.log(level: .fatal(member, error))
                return false
            }
        }
    }
}
