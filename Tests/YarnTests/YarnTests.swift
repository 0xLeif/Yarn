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
        }
    }
