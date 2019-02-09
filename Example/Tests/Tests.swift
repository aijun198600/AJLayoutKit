import XCTest
@testable import AJLayoutKit

class AJLayoutKitTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testStringSubscript() {
        let str = "abcdef"
        let substr = str[1..<3]
        
        XCTAssertEqual(substr, "bc")
    }
    
}
