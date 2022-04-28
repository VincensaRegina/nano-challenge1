//
//  Data.swift
//  nano-challenge1
//
//  Created by Vincensa Regina on 28/04/22.
//

import Foundation

class Task {
    var name: String
    var due: Date
    var subtasks: [Subtask]?
    
    init(name: String, due: Date, subtasks: [Subtask]) {
        self.name = name
        self.due = due
        self.subtasks = subtasks
    }
}

class Subtask {
    var name: String
    var due: Date
    var task: Task?
    var coins: Int
    var status: String
    
    init(name: String, due: Date, task: Task, coins: Int, status: String) {
        self.name = name
        self.due = due
        self.task = task
        self.coins = coins
        self.status = status
    }
}

class Reward {
    var name: String
    var price: Float
    var coin: Int
    
    init(name: String, price: Float, coin: Int) {
        self.name = name
        self.price = price
        self.coin = coin
    }
}


func taskFeeder() -> [Task] {
    // Date Formatter
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    return [
        Task.init(name: "Thesis Project", due: formatter.date(from: "30/04/2022")!, subtasks: []),
        Task.init(name: "Freelance Project", due: formatter.date(from: "10/05/2022")!, subtasks: [])
    ]
}

func subtaskFeeder() -> [Subtask] {
    // Date Formatter
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    
    return [
        Subtask.init(name: "Login", due: formatter.date(from: "27/04/2022")!, task: tasksSeedTemp[0], coins: 10, status: "Not Started"),
        Subtask.init(name: "Change Password", due: formatter.date(from: "28/04/2022")!, task: tasksSeedTemp[0], coins: 20, status: "Not Started"),
        Subtask.init(name: "Login2", due: formatter.date(from: "30/04/2022")!, task: tasksSeedTemp[1], coins: 10, status: "Not Started"),
        Subtask.init(name: "Change Password2", due: formatter.date(from: "01/05/2022")!, task: tasksSeedTemp[1], coins: 20, status: "Not Started"),
        Subtask.init(name: "Change Password3", due: formatter.date(from: "02/05/2022")!, task: tasksSeedTemp[1], coins: 30, status: "In progress")
     ]
}

var tasksSeedTemp = taskFeeder()
var subtasksSeed = subtaskFeeder()

func insertSubtask() -> [Task] {
    for item in tasksSeedTemp {
        for subtask in subtasksSeed {
            if subtask.task?.name == item.name {
                item.subtasks?.append(subtask)
            }
        }
    }
    return tasksSeedTemp
}

var tasksSeed = insertSubtask()

//Coin
var userCoin = 10000

var rewardsSeed = [
    Reward.init(name: "Buy a coffee", price: 20000.0, coin: 20),
    Reward.init(name: "Buy a book", price: 30000, coin: 30),
    Reward.init(name: "Buy a game", price: 500000, coin: 500)
]



