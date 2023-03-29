//
//  CDLTestsAll.swift
//  CDLTestsAll
//
//  Created by huber wang on 2023/3/30.
//

import XCTest
@testable import CDL


/// 以下测试环境均为 iPhone SE 2
final class CDLTestsAll: XCTestCase {

    override func setUpWithError() throws {
        print("----------setUpWithError----------")
    }

    override func tearDownWithError() throws {
        print("----------tearDownWithError---------")
    }
    
    func testGetIdentifier() {
        print(CDL.DeviceName.RawValue())
    }


}

