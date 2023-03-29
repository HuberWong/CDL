//
//  CDLTests.swift
//  CDLTests
//
//  Created by huber wang on 2023/3/29.
//

import XCTest
//@testable import CDL
import CDL


/// 以下测试环境均为 x86_64 模拟器
final class CDLTests: XCTestCase {

    override func setUpWithError() throws {
        print("----------setUpWithError----------")
    }

    override func tearDownWithError() throws {
        print("----------tearDownWithError---------")
    }

    func testIPhone() {
        XCTAssertEqual(CDL.IPhone.deviceModel, .simulator_x86_64, "CDL.IPhone.deviceModel, 识别错误")
        // TODO: 测试其他 IPhone 属性
    }
    
    func testExample() throws {
        print("testExample")
        
    }

    func testPerformanceExample() throws {
        print("testPerformanceExample")
    }

}
