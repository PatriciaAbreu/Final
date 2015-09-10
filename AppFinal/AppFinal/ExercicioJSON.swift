//
//  ExercicioJSON.swift
//  AppFinal
//
//  Created by Patricia de Abreu on 01/09/15.
//  Copyright (c) 2015 Patricia de Abreu. All rights reserved.
//

import UIKit

class ExercicioJSON: NSObject {
    
    func busca(){
        var jData = NSData(contentsOfFile: "exercicios.json")
        
        var arrayDeResultados: NSArray
        var result: NSDictionary
        var nomeRep: Array<String> = []
        
        arrayDeResultados = NSJSONSerialization.JSONObjectWithData(jData!, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSArray
    }
    
    func getAudio(var exercicio: Int, var audio: String)-> String{
        
        let path: NSString = NSBundle.mainBundle().pathForResource("exercicios", ofType: "json")!
        var data: NSData = NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped, error: nil)!
        var dict: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        println(dict)
        
        var exercicios = dict.objectForKey("exercicios") as! NSArray
        println(exercicios)
        
        var exercicio = exercicios.objectAtIndex(exercicio) as! NSDictionary
        println(exercicio)
        
        var audios = exercicio.objectForKey("audio") as! NSDictionary
        println(audios)
        
        var audio = audios.objectForKey(audio) as! NSString
        println(audio)
        
        return audio as! String
        
}

    func getVideo(var exercicio: Int, var video: String) -> String {
        
        let path: NSString = NSBundle.mainBundle().pathForResource("exercicios", ofType: "json")!
        var data: NSData = NSData(contentsOfFile: path as String, options: NSDataReadingOptions.DataReadingMapped, error: nil)!
        var dict: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
        println(dict)
        
        var exercicios = dict.objectForKey("exercicios") as! NSArray
        println(exercicios)
        
        var exercicio = exercicios.objectAtIndex(exercicio) as! NSDictionary
        println(exercicio)
        
        var videos = exercicio.objectForKey("video") as! NSDictionary
        println(videos)
        
        var video = videos.objectForKey(video) as! NSString
        println(video)
        
        return video as! String
    }
    
    
}