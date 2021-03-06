//
//  CommonCard.swift
//  TRETJapanNFCReader
//
//  Created by Qs-F on 2019/09/27.
//  Copyright © 2019 treastrain / Tanaka Ryoga. All rights reserved.
//

import Foundation
#if os(iOS)
import CoreNFC
#endif

#if os(iOS)
@available(iOS 13.0, *)
public struct FCFCampusCard: FeliCaCard{
    public let tag: NFCFeliCaTag
    public let data: FCFCampusCardData
    
    public init(tag: NFCFeliCaTag, data: FCFCampusCardData) {
        self.tag = tag
        self.data = data
    }
}
#endif

public struct FCFCampusCardData: FeliCaCardData {
    public let type: FeliCaCardType
    public let idm: String
    public let systemCode: FeliCaSystemCode
    public var data: [FeliCaServiceCode : [Data]] = [:]
    
    @available(iOS 13.0, *)
    public init(type: FeliCaCardType = .fcfcampus, idm: String, systemCode: FeliCaSystemCode) {
        self.type = type
        self.idm = idm
        self.systemCode = systemCode
    }
    
    public func convert() {
        
    }
}
