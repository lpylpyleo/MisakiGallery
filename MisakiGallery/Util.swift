//
//  Util.swift
//  MisakiGallery
//
//  Created by Spike Liao on 2021/12/17.
//

import Foundation

func getCardUrl(
    imageType: ImageType,
    resourceId: String,
    awakened: Bool = false,
    framed: Bool = true
) -> String {
    var url = ""
    let suffix1 = awakened ? "_1" : "_0";
    let suffix2 = framed ? "_a" : "_b";
    
    switch (imageType) {
    case ImageType.card:
        url = cardUrl + resourceId + suffix1 + suffix2;
        break;
    case ImageType.cardBg:
        url = cardBgUrl + resourceId + suffix1;
        break;
    case ImageType.event:
        url = eventBgUrl + resourceId;
        break;
    case ImageType.icon:
        url = iconUrl + resourceId + suffix1;
        break;
    case ImageType.costume:
        url = costumeUrl + resourceId;
        break;
    }
    return url + ".png";
}

enum ImageType { case card, cardBg, event, icon, costume }

