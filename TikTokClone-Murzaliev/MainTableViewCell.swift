//
//  MainTableViewCell.swift
//  TikTokClone-Murzaliev
//
//  Created by Samat Murzaliev on 15.02.2022.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    private var layoutScreen = UIView()
    
    var videoImage = UIImageView()
    

    override func layoutSubviews() {
        
        setViews()
    }
    
    private func setViews() {
        
        addSubview(layoutScreen)
        layoutScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        layoutScreen.addSubview(videoImage)
        videoImage.contentMode = .scaleAspectFit
        videoImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold, scale: .large)
        
        let imageProfile = UIImage(systemName: "person.crop.circle", withConfiguration: largeConfig)
        let imageLikes = UIImage(systemName: "heart", withConfiguration: largeConfig)
        let imageMessage = UIImage(systemName: "message", withConfiguration: largeConfig)
        let imageShare = UIImage(systemName: "arrowshape.turn.up.forward.fill", withConfiguration: largeConfig)
        
        let profileButton = UIButton(type: .system)
        profileButton.setImage(imageProfile, for: .normal)
        
        let likesButton = UIButton(type: .system)
        likesButton.setImage(imageLikes, for: .normal)
        
        let commentsButton = UIButton(type: .system)
        commentsButton.setImage(imageMessage, for: .normal)
        
        let shareButton = UIButton(type: .system)
        shareButton.setImage(imageShare, for: .normal)
        
        layoutScreen.addSubview(shareButton)
        shareButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.bottom.equalToSuperview().offset(-40)
            make.right.equalToSuperview().offset(-10)
        }
        
        layoutScreen.addSubview(commentsButton)
        commentsButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.bottom.equalTo(shareButton.snp.top).offset(-8)
            make.right.equalToSuperview().offset(-10)
        }
        
        layoutScreen.addSubview(likesButton)
        likesButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.bottom.equalTo(commentsButton.snp.top).offset(8)
            make.right.equalToSuperview().offset(-10)
        }
        
        layoutScreen.addSubview(profileButton)
        profileButton.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(60)
            make.bottom.equalTo(likesButton.snp.top).offset(8)
            make.right.equalToSuperview().offset(-10)
        }
        
        
    }
    
    func fill(model: CellModel) {
        videoImage.image = UIImage(named: model.image)
         
      }

}
