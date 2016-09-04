
import Foundation

public class Article {
    
    var Id: Int!
    var Title: String!
    var Name: String!
    var Text: String!
    var ImgPath: String!
    var Date: String!
    
    func getTextLimitCountTextStrng(trimCount:Int)->String{
        let s: String = self.Text
        let count:Int = s.characters.count
        if(count>trimCount){
            let trimStrimg: String = (s as NSString).substringToIndex(trimCount)
            return trimStrimg + "..."
        }
        return s
    }
}

