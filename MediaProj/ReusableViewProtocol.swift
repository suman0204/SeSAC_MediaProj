//
//  ReusableViewProtocol.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/21.
//

import UIKit
protocol ReusableViewProtocol {
    static var identifier: String { get }
}

//extension UIViewController: ReusableViewProtocol {
//    static var identifier: String {
//        return String(describing: self)
//    }
//
//
//}
//
//extension UITableViewCell: ReusableViewProtocol {
//    static var identifier: String {
//        return String(describing: self)
//    }
//
//}
extension UIViewController: ReusableViewProtocol { }
extension UITableViewCell: ReusableViewProtocol { }
//extension UICollectionViewCell: ReusableViewProtocol { }
extension UICollectionReusableView: ReusableViewProtocol { }

extension ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
