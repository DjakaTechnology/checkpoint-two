//
//  Categories.swift
//
//  Created by Djaka Pradana on 27/06/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CategoriesModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let id = "id"
    static let revamped = "revamped"
    static let url = "url"
    static let children = "children"
  }

  // MARK: Properties
  public var name: String?
  public var id: Int?
  public var revamped: Bool? = false
  public var url: String?
  public var children: [Children]?

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
    name = json[SerializationKeys.name].string
    id = json[SerializationKeys.id].int
    revamped = json[SerializationKeys.revamped].boolValue
    url = json[SerializationKeys.url].string
    if let items = json[SerializationKeys.children].array { children = items.map { Children(json: $0) } }
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    dictionary[SerializationKeys.revamped] = revamped
    if let value = url { dictionary[SerializationKeys.url] = value }
    if let value = children { dictionary[SerializationKeys.children] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.revamped = aDecoder.decodeBool(forKey: SerializationKeys.revamped)
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
    self.children = aDecoder.decodeObject(forKey: SerializationKeys.children) as? [Children]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(revamped, forKey: SerializationKeys.revamped)
    aCoder.encode(url, forKey: SerializationKeys.url)
    aCoder.encode(children, forKey: SerializationKeys.children)
  }

}
