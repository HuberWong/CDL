//
//  CDL.swift
//  CDL
//
//  Created by huber wang on 2023/3/29.
//

// 设备 id 及各项信息来自这个网站: https://www.theiphonewiki.com/wiki/Models

import Foundation
import SystemConfiguration
import UIKit


/// `CDL` means crispy duck leg 🦆🍗
/// CDL 的意思是脆皮鸭腿
public class CDL: NSObject {
    
    
    static private func getIdentifier() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)
        
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return identifier
    }

    public struct Battery {
        /// `capacity` is measured in milliampere-hours, aka *mAh*
        var capacity : Double
        
        /// voltage is measured in Volts, aka *V*
        var voltage  : Double
        
        
        /// real-time battery state, like charging, full, unplugged, unknown
        var state: () -> UIDevice.BatteryState = {
            return UIDevice.current.batteryState
        }
        
        
        /// current battery level. the range is 0.0 to 1.0
        // TODO: 改成 0 到 100, 取整
        var level : () -> Double = {
            return Double(UIDevice.current.batteryLevel)
        }
        
        /// `power` can be calculated at least when the battery level change exceeds 1,
        ///  the longer the time, the more accurate the power.
        ///   `power` is real-time
        // TODO: 实现试试计算
        var power: Double?
    }
    
    public struct CPU {
        let count: Int
        var usage: () -> Double = {
            // TODO: 补完此函数
            return 0.0
        }
        var perCPUUsage: () -> [Double] = {
            // TODO: 补完此函数
            return [0.0, 0.0]
        }
    }
    
    public struct Disk {
        // TODO: 确定空间单位
        let totalSpace: Int
        var freeSpace: () -> Int = {
            // TODO: 补完此函数
            return 0
        }
        var usedSpace: () -> Int = {
            // TODO: 补完此函数
            return 0
        }
    }
    
    public struct Memory {
        let totalMemory: Int
        var ActiveMemory: () -> Int = {
            // TODO: 补完此函数
            return 0
        }
        var InactiveMemory: () -> Int = {
            // TODO: 补完此函数
            return 0
        }
        var freeMemory: () -> Int = {
            // TODO: 补完此函数
            return 0
        }
        var usedMemory: () -> Int = {
            // TODO: 补完此函数
            return 0
        }
        var wiredMemory: () -> Int = {
            // TODO: 补完此函数
            return 0
        }
        var purgeableMemory: () -> Int = {
            // TODO: 补完此函数
            return 0
        }
        
    }
    
    public class IPhone: NSObject {
        public static var deviceName       : DeviceName?
        static var iPhoneName       : String?
//        var appVersion     : String?
        static var battery          : Battery?
//        var localizedModel : String?
        static var systemName       : String?
        static var systemVersion    : String?
        
        /// like "iPhone15,3" is iPhone 14 Pro Max, "iPhone15,2" is iPhone 14 Pro
        public static var deviceModel      : DeviceModel? = {
            return DeviceModel(id: CDL.getIdentifier())
        }()
        static var macAddress: String?
        // TODO: ip地址要实现动态更新
        static var deviceIP: String?
        static var lastRestartDate: TimeInterval?
        
        /// Identifier for Advertisers.
        /// All Apps on the same device will get the same value, which is specially designed by Apple
        ///  for various advertising providers to track users. User may restrict the use of
        ///  `identifier for Advertisers`, so the id may not get the value, but , Apple
        ///   allows tracking by default and most users don't know that there is such a setting.
        static var idfa: String?
//        var uuid : String // UUID is Universally Unique Identifier
//        var deviceColor: String?
        static var CPU: CPU?
        static var Disk: Disk?
        static var Memory: Memory?
        
        private override init() {
            super.init()
        }
        
        // TODO: 添加实例
        /// Get device name string. Can be be modified through the dictionary. For example:
        /// ```swift
        ///  print("wori")
        /// ```
        /// - Parameter dic: modified dictionary
        /// - Returns: String of device Name
        public static func deviceNameString(modifiedDic: [DeviceName:String]? = nil) -> String {
            let CDLDic: [DeviceName: String] = [
                .iPhone:"",
                .iPhone_3G:"",
                .iPhone_3GS:"",
                .iPhone_4:"",
                .iPhone_4S:"",
                .iPhone_5:"",
                .iPhone_5c:"",
                .iPhone_5s:"",
                .iPhone_6:"",
                .iPhone_6_Plus:"",
                .iPhone_6s:"",
                .iPhone_6s_Plus:"",
                .iPhone_SE:"",
                .iPhone_7:"",
                .iPhone_7_Plus:"",
                .iPhone_8:"",
                .iPhone_8_Plus:"",
                .iPhone_X:"",
                .iPhone_XR:"",
                .iPhone_XS:"",
                .iPhone_XS_Max:"",
                .iPhone_11:"",
                .iPhone_11_Pro:"",
                .iPhone_11_Pro_Max:"",
                .iPhone_SE_2:"",
                .iPhone_12_mini:"",
                .iPhone_12:"",
                .iPhone_12_Pro:"",
                .iPhone_12_Pro_Max:"",
                .iPhone_13_mini:"",
                .iPhone_13:"",
                .iPhone_13_Pro:"",
                .iPhone_13_Pro_Max:"",
                .iPhone_SE_3:"",
                .iPhone_14:"",
                .iPhone_14_Plus:"",
                .iPhone_14_Pro:"",
                .iPhone_14_Pro_Max:"",
            ]
            
            if let str = modifiedDic?[IPhone.deviceName!] {
                return str
            } else if let str = CDLDic[IPhone.deviceName!] {
                return str
            } else {
                fatalError("this iPhone not in CDLDic")
            }
        }
        
    }
    
    // MARK: - DeviceModel and DeviceName
    /// https://www.theiphonewiki.com/wiki/Models iPhone 节 Identifier 列
    public enum DeviceModel:String {
        case unknownIPhoneDeviceModel
        case simulator_x86_64
        
        case iPhone1_1
        case iPhone1_2
        case iPhone2_1
        case iPhone3_1
        case iPhone3_2
        case iPhone3_3
        case iPhone4_1
        case iPhone5_1
        case iPhone5_2
        case iPhone5_3
        case iPhone5_4
        case iPhone6_1
        case iPhone6_2
        case iPhone7_1
        case iPhone7_2
        case iPhone8_1
        case iPhone8_2
        case iPhone8_4
        case iPhone9_1
        case iPhone9_2
        case iPhone9_3
        case iPhone9_4
        case iPhone10_1
        case iPhone10_2
        case iPhone10_3
        case iPhone10_4
        case iPhone10_5
        case iPhone10_6
        case iPhone11_2
        case iPhone11_4
        case iPhone11_6
        case iPhone11_8
        case iPhone12_1
        case iPhone12_3
        case iPhone12_5
        case iPhone12_8
        case iPhone13_1
        case iPhone13_2
        case iPhone13_3
        case iPhone13_4
        case iPhone14_2
        case iPhone14_3
        case iPhone14_4
        case iPhone14_5
        case iPhone14_6
        case iPhone14_7
        case iPhone14_8
        case iPhone15_2
        case iPhone15_3
        
        init(id: String) {
            switch id {
            case "x86_64":
                self = .simulator_x86_64
            case "iPhone1,1":
                self = .iPhone1_1
            // TODO: 补上
            case "iPhone12,8":
                self = .iPhone12_8
                
            default:
                self = .unknownIPhoneDeviceModel
            }
        }
        
    }
    
    /// https://www.theiphonewiki.com/wiki/Models iPhone 节 Generation 列
    public enum DeviceName : String {
        case unknownIPoneDeviceName
        case simulator_x86_64
        
        case iPhone
        case iPhone_3G
        case iPhone_3GS
        case iPhone_4
        case iPhone_4S
        case iPhone_5
        case iPhone_5c
        case iPhone_5s
        case iPhone_6
        case iPhone_6_Plus
        case iPhone_6s
        case iPhone_6s_Plus
        case iPhone_SE
        case iPhone_7
        case iPhone_7_Plus
        case iPhone_8
        case iPhone_8_Plus
        case iPhone_X
        case iPhone_XR
        case iPhone_XS
        case iPhone_XS_Max
        case iPhone_11
        case iPhone_11_Pro
        case iPhone_11_Pro_Max
        case iPhone_SE_2
        case iPhone_12_mini
        case iPhone_12
        case iPhone_12_Pro
        case iPhone_12_Pro_Max
        case iPhone_13_mini
        case iPhone_13
        case iPhone_13_Pro
        case iPhone_13_Pro_Max
        case iPhone_SE_3
        case iPhone_14
        case iPhone_14_Plus
        case iPhone_14_Pro
        case iPhone_14_Pro_Max
    }
    

    
    // MARK: - Battery
    func battery(from dm: DeviceModel) -> Battery {
        return Battery(capacity: 0, voltage: 0)
    }
    
    // MARK: - CPU
    func CPU(from dm: DeviceModel) -> CPU {
        return CDL.CPU(count: 0)
    }
    
    
    /// Find device name based on device model. Multiple device model may correspond to
    /// the same device name.
    /// - Parameter dm: The device model
    /// - Returns: The device name
    func DeviceName(from dm: DeviceModel) -> DeviceName {
        switch dm {
        case .unknownIPhoneDeviceModel:
            return .unknownIPoneDeviceName
        case .simulator_x86_64:
            return .simulator_x86_64
            
        case .iPhone1_1:
            return .iPhone
        case .iPhone1_2:
            return .iPhone_3G
        case .iPhone2_1:
            return .iPhone_3GS
        case .iPhone3_1, .iPhone3_2, .iPhone3_3:
            return .iPhone_4
        case .iPhone4_1:
            return .iPhone_4S
        case .iPhone5_1, .iPhone5_2:
            return .iPhone_5
        case .iPhone5_3, .iPhone5_4:
            return .iPhone_5c
        case .iPhone6_1, .iPhone6_2:
            return .iPhone_5s
        case .iPhone7_1:
            return .iPhone_6_Plus
        case .iPhone7_2:
            return .iPhone_6
        case .iPhone8_1:
            return .iPhone_6s
        case .iPhone8_2:
            return .iPhone_6s_Plus
        case .iPhone8_4:
            return .iPhone_SE
        case .iPhone9_1, .iPhone9_3:
            return .iPhone_7
        case .iPhone9_2, .iPhone9_4:
            return .iPhone_7_Plus
        case .iPhone10_1, .iPhone10_4:
            return .iPhone_8
        case .iPhone10_2, .iPhone10_5:
            return .iPhone_8_Plus
        case .iPhone10_3, .iPhone10_6:
            return .iPhone_X
        case .iPhone11_2:
            return .iPhone_XS
        case .iPhone11_4, .iPhone11_6:
            return .iPhone_XS_Max
        case .iPhone11_8:
            return .iPhone_XR
        case .iPhone12_1:
            return .iPhone_11
        case .iPhone12_3:
            return .iPhone_11_Pro
        case .iPhone12_5:
            return .iPhone_11_Pro_Max
        case .iPhone12_8:
            return .iPhone_SE_2
        case .iPhone13_1:
            return .iPhone_12_mini
        case .iPhone13_2:
            return .iPhone_12
        case .iPhone13_3:
            return .iPhone_12_Pro
        case .iPhone13_4:
            return .iPhone_12_Pro_Max
        case .iPhone14_2:
            return .iPhone_13_Pro
        case .iPhone14_3:
            return .iPhone_13_Pro_Max
        case .iPhone14_4:
            return .iPhone_13_mini
        case .iPhone14_5:
            return .iPhone_13
        case .iPhone14_6:
            return .iPhone_SE_3
        case .iPhone14_7:
            return .iPhone_14
        case .iPhone14_8:
            return .iPhone_14_Plus
        case .iPhone15_2:
            return .iPhone_14_Pro
        case .iPhone15_3:
            return .iPhone_14_Pro_Max
        }
    }
    
    // MARK: - Networking
    
    /// get mac address
    /// - Returns: mac address
    func getMacAddress() -> String {
        // TODO: 补充此函数
        return ""
    }
    
    
    /// get IP address
    /// - Returns: IP address
    func getIPAddresses() -> String {
        // TODO: 补充此函数, 返回值可能是 String 数组, 如果有函数库有 IP 类型的话,返回 IP 类型或其数组
        return ""
    }
}

