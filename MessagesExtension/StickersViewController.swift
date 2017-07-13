//
//  StickersViewController.swift
//  MyMessageStickers
//
//  Created by Jeff Ripke on 7/13/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation
import Messages

class StickersViewController: MSStickerBrowserViewController {

    var stickers = [MSSticker]()
    let stickerNames = ["yes", "house", "sun", "car"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateStickers()
    }
    
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView, stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
    
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    
    private func populateStickers() {
        for stickerName in stickerNames {
            let path = Bundle.main.url(forResource: stickerName, withExtension: "png")
            let sticker = try! MSSticker(contentsOfFileURL: path!, localizedDescription: stickerName)
            stickers.append(sticker)
        }
        stickerBrowserView.reloadData()
    }
}
