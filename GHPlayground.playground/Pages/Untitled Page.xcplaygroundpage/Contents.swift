//: [Previous](@previous)

import UIKit

var str = "Hello, playground"

//: [Next](@next)


let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 320, height: 640))
let text = "<p>This is a test of the <strong>ZSSRichTextEditor</strong> by <a title=\"Zed Said\" href=\"http://www.zedsaid.com\">Zed Said Studio</a>rrrttttttttttyfffyy</p><h2>Jhans</h2><p></p><p>John</p><p><br /></p>"

extension String {
    /// 删除字符串中 href 的引用
    func removeHref() -> String? {
        
        // 0. pattern 匹配方案 - 要过滤字符串最重要的依据
        // <a href="http://www.xxx.com/abc">XXX软件</a>
        // () 是要提取的匹配内容，不使用括号，就是要忽略的内容
        let pattern = "<[^>]*>"

//        let pattern = "<a.*?>(.*?)</a>"
        
        // 1. 定义正则表达式
        // DotMatchesLineSeparators 使用 . 可以匹配换行符
        // CaseInsensitive 忽略大小写
        let regex = try! NSRegularExpression(pattern: pattern, options: [NSRegularExpressionOptions.CaseInsensitive, NSRegularExpressionOptions.DotMatchesLineSeparators])
        
        // 2. 匹配文字
        // firstMatchInString 在字符串中查找第一个匹配的内容
        // rangeAtIndex 函数是使用正则最重要的函数 -> 从 result 中获取到匹配文字的 range
        // index == 0，取出与 pattern 刚好匹配的内容
        // index == 1，取出第一个()中要匹配的内容
        // index 可以依次递增，对于复杂字符串过滤，可以使用多几个 ()
        let text = self as NSString
        let length = text.length
        // 提示：不要直接使用 String.length，包含UNICODE的编码长度，会出现数组越界
        //        let length = self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
        
        if let result = regex.firstMatchInString(self, options: NSMatchingOptions(), range: NSMakeRange(0, length)) {
            // 匹配到内容
            
            print(result.rangeAtIndex(0))
            print(text.substringWithRange(result.rangeAtIndex(0)))
            
            print(result.rangeAtIndex(1))
            print(text.substringWithRange(result.rangeAtIndex(1)))
            
            return text.substringWithRange(result.rangeAtIndex(1))
        }
        
        return nil
    }
    
    func emoticonString() -> String? {
        
        // 1. pattern - [] 是正则表达式的特殊字符
        let pattern = "<[^>]*>"
        
        // 2. regex
        let regex = try! NSRegularExpression(pattern: pattern, options: [NSRegularExpressionOptions.CaseInsensitive, NSRegularExpressionOptions.DotMatchesLineSeparators])
        
        // 3. 多个匹配，[NSTextCheckingResult]
        let checkingResults = regex.matchesInString(self, options: NSMatchingOptions(), range: NSMakeRange(0, self.characters.count))
        
        let text = self as NSString
        // 4. 倒着遍历匹配结果
       
        for var i = checkingResults.count - 1; i >= 0; i -= 1 {
            let result = checkingResults[i]
             text.stringByReplacingCharactersInRange(result.rangeAtIndex(0), withString: "")
            
        }
        return text as String
    }


}

text.emoticonString()

let pp = "http://www.tongshijia.com/weshares/view/2323?sd=444"

do {
    let rg = try NSRegularExpression(pattern: "[1-9]\\d*", options: NSRegularExpressionOptions.CaseInsensitive)
    let range = NSString(string:pp).rangeOfString(pp)
    if let result = rg.firstMatchInString(pp, options: NSMatchingOptions.ReportProgress, range: range) {
        print(result.rangeAtIndex(0))
        let code = NSString(string:pp).substringWithRange(result.rangeAtIndex(0))
        print(code)
    }
    
    let p = rg.stringByReplacingMatchesInString(pp, options: NSMatchingOptions.ReportProgress, range: NSMakeRange(0, pp.characters.count), withTemplate: "")
    print(p)
} catch {
    
}

//NSPredicate(format: "SELF MATCHES %@", "/<[^>]*>/").evaluateWithObject(text)

print(text.emoticonString())




var myString = "my car reg 1 - DD11 AAA  my car reg 2 - AA22 BBB"
//var stringlength = countElements(myString)
var ierror: NSError?
//var regex: NSRegularExpression = NSRegularExpression(pattern: "([A-HK-PRSVWY][A-HJ-PR-Y])\\s?([0][2-9]|[1-9][0-9])\\s?[A-HJ-PR-Z]{3}", options: NSRegularExpressionOptions.CaseInsensitive, error: &ierror)!
//var modString = regex.stringByReplacingMatchesInString(myString, options: nil, range: NSMakeRange(0, myString.length), withTemplate: "XX")
//print(modString)


//let text = "限量优惠 北京市内包邮 </strong></span><br />（原价每袋16.8元）<br /><br /><span style=\"color: green;font-size: 18px;\"><strong>无甜蜜素 无胭脂红 无山梨酸钾 无苯甲酸钠的宝宝山楂条</strong></span><br /><br /><br />宝宝不爱吃蔬菜水果怎么办？<br />宝宝山楂条，添加胡萝卜和苹果，为妈妈分忧解难。<br />富含膳食纤维，可放心食用。<br />用心挑选产地，来自山东淄博的山楂，个头大、肉质紧密。山楂味酸稍甜，添加了胡萝卜和苹果口味更加。<br />开袋即食。<br /><br /><br />还能自制山楂酱哦。<br />将200g的山楂条和150毫升的水放进全食物调理机容杯中，开机步骤123，过程中用搅拌棒协助，操作1分钟后关机321，即可。做好的山楂酱可以涂面包吃也可以用作糕点点缀。<br /><br /><br />山楂有很高的营养价值和医疗价值，老年人常吃山楂制品能增强食欲，改善睡眠，保持骨骼和血液中钙的恒定，预防动脉粥样硬化，因此山楂被视为“长寿食品”。<br /><br /><br />山楂含有大量的维生素C与微量元素，能够扩张血管，降低血压，降低血糖，能够改善和促进胆固醇排泄而降低血脂，预防高血脂的发生，山楂能够开胃促进消化，山楂所含有的脂肪酶也能够促进脂肪的消化。山楂所含有的黄酮类与维生素c、胡萝卜素等物质能够阻断并减少自由基的生成，可增强机体的免疫力，延缓衰老，防癌抗癌。山楂能够活血化瘀，帮助消除瘀血状态，辅助治疗跌打损伤。山楂对子宫有收缩作用，在孕妇临产时有催生效果。<br /><br /><br />常食山楂能够扩张血管、降低血糖、降低血压，防治心血管疾病和老年性心脏病。利用山楂果实治疗疾病，在中国已有悠久的历史。《唐本草》记：汁服用止水痢；《本草纲目》记：山楂化饮食，消肉滞等。凡脾胃虚弱，食物不消化，胸腹酸刺胀闷者，于膳后吃两三枚绝佳。中医认为，山楂更具有生津止渴，活血化瘀等功能。而且近代药物理化研究发现山楂的药用价值渗透到血液血脂领域更为明显。"
//         documentLocation = "#CharacterRangeLen=1&amp;CharacterRangeLoc=2021&amp;EndingColumnNumber=31&amp;EndingLineNumber=26&amp;StartingColumnNumber=1&amp;StartingLineNumber=26&amp;Timestamp=482653035.184489"

textView.text = text

let data = text.dataUsingEncoding(NSUnicodeStringEncoding)
var attributedString = try NSMutableAttributedString(data: data!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)

textView.attributedText = attributedString
print(textView.text)


let text2 = attributedString.string

let data2 = text2.dataUsingEncoding(NSUnicodeStringEncoding)
let attributedString2 = try NSAttributedString(data: data2!, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
textView.attributedText = attributedString2
//String(data: NSData(attributedString, encoding: NSStringEncoding.utf8))
//print(attributedString.string)
