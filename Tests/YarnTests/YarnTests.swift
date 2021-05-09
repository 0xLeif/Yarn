    import XCTest
    @testable import Yarn
    
    final class YarnTests: XCTestCase {
        func testExample() {
            XCTAssertNoThrow(
                Yarn.expectAnError {
                    throw Yarn.SomeError(message: "Some Error Message")
                }
            )
            
            XCTAssertFalse(
                Yarn.expectFalse {
                    false
                }
            )
            
            XCTAssertTrue(
                Yarn.expectTrue {
                    true
                }
            )
            
            func someFunction() throws -> Bool {
                true
            }
            
            Yarn.expectFunctionToReturnTrue(someFunction)
            Yarn.expectClosureToReturnFalse {
                false
            }
        }
    }
