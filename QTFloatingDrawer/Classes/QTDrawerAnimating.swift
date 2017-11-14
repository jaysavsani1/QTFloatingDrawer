//
//  QTDrawerAnimating.swift
//  FBSnapshotTestCase
//
//  Created by Quixom Technology on 13/11/17.
//

//import Foundation

import UIKit

public protocol QTDrawerAnimating {
    
    func openDrawer(_ side: QTDrawerSide, drawerView: UIView, centerView: UIView, animated: Bool, complete: @escaping (Bool) -> Void)
    
    func dismissDrawer(_ side: QTDrawerSide, drawerView: UIView, centerView: UIView, animated: Bool, complete: @escaping (Bool) -> Void)
    
    
    /**
     *  Called prior to a rotation event, while a drawer view is being shown.
     *
     *  @param side The currently open drawer side
     *  @param the containing side view that is shown.
     *  @param the containing centre view.
     */
    func willRotateWithDrawerOpen(_ side: QTDrawerSide, drawerView: UIView, centerView: UIView)
    
    /**
     *  Called following a rotation event, while a drawer view is being shown.
     *
     *  @param side The currently open drawer side
     *  @param the containing side view that is shown.
     *  @param the containing centre view.
     *  @param a complete block handler to handle cleanup.
     */
    func didRotateWithDrawerOpen(_ side: QTDrawerSide, drawerView: UIView, centerView: UIView)
}
