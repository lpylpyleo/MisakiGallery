//
//  Network.swift
//  Counter
//
//  Created by Spike Liao on 2021/12/16.
//

import Foundation

class Network : ObservableObject {
    @Published var users :[User]=[]
    
    func fetchUsers() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, res, err) in
            if let err = err {
                print(err)
                return
            }
            
            guard let res = res as? HTTPURLResponse? else { return }
            
            if res?.statusCode == 200 {
                DispatchQueue.main.async {
                    do {
                        let decoded = try JSONDecoder().decode([User].self, from: data!)
                        self.users = decoded
                    }catch let err{
                        print(err)
                    }
                }
            }
        }
        
        task.resume()
    }
}


