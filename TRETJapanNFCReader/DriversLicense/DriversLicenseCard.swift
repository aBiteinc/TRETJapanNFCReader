//
//  DriversLicenseCard.swift
//  TRETJapanNFCReader
//
//  Created by treastrain on 2019/06/29.
//  Copyright © 2019 treastrain / Tanaka Ryoga. All rights reserved.
//

import CoreNFC

/// 日本の運転免許証から読み取ることができるデータの種別
public enum DriversLicenseCardItem: CaseIterable {
    /// MF/EF01 共通データ要素
    case commonData
    /// MF/EF02 暗証番号(PIN)設定
    case pinSetting
    /// DF1/EF01 記載事項(本籍除く)
    case matters
}

/// 日本の運転免許証
public struct DriversLicenseCard {
    internal var tag: DriversLicenseCardTag
    
    /// MF/EF01 共通データ要素
    public struct CommonData {
        /// 仕様書バージョン番号
        public var specificationVersionNumber: String
        /// 交付年月日
        public var issuanceDate: Date
        /// 有効期間の末日
        public var expirationDate: Date
        /// カード製造業者識別子
        public var cardManufacturerIdentifier: UInt8
        /// 暗号関数識別子
        public var cryptographicFunctionIdentifier: UInt8
    }
    /// MF/EF01 共通データ要素
    public var commonData: CommonData?
    
    /// MF/EF02 暗証番号(PIN)設定
    public struct PINSetting {
        /// 暗証番号(PIN)設定
        public var pinSetting: Bool
    }
    /// MF/EF02 暗証番号(PIN)設定
    public var pinSetting: PINSetting?
    
    /// DF1/EF01 記載事項(本籍除く)
    public struct Matters {
        /// JISX0208制定年番号
        public var jisX0208EstablishmentYearNumber: String
        /// 氏名
        public var name: String
        /// 呼び名(カナ)
        public var nickname: String
        /// 通称名
        public var commonName: String?
        /// 統一氏名(カナ)
        public var uniformName: String
        /// 生年月日
        public var birthdate: Date
        /// 住所
        public var address: String
        /// 交付年月日
        public var issuanceDate: Date
        /// 照会番号
        public var referenceNumber: String
        /// 免許証の色区分(優良・新規・その他)
        public var color: String
        /// 有効期間の末日
        public var expirationDate: Date
        /// 免許の条件1
        public var condition1: String?
        /// 免許の条件2
        public var condition2: String?
        /// 免許の条件3
        public var condition3: String?
        /// 免許の条件4
        public var condition4: String?
        /// 公安委員会名
        public var issuingAuthority: String
        /// 免許証の番号
        public var number: String
        /// 免許の年月日(二・小・原)
        public var motorcycleLicenceDate: Date?
        /// 免許の年月日(他)
        public var otherLicenceDate: Date?
        /// 免許の年月日(二種)
        public var class2LicenceDate: Date?
        /// 免許の年月日(大型)
        public var heavyVehicleLicenceDate: Date?
        /// 免許の年月日(普通)
        public var ordinaryVehicleLicenceDate: Date?
        /// 免許の年月日(大特)
        public var heavySpecialVehicleLicenceDate: Date?
        /// 免許の年月日(大自二)
        public var heavyMotorcycleLicenceDate: Date?
        /// 免許の年月日(普自二)
        public var ordinaryMotorcycleLicenceDate: Date?
        /// 免許の年月日(小特)
        public var smallSpecialVehicleLicenceDate: Date?
        /// 免許の年月日(原付)
        public var mopedLicenceDate: Date?
        /// 免許の年月日(け引)
        public var trailerLicenceDate: Date?
        /// 免許の年月日(大二)
        public var class2HeavyVehicleLicenceDate: Date?
        /// 免許の年月日(普二)
        public var class2OrdinaryVehicleLicenceDate: Date?
        /// 免許の年月日(大特二)
        public var class2HeavySpecialVehicleLicenceDate: Date?
        /// 免許の年月日(け引二)
        public var class2TrailerLicenceDate: Date?
        /// 免許の年月日(中型)
        public var mediumVehicleLicenceDate: Date?
        /// 免許の年月日(中二)
        public var class2MediumVehicleLicenceDate: Date?
        /// 免許の年月日(準中型)
        public var semiMediumVehicleLicenceDate: Date?
    }
    /// DF1/EF01 記載事項(本籍除く)
    public var matters: Matters?
    
    /*
    
    // DF1/EF02 記載事項(本籍)
    var 本籍: String
    
    // DF1/EF03 外字
    var 文字構成1: Int
    var 外字1: Data
    var 文字構成2: Int
    var 外字2: Data
    
    // DF1/EF04 記載事項変更等(本籍除く)
    var 追記の有無: Bool
    var JISX0208制定年番号: Int
    var 変更年月日: Date
    var 住所地公安委員会名: String
    var JISX0208制定年番号: Int
    var 変更年月日: Date
    var 新氏名: String
    var 公安委員会名: String
    var JISX0208制定年番号: Int
    var 変更年月日: Date
    var 新呼び名: String
    var 公安委員会名: String
    var JISX0208制定年番号: Int
    var 変更年月日: Date
    var 新住所: String
    var 公安委員会名: String
    var JISX0208制定年番号: Int
    var 変更年月日: Date
    var 新条件: String
    var 公安委員会名: String
    var JISX0208制定年番号: Int
    var 変更年月日: Date
    var 条件解除: String
    var 公安委員会名: String
    var JISX0208制定年番号: Int
    var 変更年月日: Date
    var 備考: String
    var 公安委員会名: String
    var JISX0208制定年番号: Int
    var 変更年月日: Date
    var 予備: String
    var 公安委員会名: String
    
    // DF1/EF05 記載事項変更(外字)
    var 追記の有無: Bool
    var 文字構成3: Int
    var 外字3: Data
    var 文字構成4: Int
    var 外字4: Data
    var 文字構成5: Int
    var 外字5: Data
    var 文字構成6: Int
    var 外字6: Data
    var 文字構成7: Int
    var 外字7: Data
    
    // DF1/EF06 記載事項変更(本籍)
    var 追記の有無: Bool
    var JISX0208制定年番号: Int
    var 変更年月日: Date
    var 新本籍: String
    var 公安委員会名: String
    
    // DF1/EF07 電子署名
    var 電子署名: Data
    var シリアル番号: String
    var 発行者名: String
    var 主体者名: String
    var 主体者鍵識別子: UInt8
    
    // DF2/EF01 写真
    var 写真: Data
    
    // DF3/EF01 RFU
    */
    
    typealias TLVField = (tag: UInt8, length: UInt8, value: [UInt8])
    
    internal func convert(items: DriversLicenseCardItem, from data: [UInt8]) -> DriversLicenseCard {
        var driversLicenseCard = self
        var fields: [TLVField] = []
        
        var i = 0
        while i < data.count {
            let tag = data[i]
            if tag == 0xFF {
                break
            }
            i += 1
            let length = data[i]
            if length == 0 {
                i += 1
                continue
            }
            i += 1
            let endIndex = Int(length) + i - 1
            let value = data[i...endIndex].map {$0}
            i = endIndex + 1
            
            let valueString = value.map { (u) -> String in u.toHexString() }
            print("タグ: \(tag.toHexString()), 長さ: \(length), 値: \(valueString)")
            
            fields.append((tag: tag, length: length, value: value))
        }
        
        switch items {
        case .commonData:
            driversLicenseCard = self.convertToCommonData(fields: fields)
        case .pinSetting:
            driversLicenseCard = self.convertToPinSetting(fields: fields)
        case .matters:
            driversLicenseCard = self.convertToMatters(fields: fields)
        }
        
        return driversLicenseCard
    }
    
    private func convertToCommonData(fields: [TLVField]) -> DriversLicenseCard {
        var driversLicenseCard = self
        
        var specificationVersionNumber: String?
        var issuanceDate: Date?
        var expirationDate: Date?
        var cardManufacturerIdentifier: UInt8?
        var cryptographicFunctionIdentifier: UInt8?
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyyMMdd"
        
        for field in fields {
            switch field.tag {
            case 0x45:
                specificationVersionNumber = String(data: Data(field.value[0...2]), encoding: .shiftJIS)
                let issuanceDateString = field.value[3...6].map { (data) -> String in
                    return data.toString()
                }.joined()
                issuanceDate = formatter.date(from: issuanceDateString)
                let expirationDateString = field.value[7...10].map { (data) -> String in
                    return data.toString()
                }.joined()
                expirationDate = formatter.date(from: expirationDateString)
            case 0x46:
                cardManufacturerIdentifier = field.value[0]
                cryptographicFunctionIdentifier = field.value[1]
            default:
                break
            }
        }
        
        if let specificationVersionNumber = specificationVersionNumber,
           let issuanceDate = issuanceDate,
           let expirationDate = expirationDate,
           let cardManufacturerIdentifier = cardManufacturerIdentifier,
           let cryptographicFunctionIdentifier = cryptographicFunctionIdentifier {
            driversLicenseCard.commonData = DriversLicenseCard.CommonData(specificationVersionNumber: specificationVersionNumber, issuanceDate: issuanceDate, expirationDate: expirationDate, cardManufacturerIdentifier: cardManufacturerIdentifier, cryptographicFunctionIdentifier: cryptographicFunctionIdentifier)
        }
        
        return driversLicenseCard
    }
    
    private func convertToPinSetting(fields: [TLVField]) -> DriversLicenseCard {
        var driversLicenseCard = self
        
        let pinSettingData = fields.first?.value.first!
        var pinSetting: Bool {
            if pinSettingData == 0x01 {
                return true
            } else if pinSettingData == 0x00 {
                return false
            }
            return false
        }
        
        driversLicenseCard.pinSetting = DriversLicenseCard.PINSetting(pinSetting: pinSetting)
        
        return driversLicenseCard
    }
    
    private func convertToMatters(fields: [TLVField]) -> DriversLicenseCard {
        var driversLicenseCard = self
        
        var jisX0208EstablishmentYearNumber: String?
        var name: String?
        var nickname: String?
        var commonName: String?
        var uniformName: String?
        var birthdate: Date?
        var address: String?
        var issuanceDate: Date?
        var referenceNumber: String?
        var color: String?
        var expirationDate: Date?
        var condition1: String?
        var condition2: String?
        var condition3: String?
        var condition4: String?
        var issuingAuthority: String?
        var number: String?
        var motorcycleLicenceDate: Date?
        var otherLicenceDate: Date?
        var class2LicenceDate: Date?
        var heavyVehicleLicenceDate: Date?
        var ordinaryVehicleLicenceDate: Date?
        var heavySpecialVehicleLicenceDate: Date?
        var heavyMotorcycleLicenceDate: Date?
        var ordinaryMotorcycleLicenceDate: Date?
        var smallSpecialVehicleLicenceDate: Date?
        var mopedLicenceDate: Date?
        var trailerLicenceDate: Date?
        var class2HeavyVehicleLicenceDate: Date?
        var class2OrdinaryVehicleLicenceDate: Date?
        var class2HeavySpecialVehicleLicenceDate: Date?
        var class2TrailerLicenceDate: Date?
        var mediumVehicleLicenceDate: Date?
        var class2MediumVehicleLicenceDate: Date?
        var semiMediumVehicleLicenceDate: Date?
        
        for field in fields {
            switch field.tag {
            case 0x11:
                jisX0208EstablishmentYearNumber = field.value.first?.toString()
            case 0x12:
                let nameData = field.value.split(count: 2)
                name = String?(jisX0208Data: nameData)
                print(name)
            default:
                break
            }
        }
        
        if let jisX0208EstablishmentYearNumber = jisX0208EstablishmentYearNumber,
           let name = name,
           let nickname = nickname,
           let uniformName = uniformName,
           let birthdate = birthdate,
           let address = address,
           let issuanceDate = issuanceDate,
           let referenceNumber = referenceNumber,
           let color = color,
           let expirationDate = expirationDate,
           let issuingAuthority = issuingAuthority,
           let number = number {
            driversLicenseCard.matters = DriversLicenseCard.Matters(jisX0208EstablishmentYearNumber: jisX0208EstablishmentYearNumber, name: name, nickname: nickname, commonName: commonName, uniformName: uniformName, birthdate: birthdate, address: address, issuanceDate: issuanceDate, referenceNumber: referenceNumber, color: color, expirationDate: expirationDate, condition1: condition1, condition2: condition2, condition3: condition3, condition4: condition4, issuingAuthority: issuingAuthority, number: number, motorcycleLicenceDate: motorcycleLicenceDate, otherLicenceDate: otherLicenceDate, class2LicenceDate: class2LicenceDate, heavyVehicleLicenceDate: heavyVehicleLicenceDate, ordinaryVehicleLicenceDate: ordinaryVehicleLicenceDate, heavySpecialVehicleLicenceDate: heavySpecialVehicleLicenceDate, heavyMotorcycleLicenceDate: heavyMotorcycleLicenceDate, ordinaryMotorcycleLicenceDate: ordinaryMotorcycleLicenceDate, smallSpecialVehicleLicenceDate: smallSpecialVehicleLicenceDate, mopedLicenceDate: mopedLicenceDate, trailerLicenceDate: trailerLicenceDate, class2HeavyVehicleLicenceDate: class2HeavyVehicleLicenceDate, class2OrdinaryVehicleLicenceDate: class2OrdinaryVehicleLicenceDate, class2HeavySpecialVehicleLicenceDate: class2HeavySpecialVehicleLicenceDate, class2TrailerLicenceDate: class2TrailerLicenceDate, mediumVehicleLicenceDate: mediumVehicleLicenceDate, class2MediumVehicleLicenceDate: class2MediumVehicleLicenceDate, semiMediumVehicleLicenceDate: semiMediumVehicleLicenceDate)
        }
        
        return driversLicenseCard
    }
}

