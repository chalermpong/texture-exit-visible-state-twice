//
//  MyASTableVC.swift
//  TextureDidExitVisibleStateTwice
//
//  Created by Chalermpong Satayavibul on 24/4/2563 BE.
//  Copyright © 2563 chalermpong. All rights reserved.
//

import Foundation
import AsyncDisplayKit

public class MyASTableVC: ASViewController<ASTableNode> {

    
    init() {
        super.init(node: ASTableNode())
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        node.allowsSelection = false
        node.dataSource = self
        node.delegate = self
        node.allowsSelection = true
        node.leadingScreensForBatching = 2.5
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("DEBUG: viewDidAppear \(self)")
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DEBUG: viewWillDisappear \(self)")
    }
}

extension MyASTableVC: ASTableDataSource {
    public func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    public func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            MyCell()
        }
    }
}

extension MyASTableVC: ASTableDelegate {
    public func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        let vc = UIViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

class MyCell: ASCellNode {
    let label = ASTextNode()
    let textnode = ASTextNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .white
        label.attributedText = NSAttributedString(string: "Click here to open another screen")
        textnode.attributedText = NSAttributedString(string: "Cell: \(self)")
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 5,
            justifyContent: .center,
            alignItems: .stretch,
            children: [label, textnode]
        )
        stack.style.preferredSize = CGSize(width: 100, height: 1000)
        return stack
    }
    
    override func didEnterVisibleState() {
        super.didEnterVisibleState()
        print("DEBUG: didEnterVisibleState \(self)")
    }
    
    override func didExitVisibleState() {
        super.didExitVisibleState()
        print("DEBUG: didExitVisibleState \(self)")
    }
}

