//
//  DeviceModel.swift
//  CDL
//
//  Created by huber wang on 2023/4/1.
//

public enum DeviceModel {
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
        case "iPhone1,2":
            self = .iPhone1_1
        case "iPhone2,1":
            self = .iPhone2_1
        case "iPhone3,1":
            self = .iPhone3_1
        case "iPhone3,2":
            self = .iPhone3_2
        case "iPhone3,3":
            self = .iPhone3_3
        case "iPhone4,1":
            self = .iPhone4_1
        case "iPhone5,1":
            self = .iPhone5_1
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "":
            self =
        case "iPhone12,8":
            self = .iPhone12_8

        
        default:
            self = .unknownIPhoneDeviceModel
        }
    }
    
}

