//
//  CDL.swift
//  CDL
//
//  Created by huber wang on 2023/3/29.
//

// 设备 id 及各项信息来自这个网站: https://www.theiphonewiki.com/wiki/Models

import Foundation
import SystemConfiguration


/// `CDL` means crispy duck leg 🦆🍗
/// CDL 的意思是脆皮鸭腿
public class CDL: NSObject {
    public enum IPhoneGeneration: String {
        case iPhone = "iPhone1,1"
        case iPhone_3G = "iPhone1,2"
        case iPhone_3GS = "iPhone2,1"
        // TOOD 添加新型号
        
        case iPhone_SE_2 = "iPhone12,8"
        case unknownIPhone = "unknownIPhone"
    }
    
    
    public struct IPhone {
        
        var identifier : String
        /// Different models of iPhones, like iPhone 13 mini, iPhone 14 pro max
        /// 手机的型号, 如 iPhone 13 mimi, iPhone 14 pro max
        var generation : IPhoneGeneration
        var battery: Battery
        
        init() {
            self.identifier = IPhoneGeneration.unknownIPhone.rawValue
            self.generation = IPhoneGeneration.unknownIPhone
            
            self.battery = Battery(capacity: 0, voltage: 0)
        }
        
        init(identifier: String, battery: Battery) {
            self.identifier = identifier
            self.generation = CDL.genGeneration(id: identifier)
            self.battery = battery
        }
        
    }
    
    public struct Battery {
        /// `capacity` is measured in milliampere-hours, aka *mAh*
        var capacity : Double
        
        /// voltage is measured in Volts, aka *V*
        var voltage  : Double
    }
    
    static private func genGeneration(id: String) -> IPhoneGeneration {
        if let g = IPhoneGeneration(rawValue: id) {
            return g
        } else {
            return IPhoneGeneration.unknownIPhone
        }
    }
    
    /// Get the identifier of this device from the SystemConfiguration library.
    /// 从 `SystemConfiguration` 库获取本设备的 `identifier`
    /// - Returns: String of identifier
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
    
    
    static public func getIPhone() -> IPhone {
        let id = self.getIdentifier()
        if let g = self.IPhoneGeneration(rawValue: id) {
            switch g {
            case .iPhone:
                return IPhone(identifier: id,
                              battery: Battery(capacity: 1400, voltage: 3.7))
            case .iPhone_3G:
                return IPhone(identifier: id,
                              battery: Battery(capacity: 1150, voltage: 3.7))
            case .iPhone_3GS:
                return IPhone(identifier: id,
                              battery: Battery(capacity: 1219, voltage: 3.7))
            // TODO 补充新型号的信息

                
            case .iPhone_SE_2:
                return IPhone(identifier: id,
                              battery: Battery(capacity: 1821, voltage: 3.82))
            case .unknownIPhone:
                return IPhone()
            }
        } else {
            return IPhone()
        }
    }
}

