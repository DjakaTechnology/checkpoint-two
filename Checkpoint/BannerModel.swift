//
//  Banners.swift
//
//  Created by Djaka Pradana on 28/06/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class FlashModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let info = "info"
    static let image = "image"
    static let descriptionValue = "description"
  }

  // MARK: Properties
  public var info: Info?
  public var image: String?
  public var descriptionValue: String?

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
    info = Info(json: json[SerializationKeys.info])
    image = json[SerializationKeys.image].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = info { dictionary[SerializationKeys.info] = value.dictionaryRepresentation() }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.info = aDecoder.decodeObject(forKey: SerializationKeys.info) as? Info
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(info, forKey: SerializationKeys.info)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
  }

}
