
//
//  ViewController.swift
//  GCD-class
//
//  Created by Xanda Aguiar on 05/09/14.
//  Copyright (c) 2014 iTunesU-PoA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var lblTexto: UILabel!
    
    @IBOutlet weak var odds: UITextView!
    
    @IBOutlet weak var even: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //fila serial, FIFO, async
        var queueSerial:dispatch_queue_t
        queueSerial = dispatch_queue_create("com.example.Serial", DISPATCH_QUEUE_SERIAL)
        /*
        
        dispatch_async(queueSerial, {
            var i=0
            for (i=0; i<100000;i++){
                println("1")
            }
        })
        
        dispatch_async(queueSerial, {
            var i=0
            for (i=0; i<100000;i++){
                println("2")
            }
        })
        
        dispatch_async(queueSerial, {
            var i=0
            for (i=0; i<100000;i++){
                println("3")
            }
        })
        */
        
       /* //fila serial, FIFO, sync
        var queueSerialSyn:dispatch_queue_t
        queueSerialSyn = dispatch_queue_create("com.example.SerialSyn", DISPATCH_QUEUE_SERIAL)
        
        
        dispatch_sync(queueSerialSyn, {
            var i=0
            for (i=0; i<1000;i++){
                println("1")
            }
        })
        
        println("THREAD PRINCIPAL")
        
        dispatch_sync(queueSerialSyn, {
            var i=0
            for (i=0; i<1000;i++){
                println("2")
            }
        })

        println("THREAD PRINCIPAL DE NOVO")
        
        dispatch_sync(queueSerialSyn, {
            var i=0
            for (i=0; i<1000;i++){
                println("3")
            }
        })*/
    
        
        //colocar breakpoint para ver as filas
        
        
        //fila Concorrente, FIFO pra despachar, mas pode acabar em qualquer ordem
        //async
        var queueConc:dispatch_queue_t
        queueConc = dispatch_queue_create("com.example.Concurrent", DISPATCH_QUEUE_CONCURRENT);

/*
        dispatch_async(queueConc, {
            var i=0
            for (i=0; i<100000;i++){
                println("1")
            }
        })
        
        dispatch_async(queueConc, {
            var i=0
            for (i=0; i<100000;i++){
                println("2")
            }
        })
        
        dispatch_async(queueConc, {
            var i=0
            for (i=0; i<100000;i++){
                println("3")
            }
            
        })
*/
        
        /*
        dispatch_async(queueConc, {
            
            dispatch_async(queueConc, {
                var i=0
                for (i=0; i<100000;i++){
                    println("1")
                }
            })

            dispatch_sync(queueConc, {
                var i=0
                
                for (i=0; i<100000;i++){
                    println("2")
                }
            })
            
            dispatch_async(queueConc, {
                var i=0
                for (i=0; i<100000;i++){
                    println("3")
                }
            })
        })*/
        
//        var i=0
//        for (i=0; i<100000;i++){
//            println("Main")
//        }
        
        
        /*dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0), {
            var i=0
        
            for (i=0; i<1000;i++){
                    println("BG")
            }
           
            dispatch_async(dispatch_get_main_queue()){
                self.lblTexto.text="BG"
            }


            for (i=0; i<1000;i++){
                println("BG2")
            }
            
            self.lblTexto.text="BG2"
            
        })*/
        
        
        var numbers = [0]
        var odds = []
        var even = []
        for (var i=1;i<10000;i++)
        {
            numbers+=[i]
        }
        
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0), {
            odds    = numbers.filter { $0 % 2 == 1 }
            //println(odds)
            dispatch_async(dispatch_get_main_queue()){
                self.odds.text = "\(odds)"
            }
        })

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0), {
            even    = numbers.filter { $0 % 2 == 0 }
            dispatch_async(dispatch_get_main_queue()){
                self.even.text = "\(even)"
            }
        })


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

