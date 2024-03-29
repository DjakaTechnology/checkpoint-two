//
//  FlashModel.swift
//
//  Created by Djaka Pradana on 28/06/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class FlashModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let banners = "banners"
    static let status = "status"
  }

  // MARK: Properties
  public var banners: [Banners]?
  public var status: String?

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
    if let items = json[SerializationKeys.banners].array { banners = items.map { Banners(json: $0) } }
    status = json[SerializationKeys.status].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = banners { dictionary[SerializationKeys.banners] = value.map { $0.dictionaryRepresentation() } }
    if let value = status { dictionary[SerializationKeys.status] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.banners = aDecoder.decodeObject(forKey: SerializationKeys.banners) as? [Banners]
    self.status = aDecoder.decodeObject(forKey: SerializationKeys.status) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(banners, forKey: SerializationKeys.banners)
    aCoder.encode(status, forKey: SerializationKeys.status)
  }

}
