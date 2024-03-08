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
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
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
    
    func addTask(taskTitle: String) {
        guard let localRealm = localRealm else { return }
        do {
            try localRealm.write {
                let newTask = Task(value: ["title": taskTitle, "completed": false])
                localRealm.add(newTask)
                getTasks()
                Logger.log("정상적으로 RealmDB에 추가되었습니다: \(newTask)")
            }
        } catch {
            Logger.log("RealmDB에 추가하는 중 에러가 발생했습니다: \(error)")
        }
    }
    
    func getTasks() {
        guard let localRealm = localRealm else { return }
        let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
        tasks = []
        allTasks.forEach { (task: Task) in tasks.append(task) }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        guard let localRealm = localRealm else { return }
        do {
            let taskToUpdate = localRealm.objects(Task.self)
                .filter(NSPredicate(format: "id == %@", id))
            guard !taskToUpdate.isEmpty else { return }
            try localRealm.write {
                taskToUpdate[0].completed = completed
                getTasks()
                Logger.log("정상적으로 RealmDB에 업데이트되었습니다: \(id)")
            }
        } catch {
            Logger.log("RealmDB에 업데이트하는 중 에러가 발생했습니다: \(id), \(error)")
        }
    }
    
    func deleteTask(id: ObjectId) {
        guard let localRealm = localRealm else { return }
        do {
            let taskToDelete = localRealm.objects(Task.self)
                .filter(NSPredicate(format: "id == %@", id))
            guard !taskToDelete.isEmpty else { return }
            try localRealm.write {
                localRealm.delete(taskToDelete)
                getTasks()
                Logger.log("정상적으로 RealmDB에서 삭제되었습니다: \(id)")
            }
        } catch {
            Logger.log("RealmDB에서 삭제하는 중 에러가 발생했습니다: \(id), \(error)")
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
