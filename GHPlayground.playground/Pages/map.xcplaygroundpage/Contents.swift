//: [Previous](@previous)

import UIKit

var fa2 = [[1,2],[3],[4,5,6]]

var fa2m = fa2.flatMap({$0})
print(fa2m)

class ListItem {
    var icon: UIImage?
    var title: String = ""
    var url: NSURL!
    
    
    static func listItemsFromJSONData(jsonData: NSData?) -> [ListItem] {
        guard let nonNilJsonData = jsonData,
            let json = try? NSJSONSerialization.JSONObjectWithData(nonNilJsonData, options: []),
            let jsonItems = json as? Array<NSDictionary>
            else {
                // 倘若JSON序列化失败，或者转换类型失败
                // 返回一个空数组结果
                return []
        }
        
        return jsonItems.flatMap({ (itemDesc: NSDictionary) -> ListItem? in
            
            let item = ListItem()
            if let icon = itemDesc["icon"] as? String {
                item.icon = UIImage(named: icon)
            }
            if let title = itemDesc["title"] as? String {
                item.title = title
            }
            if let urlString = itemDesc["url"] as? String, let url = NSURL(string: urlString) {
                item.url = url
            }
            
            var icon: UIImage?
            let iconName = itemDesc["icon"] as? String
            
            // 三种写法
            //            item = iconName.flatMap(UIImage.init)
            
            icon = iconName.flatMap{ UIImage(named: $0) }
            
            //            item = iconName.flatMap({ imageName in
            //                UIImage(named: imageName)
            //            })

            
            return item
        })
        
        return jsonItems.map({ (itemDesc: NSDictionary) -> ListItem in
            let item = ListItem()
            if let icon = itemDesc["icon"] as? String {
                item.icon = UIImage(named: icon)
            }
            if let title = itemDesc["title"] as? String {
                item.title = title
            }
            if let urlString = itemDesc["url"] as? String, let url = NSURL(string: urlString) {
                item.url = url
            }
            return item
        })
        
        
        
        var items = [ListItem]()
        for itemDesc in jsonItems {
            let item = ListItem()
            if let icon = itemDesc["icon"] as? String {
                item.icon = UIImage(named: icon)
            }
            if let title = itemDesc["title"] as? String {
                item.title = title
            }
            if let urlString = itemDesc["url"] as? String, let url = NSURL(string: urlString) {
                item.url = url
            }
            items.append(item)
        }
        return items
    }
}
