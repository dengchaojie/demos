import UIKit
import Foundation

//let img = UIImage.init(named: "ios60")
//print(img!.size.width)

enum AccountType {
    case chuJi
    case zhongJi
    case gaoJi
}

/// tuple
final class InteractiveUserImageController: UIView {
    var displayOptions = (
    bigLikeButton: true,
    alternativeBackgroundColor: true,
    isPremium: true,
    defaultUserName: "dcj"
    )
 
}

let user = InteractiveUserImageController.init()
user.displayOptions.alternativeBackgroundColor = false

/// 简化
class UserFollowComponet {
    var displayOptions = (
        likeButton: (
            bigButton: true,
            alternativeBackgroundColor: true
        ),
        imageView: (
            highlighLineWidth: 2.0,
            defaultColor: "#222222"
        )
    )
    
}
let follow = UserFollowComponet.init()
follow.displayOptions.likeButton.bigButton = false

/// struct
//final class InteractiveUserImageController: UIView {
//    struct DisplayOptions {
//        var bigLikeButton: Bool
//        var alternativeBackgroundColor: Bool
//        var isPremium: Bool
//
//
//    }
//
//    struct UserOptions {
//        var accountType: AccountType
//        var userName: String
//        var profileImage: UIImage
//    }
//
//    struct State {
//        var isHighlighted: Bool
//        var canLike: Bool
//        var canFollow: Bool
//    }
//    var displayOpt = DisplayOptions.init(bigLikeButton: true, alternativeBackgroundColor: true, isPremium: true)
//    var userOpt = UserOptions.init(accountType: AccountType.chuJi, userName: "dcj", profileImage: UIImage.init(named: "ios60")!)
//    var sta = State.init(isHighlighted: true, canLike: true, canFollow: true)
//
//
//
//
//}
