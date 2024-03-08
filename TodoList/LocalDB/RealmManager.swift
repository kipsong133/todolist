//
//  RealmManager.swift
//  TodoList
//
//  Created by 김우성 on 2024/03/08.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    
    init() {
        openRealm()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            Realm.Configuration.defaultConfiguration = config
            localRealm = try Realm()
        } catch {
            Logger.log("Realm open error: \(error)")
        }
    }
}

// 추후에 스키마를 변경하면서, 마이그레이션을 해야한다면, 아래 로직이 추가되어야 한다.
//
//let config = Realm.Configuration(schemaVersion: 1, migrationBlock: { migration, oldSchemaVersion in
//    if oldSchemaVersion > 1 {
//        // 업데이트된 스키마를 이곳에서 추가해준다.
//    }
//})
