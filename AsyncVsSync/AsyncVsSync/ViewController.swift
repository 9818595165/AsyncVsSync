//
//  ViewController.swift
//  AsyncVsSync
//
//  Created by Prabhat Pankaj on 21/07/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        DispatchQueue.main.sync{ // Application will crash as main is a serail queue. Compiler is in deadlock so crashed.we are blocking the main thread
//            print("Hello")
//        }
        
    
        
        
        
        
//        print("Step 1")
//        DispatchQueue.main.async { // this operation queued
//            print("Step 2")
//        }
//        print("Step 3")
        /*
         Step 1
         Step 3
         Step 2
         */
        
        
        
//        print("1")
//        DispatchQueue.main.async { // this operation queued
//            print("2")
//            DispatchQueue.main.async { // this operation queued
//                print("3")
//            }
//        }
//        print("4")
        
        /*
         1
         4
         2
         3
         */
        
        
        
        
//        DispatchQueue.main.async {
//            DispatchQueue.main.sync {  // Application will crash as main is a serail queue. Compiler is in deadlock so crashed.we are blocking the main thread
//                print("Print1")
//            }
//            print("Print2")
//        }
        
        
        
        
//        print("Step 0")
//        DispatchQueue.main.async {//it will get queued
//            DispatchQueue.global().sync {  // application will not crashed because global is a background thread not a main thread, it will get priority against step 2
//                print("Step 1")
//            }
//            print("Step 2")
//        }
//        print("Step 3")
        /*
         Step 0
         Step 3
         Step 1
         Step 2
         */

        
//        DispatchQueue.global().sync {
//            DispatchQueue.global().sync {
//                print("Step 1")
//            }
//            print("Step 2")
//        }
/*
 Step 1
 Step 2
 */
        
        
        
        
        /*
            Thread                   Task
         
         Serial + Sync              ORDER
         Serial + Async             ORDER
         
         Concurrent + Sync          ORDER
         Concurrent + Async         UNORDER
         
         */
        
        
        serialQueueWithSync()
        serialQueueWithAsync()
        concurrentQueueWithSync()
        concurrentQueueWithAsync()
    }
    
    func serialQueueWithSync(){
        let myQueue = DispatchQueue(label: "task-1-2.serial.queue")
        
        //One thread
        myQueue.sync {
            print("Task 1 started")
            // do some task
            for index in 3...10 {
                print("\(index) [TASK-1] times 5 is \(index*5)")
            }
            print("Task 1 finished")
        }
        
        //Second thread
        myQueue.sync {
            print("Task 2 started")
            // do some task
            for index in 2...6 {
                print("\(index) [TASK-2] times 5 is \(index*5)")
            }
            print("Task 2 finished")
        }
    }
    
    
    func serialQueueWithAsync(){
        let myQueue = DispatchQueue(label: "task-3-4.serial.queue")
        
        //One thread
        myQueue.async {
            print("Task 3 started")
            // do some task
            for index in 3...10 {
                print("\(index) [TASK-3] times 5 is \(index*5)")
            }
            print("Task 3 finished")
        }
        
        //Second thread
        myQueue.async {
            print("Task 4 started")
            // do some task
            for index in 2...6 {
                print("\(index) [TASK-4] times 5 is \(index*5)")
            }
            print("Task 4 finished")
        }
    }

    func concurrentQueueWithSync(){
        let myQueue = DispatchQueue(label: "task-5-6.concurrent.queue", attributes: .concurrent)
        
        //One thread
        myQueue.sync {
            print("Task 5 started")
            // do some task
            for index in 3...10 {
                print("\(index) [TASK-5] times 5 is \(index*5)")
            }
            print("Task 5 finished")
        }
        
        //Second thread
        myQueue.sync {
            print("Task 6 started")
            // do some task
            for index in 2...6 {
                print("\(index) [TASK-6] times 5 is \(index*5)")
            }
            print("Task 6 finished")
        }
    }

    func concurrentQueueWithAsync(){
        let myQueue = DispatchQueue(label: "task-7-8.concurrent.queue", attributes: .concurrent)
        
        //One thread
        myQueue.async {
            print("Task 7 started")
            // do some task
            for index in 3...10 {
                print("\(index) [TASK-7] times 5 is \(index*5)")
            }
            print("Task 7 finished")
        }
        
        //Second thread
        myQueue.async {
            print("Task 8 started")
            // do some task
            for index in 2...6 {
                print("\(index) [TASK-8] times 5 is \(index*5)")
            }
            print("Task 8 finished")
        }
    }
}

