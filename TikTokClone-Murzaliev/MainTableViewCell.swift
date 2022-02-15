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
    
    private lazy var desciptionLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 16, weight: .medium)
        view.numberOfLines = 0
        view.textColor = .white
        return view
    }()
    

    override func layoutSubviews() {
        
        setViews()
    }
    
    private func setViews() {
        
        addSubview(layoutScreen)
        layoutScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        layoutScreen.addSubview(videoImage)
        videoImage.contentMode = .scaleAspectFill
        videoImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        layoutScreen.addSubview(desciptionLabel)
        desciptionLabel.text =
"""
@jasonstubs


#lovenature     #savenature

#greenpolicy    #saveplanet

"""
        desciptionLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-80)
            make.left.equalToSuperview().offset(20)
            make.height.equalTo(200)
            make.width.equalTo(layoutScreen.frame.width - 80)
        }
        
        
        //MARK: - Добавление кнопок на экраны
        
        let profileButton = UIImageView(image: UIImage(systemName: "person.crop.circle"))
        let likesButton = UIImageView(image: UIImage(systemName: "heart"))
        let commentsButton = UIImageView(image: UIImage(systemName: "message"))
        let shareButton = UIImageView(image: UIImage(systemName: "arrowshape.turn.up.forward.fills"))


        
        layoutScreen.addSubview(shareButton)
        shareButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalToSuperview().offset(-100)
            make.right.equalToSuperview().offset(-10)
        }
        
        layoutScreen.addSubview(commentsButton)
        commentsButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalTo(shareButton.snp.top).offset(-25)
            make.right.equalToSuperview().offset(-10)
        }
        
        layoutScreen.addSubview(likesButton)
        likesButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalTo(commentsButton.snp.top).offset(-25)
            make.right.equalToSuperview().offset(-10)
        }
        
        layoutScreen.addSubview(profileButton)
        profileButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
            make.bottom.equalTo(likesButton.snp.top).offset(-25)
            make.right.equalToSuperview().offset(-10)
        }
        
        
    }
    
    //MARK: - Фнукция заполнения данных с помощью модели
    
    func fill(model: CellModel) {
        videoImage.image = UIImage(named: model.image)
      }

}
