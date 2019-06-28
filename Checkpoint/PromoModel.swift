//
//  PromoBanners.swift
//
//  Created by Djaka Pradana on 27/06/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class PromoModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let descriptionValue = "description"
    static let campaignId = "campaign_id"
    static let promoDue = "promo_due"
    static let url = "url"
    static let image = "image"
  }

  // MARK: Properties
  public var descriptionValue: String?
  public var campaignId: Int?
  public var promoDue: String?
  public var url: String?
  public var image: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    descriptionValue = json[SerializationKeys.descriptionValue].string
    campaignId = json[SerializationKeys.campaignId].int
    promoDue = json[SerializationKeys.promoDue].string
    url = json[SerializationKeys.url].string
    image = json[SerializationKeys.image].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = campaignId { dictionary[SerializationKeys.campaignId] = value }
    if let value = promoDue { dictionary[SerializationKeys.promoDue] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    if let value = image { dictionary[SerializationKeys.image] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.campaignId = aDecoder.decodeObject(forKey: SerializationKeys.campaignId) as? Int
    self.promoDue = aDecoder.decodeObject(forKey: SerializationKeys.promoDue) as? String
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(campaignId, forKey: SerializationKeys.campaignId)
    aCoder.encode(promoDue, forKey: SerializationKeys.promoDue)
    aCoder.encode(url, forKey: SerializationKeys.url)
    aCoder.encode(image, forKey: SerializationKeys.image)
  }

}
