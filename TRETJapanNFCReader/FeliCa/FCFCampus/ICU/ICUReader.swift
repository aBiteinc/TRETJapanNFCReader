//
//  ICUReader.swift
//  TRETJapanNFCReader
//
//  Created by Qs-F on 2019/09/26.
//  Copyright © 2019 treastrain / Tanaka Ryoga. All rights reserved.
//

import CoreNFC

@available(iOS 13.0, *)
public typealias ICUCardTag = NFCFeliCaTag

@available(iOS 13.0, *)
public class ICUReader: FeliCaReader {

    private var ICUCardItemTypes: [ICUCardItemType] = []
    
    private init() {
        fatalError()
    }
    
    /// ICUReader を初期化する。
    /// - Parameter feliCaReader: FeliCaReader
    public init(feliCaReader: FeliCaReader) {
        super.init(delegate: feliCaReader.delegate!)
    }
    
    /// ICUReader を初期化する。
    /// - Parameter delegate: FeliCaReaderSessionDelegate
    public override init(delegate: FeliCaReaderSessionDelegate) {
        super.init(delegate: delegate)
    }
    
    /// ICUReader を初期化する。
    /// - Parameter viewController: FeliCaReaderSessionDelegate を適用した UIViewController
    public override init(viewController: FeliCaReaderViewController) {
        super.init(viewController: viewController)
    }
    
    /// IICUカードからデータを読み取る
    /// - Parameter itemTypes: ICUカードから読み取りたいデータのタイプ
    public func get(itemTypes: [ICUCardItemType]) {
        self.ICUCardItemTypes = itemTypes
        self.beginScanning()
    }
    
    public func getItems(_ session: NFCTagReaderSession, feliCaTag: NFCFeliCaTag, idm: String, systemCode: FeliCaSystemCode, itemTypes: [ICUCardItemType], completion: @escaping (FeliCaCard) -> Void) {
        self.ICUCardItemTypes = itemTypes
        self.getItems(session, feliCaTag: feliCaTag, idm: idm, systemCode: systemCode) { (feliCaCard) in
            completion(feliCaCard)
        }
    }
    
    public override func getItems(_ session: NFCTagReaderSession, feliCaTag: NFCFeliCaTag, idm: String, systemCode: FeliCaSystemCode, completion: @escaping (FeliCaCard) -> Void) {
        var icuCard = ICUCard(tag: feliCaTag, data: ICUCardData(idm: idm, systemCode: systemCode))
        DispatchQueue(label: "TRETJPNRICUReader", qos: .default).async {
            var data: [FeliCaServiceCode : [Data]] = [:]
            for itemType in self.ICUCardItemTypes {
                data[itemType.serviceCode] = self.readWithoutEncryption(session: session, tag: icuCard.tag, serviceCode: itemType.serviceCode, blocks: itemType.blocks)
            }
            icuCard.data.data = data
            completion(icuCard)
        }
    }
}

