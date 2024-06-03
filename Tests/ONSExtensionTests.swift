//
//  ONSExtensionTests.swift
//  ONSExtensionTests
//
//  Created by Arnaud Barisain-Monrose on 23/10/2019.
//  Copyright © 2019 Batch. All rights reserved.
//

import XCTest
@testable import ONSExtension

extension Data {
    
    init?(hexString: String) {
        let len = hexString.count / 2
        var data = Data(capacity: len)
        for i in 0..<len {
            let j = hexString.index(hexString.startIndex, offsetBy: i*2)
            let k = hexString.index(j, offsetBy: 2)
            let bytes = hexString[j..<k]
            if var num = UInt8(bytes, radix: 16) {
                data.append(&num, count: 1)
            } else {
                return nil
            }
        }
        self = data
    }
    
    func hexString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}

class ONSExtensionTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testURLExtraction() {
        let validURL = "https://ons.pfs.gdn/foo.png"
        let validType = "image/png"
        
        let validPayload: [AnyHashable: Any] = [
            "foundation.p.ons": ["at":["u":validURL, "t": validType]]
        ]
        
        let invalidURLPayload: [AnyHashable: Any] = [
            "foundation.p.ons": ["u":"foobar$", "t": "image/png"]
        ]
        
        let missingPayloads: [[AnyHashable: Any]] = [
            [:],
            ["foo":"bar"],
            ["foundation.p.ons":["foo":"bar"]],
            ["foundation.p.ons":["at":[:]]],
            ["foundation.p.ons":["at":["foo":"bar"]]],
            ["foundation.p.ons":["at":["u":"https://ons.pfs.gdn/favicon.ico"]]],
            ["foundation.p.ons":["at":["t":"image/jpeg"]]]
        ]
        
        let attachment = try! RichNotificationHelper().attachment(forPayload: validPayload)
        XCTAssertEqual(attachment.url,
                       URL(string: validURL)!)
        XCTAssertEqual(attachment.type, validType)
        
        XCTAssertThrowsError(try RichNotificationHelper().attachment(forPayload: invalidURLPayload))
        
        for payload in missingPayloads {
            XCTAssertThrowsError(try RichNotificationHelper().attachment(forPayload: payload))
        }
    }
}
