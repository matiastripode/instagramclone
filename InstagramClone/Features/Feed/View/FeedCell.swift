//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Carlos Matias Tripode on 5/14/21.
//

import UIKit

class FeedCell: UICollectionViewCell {
    // MARK  - Properties
    static let identifier = "FeedCell"
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("vernom", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self,
                         action: #selector(didTapUsername),
                         for: .touchUpInside)
        return button
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like_unselected"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send2"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "1 like"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Some caption text for now ..."
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
   
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    // MARK - Lifecycle
    override init(frame: CGRect ) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - Configure
    private func setupViews() {
        backgroundColor = .white
        
        setupProfileView()
        setupPostImageView()
        setupButtons()
        setupLabels()
    }
    
    func setupProfileView() {
        // profile image
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor,
                                left: leftAnchor,
                                paddingTop: 12,
                                paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40/2
        
        // username button
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView,
                               leftAnchor: profileImageView.rightAnchor,
                               paddingLeft: 8)
    }
    
    func setupPostImageView() {
        // postImageView
        addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor,
                             left: leftAnchor,
                             right: rightAnchor,
                             paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor,
                                              multiplier: 1).isActive = true
    }
    
    func setupButtons() {
        addSubview(stackView)
        
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(commentButton)
        stackView.addArrangedSubview(shareButton)
        stackView.anchor(top: postImageView.bottomAnchor,
                         width: 120,
                         height: 40)
        // --> with anchors <---
//        addSubview(likeButton)
//        addSubview(commentButton)
//        addSubview(shareButton)
//
//        likeButton.anchor(top: postImageView.bottomAnchor,
//                          left: leftAnchor,
//                          paddingTop: 8,
//                          paddingLeft: 8)
//
//        commentButton.anchor(top: postImageView.bottomAnchor,
//                             left: likeButton.rightAnchor,
//                          paddingTop: 8,
//                          paddingLeft: 8)
//
//        shareButton.anchor(top: postImageView.bottomAnchor,
//                           left: commentButton.rightAnchor,
//                          paddingTop: 8,
//                          paddingLeft: 8)
        
    }
    
    func setupLabels() {
        addSubview(likesLabel)
        addSubview(captionLabel)
        addSubview(postTimeLabel)
        
        likesLabel.anchor(top: likeButton.bottomAnchor,
                          left: leftAnchor,
                          paddingTop: 8,
                          paddingLeft: 8)
       
        captionLabel.anchor(top: likesLabel.bottomAnchor,
                          left: leftAnchor,
                          paddingTop: 8,
                          paddingLeft: 8)
        
        postTimeLabel.anchor(top: captionLabel.bottomAnchor,
                          left: leftAnchor,
                          paddingTop: 8,
                          paddingLeft: 8)
    }
    
    // MARK - Handle events
    func configure(feed: FeedModel) {
        
    }
    @objc func didTapUsername()  {
        print("username tapped")
    }
}
