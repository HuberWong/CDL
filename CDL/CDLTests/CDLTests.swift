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
        print("--------------------setUpWithError--------------------")
    }

    override func tearDownWithError() throws {
        print("--------------------tearDownWithError-------------------")
    }

    func testIPhonePropertyDeviceModel() {
        XCTAssertEqual(CDL.IPhone.deviceModel, .simulator_x86_64, "CDL.IPhone.deviceModel 属性识别错误")
    }
    
    func testIPhonePropertyDeviceName() {
        
        XCTAssertEqual(CDL.IPhone.deviceName, .simulator_x86_64,
                       "CDL.IPhone.deviceName 属性识别错误")
        XCTAssertEqual(CDL.IPhone.deviceName.toString(),
                       "simulator_x86_64", "CDL.IPhone.deviceName.toString() 方法执行错误")
        XCTAssertEqual(CDL.IPhone.deviceName.toString(modifiedDic: [.simulator_x86_64:"x86_64_simulator"]),
                       "x86_64_simulator",
                       "CDL.IPhone.deviceName.toString(modifiedDic:) 方法执行错误")
    }
    
    
    // TODO: 还没想到怎么实现获取 iPhone 的 user-assigned name, 之后会改
    func testIPhonePropertyIPhoneName() {
        // ↓ 形同废话, 保留位置, 想到怎么写了再改
        XCTAssertEqual(CDL.IPhone.iPhoneName, UIDevice.current.name)
    }
    
//    func testIPhonePropertyAppVersion() {
//        print(CDL.IPhone.appVersion)
//    }
    
    
//    func testIPhonePropertySystemName() {
//        print(CDL.IPhone.systemName)
//    }
    
//    func testIPhonePropertySystemVersion() {
//        print(CDL.IPhone.systemVersion)
//    }
    
    
    func testIPhonePropertyBattery() {
        
    }
    
    
    func testIPhonePropertyMacAddress() {
        
    }
    
    func testIPhonePropertyDeviceIP() {
        
    }
    
//    func testIPhonePropertyLastRestartDate() {
//        print(CDL.IPhone.lastRestartDate())
//    }
    
    func testIPhonePropertyIdfa() {
        
    }
    
    func testIPhonePropertyCPU() {
        
    }
    
    func testIPhonePropertyDisk() {
        
    }
    
    func testIPhonePropertyMemory() {
        
    }
    
    func testExample() throws {
        print("testExample")
        
    }

    func testPerformanceExample() throws {
        print("testPerformanceExample")
    }

}
