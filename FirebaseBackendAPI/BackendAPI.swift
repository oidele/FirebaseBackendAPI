//
//  BackendAPI.swift
//  FirebaseBackendAPI
//
//  Created by Osaretin Idele on 16/05/2021.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import Runtime

public class BackendAPI<T : Codable>: NSObject, Codable {
    
    public func save(_ obj: T, onCompletion: @escaping (Bool?) -> Void){
        var objData = obj
        let docIdStr = "doc_id"
        let typeNameStr = String(describing: type(of: obj.self))
        do {
            let info = try typeInfo(of: T.self)
            let docId = try info.property(named: docIdStr)
            print(docId)
            if docId.name != "" {
                var ref: DocumentReference? = nil
                ref = Firestore.firestore().collection(typeNameStr).document()
                try info.property(named: docIdStr).set(value: ref?.documentID as Any, on: &objData)
                if let ref = ref {
                    do {
                        try Firestore.firestore().collection(typeNameStr).document(ref.documentID).setData(from: objData)
                        print("New upload document successfully saved \(ref)")
                        onCompletion(true)
                    } catch let error {
                        print (error)
                        onCompletion(false)
                    }
                }
            } else {
                print("Type missing mandatory property \(docIdStr)")
                onCompletion(false)
            }
        } catch let error {
            print(error)
        }
    }

}
