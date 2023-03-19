//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 7 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `GreenShrek`.
    static let greenShrek = Rswift.ColorResource(bundle: R.hostingBundle, name: "GreenShrek")
    /// Color `HeaderTableView`.
    static let headerTableView = Rswift.ColorResource(bundle: R.hostingBundle, name: "HeaderTableView")
    /// Color `MainMenuAccessoriesButton`.
    static let mainMenuAccessoriesButton = Rswift.ColorResource(bundle: R.hostingBundle, name: "MainMenuAccessoriesButton")
    /// Color `MainMenuCoffeeButton`.
    static let mainMenuCoffeeButton = Rswift.ColorResource(bundle: R.hostingBundle, name: "MainMenuCoffeeButton")
    /// Color `MainMenuMachinesButton`.
    static let mainMenuMachinesButton = Rswift.ColorResource(bundle: R.hostingBundle, name: "MainMenuMachinesButton")
    /// Color `MaybeWhite`.
    static let maybeWhite = Rswift.ColorResource(bundle: R.hostingBundle, name: "MaybeWhite")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "GreenShrek", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func greenShrek(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.greenShrek, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "HeaderTableView", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func headerTableView(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.headerTableView, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "MainMenuAccessoriesButton", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func mainMenuAccessoriesButton(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.mainMenuAccessoriesButton, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "MainMenuCoffeeButton", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func mainMenuCoffeeButton(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.mainMenuCoffeeButton, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "MainMenuMachinesButton", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func mainMenuMachinesButton(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.mainMenuMachinesButton, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "MaybeWhite", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func maybeWhite(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.maybeWhite, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 11 files.
  struct file {
    /// Resource file `LICENSE.txt`.
    static let licenseTxt = Rswift.FileResource(bundle: R.hostingBundle, name: "LICENSE", pathExtension: "txt")
    /// Resource file `OpenSans-Bold.ttf`.
    static let openSansBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-Bold", pathExtension: "ttf")
    /// Resource file `OpenSans-BoldItalic.ttf`.
    static let openSansBoldItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-BoldItalic", pathExtension: "ttf")
    /// Resource file `OpenSans-ExtraBold.ttf`.
    static let openSansExtraBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-ExtraBold", pathExtension: "ttf")
    /// Resource file `OpenSans-ExtraBoldItalic.ttf`.
    static let openSansExtraBoldItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-ExtraBoldItalic", pathExtension: "ttf")
    /// Resource file `OpenSans-Italic.ttf`.
    static let openSansItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-Italic", pathExtension: "ttf")
    /// Resource file `OpenSans-Light.ttf`.
    static let openSansLightTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-Light", pathExtension: "ttf")
    /// Resource file `OpenSans-LightItalic.ttf`.
    static let openSansLightItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-LightItalic", pathExtension: "ttf")
    /// Resource file `OpenSans-Regular.ttf`.
    static let openSansRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-Regular", pathExtension: "ttf")
    /// Resource file `OpenSans-SemiBold.ttf`.
    static let openSansSemiBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-SemiBold", pathExtension: "ttf")
    /// Resource file `OpenSans-SemiBoldItalic.ttf`.
    static let openSansSemiBoldItalicTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "OpenSans-SemiBoldItalic", pathExtension: "ttf")

    /// `bundle.url(forResource: "LICENSE", withExtension: "txt")`
    static func licenseTxt(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.licenseTxt
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-Bold", withExtension: "ttf")`
    static func openSansBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-BoldItalic", withExtension: "ttf")`
    static func openSansBoldItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansBoldItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-ExtraBold", withExtension: "ttf")`
    static func openSansExtraBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansExtraBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-ExtraBoldItalic", withExtension: "ttf")`
    static func openSansExtraBoldItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansExtraBoldItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-Italic", withExtension: "ttf")`
    static func openSansItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-Light", withExtension: "ttf")`
    static func openSansLightTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansLightTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-LightItalic", withExtension: "ttf")`
    static func openSansLightItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansLightItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-Regular", withExtension: "ttf")`
    static func openSansRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-SemiBold", withExtension: "ttf")`
    static func openSansSemiBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansSemiBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "OpenSans-SemiBoldItalic", withExtension: "ttf")`
    static func openSansSemiBoldItalicTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.openSansSemiBoldItalicTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 10 fonts.
  struct font: Rswift.Validatable {
    /// Font `OpenSans-BoldItalic`.
    static let openSansBoldItalic = Rswift.FontResource(fontName: "OpenSans-BoldItalic")
    /// Font `OpenSans-Bold`.
    static let openSansBold = Rswift.FontResource(fontName: "OpenSans-Bold")
    /// Font `OpenSans-ExtraBold`.
    static let openSansExtraBold = Rswift.FontResource(fontName: "OpenSans-ExtraBold")
    /// Font `OpenSans-LightItalic`.
    static let openSansLightItalic = Rswift.FontResource(fontName: "OpenSans-LightItalic")
    /// Font `OpenSans-Light`.
    static let openSansLight = Rswift.FontResource(fontName: "OpenSans-Light")
    /// Font `OpenSans-Regular`.
    static let openSansRegular = Rswift.FontResource(fontName: "OpenSans-Regular")
    /// Font `OpenSans-SemiBoldItalic`.
    static let openSansSemiBoldItalic = Rswift.FontResource(fontName: "OpenSans-SemiBoldItalic")
    /// Font `OpenSans-SemiBold`.
    static let openSansSemiBold = Rswift.FontResource(fontName: "OpenSans-SemiBold")

    /// `UIFont(name: "OpenSans-Bold", size: ...)`
    static func openSansBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansBold, size: size)
    }

    /// `UIFont(name: "OpenSans-BoldItalic", size: ...)`
    static func openSansBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansBoldItalic, size: size)
    }

    /// `UIFont(name: "OpenSans-ExtraBold", size: ...)`
    static func openSansExtraBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansExtraBold, size: size)
    }

    /// `UIFont(name: "OpenSans-Light", size: ...)`
    static func openSansLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansLight, size: size)
    }

    /// `UIFont(name: "OpenSans-LightItalic", size: ...)`
    static func openSansLightItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansLightItalic, size: size)
    }

    /// `UIFont(name: "OpenSans-Regular", size: ...)`
    static func openSansRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansRegular, size: size)
    }

    /// `UIFont(name: "OpenSans-SemiBold", size: ...)`
    static func openSansSemiBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansSemiBold, size: size)
    }

    /// `UIFont(name: "OpenSans-SemiBoldItalic", size: ...)`
    static func openSansSemiBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: openSansSemiBoldItalic, size: size)
    }

    static func validate() throws {
      if R.font.openSansBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-Bold' could not be loaded, is 'OpenSans-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-BoldItalic' could not be loaded, is 'OpenSans-BoldItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansExtraBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-ExtraBold' could not be loaded, is 'OpenSans-ExtraBold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-Light' could not be loaded, is 'OpenSans-Light.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansLightItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-LightItalic' could not be loaded, is 'OpenSans-LightItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-Regular' could not be loaded, is 'OpenSans-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansSemiBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-SemiBold' could not be loaded, is 'OpenSans-SemiBold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.openSansSemiBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'OpenSans-SemiBoldItalic' could not be loaded, is 'OpenSans-SemiBoldItalic.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `loader`.
    static let loader = Rswift.ImageResource(bundle: R.hostingBundle, name: "loader")
    /// Image `maquina-inicio`.
    static let maquinaInicio = Rswift.ImageResource(bundle: R.hostingBundle, name: "maquina-inicio")
    /// Image `xicaras-inicio`.
    static let xicarasInicio = Rswift.ImageResource(bundle: R.hostingBundle, name: "xicaras-inicio")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "loader", bundle: ..., traitCollection: ...)`
    static func loader(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.loader, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "maquina-inicio", bundle: ..., traitCollection: ...)`
    static func maquinaInicio(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.maquinaInicio, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "xicaras-inicio", bundle: ..., traitCollection: ...)`
    static func xicarasInicio(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.xicarasInicio, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 19 localization keys.
    struct localizable {
      /// Value: %@ Capsulas,
      static let coffeeDetailCapsules = Rswift.StringResource(key: "CoffeeDetail.capsules", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Acessórios
      static let accessoriesTitle = Rswift.StringResource(key: "Accessories.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Acessórios
      static let mainMenuAccessoriesButtonTitle = Rswift.StringResource(key: "MainMenuAccessoriesButton.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Adicionar à sacola
      static let addToBag = Rswift.StringResource(key: "AddToBag", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Cafés
      static let coffee = Rswift.StringResource(key: "Coffee", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Continuar
      static let `continue` = Rswift.StringResource(key: "Continue", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Cremosos, espumosos, hmm
      static let mainMenuCoffeeButtonSubtitle = Rswift.StringResource(key: "MainMenuCoffeeButton.subtitle", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Intensidade %@
      static let coffeTableViewCellIntensity = Rswift.StringResource(key: "CoffeTableViewCell.intensity", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Intensidade: %@
      static let coffeeDetailIntensity = Rswift.StringResource(key: "CoffeeDetail.intensity", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Máquinas
      static let machines = Rswift.StringResource(key: "Machines", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Máquinas
      static let mainMenuMachinesButtonTitle = Rswift.StringResource(key: "MainMenuMachinesButton.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Nenhum item favoritado :(
      static let favoritesNothing = Rswift.StringResource(key: "Favorites.nothing", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Oba!
      static let oba = Rswift.StringResource(key: "Oba", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Origem
      static let coffeeDetailOrigin = Rswift.StringResource(key: "CoffeeDetail.origin", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Para completar a balaca
      static let mainMenuAccessoriesButtonSubtitle = Rswift.StringResource(key: "MainMenuAccessoriesButton.subtitle", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Perfil Aromático
      static let coffeeDetailPerfil = Rswift.StringResource(key: "CoffeeDetail.perfil", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Produto adicionado a sacola!
      static let alertViewMessage = Rswift.StringResource(key: "AlertViewMessage", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Sem elas não rola café
      static let mainMenuMachinesButtonSubtitle = Rswift.StringResource(key: "MainMenuMachinesButton.subtitle", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Torrefação
      static let coffeeDetailRoasting = Rswift.StringResource(key: "CoffeeDetail.roasting", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: %@ Capsulas,
      static func coffeeDetailCapsules(_ value1: String, preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          let format = NSLocalizedString("CoffeeDetail.capsules", bundle: hostingBundle, comment: "")
          return String(format: format, locale: applicationLocale, value1)
        }

        guard let (locale, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "CoffeeDetail.capsules"
        }

        let format = NSLocalizedString("CoffeeDetail.capsules", bundle: bundle, comment: "")
        return String(format: format, locale: locale, value1)
      }

      /// Value: Acessórios
      static func accessoriesTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Accessories.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Accessories.title"
        }

        return NSLocalizedString("Accessories.title", bundle: bundle, comment: "")
      }

      /// Value: Acessórios
      static func mainMenuAccessoriesButtonTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("MainMenuAccessoriesButton.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "MainMenuAccessoriesButton.title"
        }

        return NSLocalizedString("MainMenuAccessoriesButton.title", bundle: bundle, comment: "")
      }

      /// Value: Adicionar à sacola
      static func addToBag(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("AddToBag", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "AddToBag"
        }

        return NSLocalizedString("AddToBag", bundle: bundle, comment: "")
      }

      /// Value: Cafés
      static func coffee(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Coffee", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Coffee"
        }

        return NSLocalizedString("Coffee", bundle: bundle, comment: "")
      }

      /// Value: Continuar
      static func `continue`(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Continue", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Continue"
        }

        return NSLocalizedString("Continue", bundle: bundle, comment: "")
      }

      /// Value: Cremosos, espumosos, hmm
      static func mainMenuCoffeeButtonSubtitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("MainMenuCoffeeButton.subtitle", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "MainMenuCoffeeButton.subtitle"
        }

        return NSLocalizedString("MainMenuCoffeeButton.subtitle", bundle: bundle, comment: "")
      }

      /// Value: Intensidade %@
      static func coffeTableViewCellIntensity(_ value1: String, preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          let format = NSLocalizedString("CoffeTableViewCell.intensity", bundle: hostingBundle, comment: "")
          return String(format: format, locale: applicationLocale, value1)
        }

        guard let (locale, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "CoffeTableViewCell.intensity"
        }

        let format = NSLocalizedString("CoffeTableViewCell.intensity", bundle: bundle, comment: "")
        return String(format: format, locale: locale, value1)
      }

      /// Value: Intensidade: %@
      static func coffeeDetailIntensity(_ value1: String, preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          let format = NSLocalizedString("CoffeeDetail.intensity", bundle: hostingBundle, comment: "")
          return String(format: format, locale: applicationLocale, value1)
        }

        guard let (locale, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "CoffeeDetail.intensity"
        }

        let format = NSLocalizedString("CoffeeDetail.intensity", bundle: bundle, comment: "")
        return String(format: format, locale: locale, value1)
      }

      /// Value: Máquinas
      static func machines(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Machines", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Machines"
        }

        return NSLocalizedString("Machines", bundle: bundle, comment: "")
      }

      /// Value: Máquinas
      static func mainMenuMachinesButtonTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("MainMenuMachinesButton.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "MainMenuMachinesButton.title"
        }

        return NSLocalizedString("MainMenuMachinesButton.title", bundle: bundle, comment: "")
      }

      /// Value: Nenhum item favoritado :(
      static func favoritesNothing(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Favorites.nothing", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Favorites.nothing"
        }

        return NSLocalizedString("Favorites.nothing", bundle: bundle, comment: "")
      }

      /// Value: Oba!
      static func oba(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Oba", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Oba"
        }

        return NSLocalizedString("Oba", bundle: bundle, comment: "")
      }

      /// Value: Origem
      static func coffeeDetailOrigin(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("CoffeeDetail.origin", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "CoffeeDetail.origin"
        }

        return NSLocalizedString("CoffeeDetail.origin", bundle: bundle, comment: "")
      }

      /// Value: Para completar a balaca
      static func mainMenuAccessoriesButtonSubtitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("MainMenuAccessoriesButton.subtitle", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "MainMenuAccessoriesButton.subtitle"
        }

        return NSLocalizedString("MainMenuAccessoriesButton.subtitle", bundle: bundle, comment: "")
      }

      /// Value: Perfil Aromático
      static func coffeeDetailPerfil(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("CoffeeDetail.perfil", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "CoffeeDetail.perfil"
        }

        return NSLocalizedString("CoffeeDetail.perfil", bundle: bundle, comment: "")
      }

      /// Value: Produto adicionado a sacola!
      static func alertViewMessage(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("AlertViewMessage", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "AlertViewMessage"
        }

        return NSLocalizedString("AlertViewMessage", bundle: bundle, comment: "")
      }

      /// Value: Sem elas não rola café
      static func mainMenuMachinesButtonSubtitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("MainMenuMachinesButton.subtitle", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "MainMenuMachinesButton.subtitle"
        }

        return NSLocalizedString("MainMenuMachinesButton.subtitle", bundle: bundle, comment: "")
      }

      /// Value: Torrefação
      static func coffeeDetailRoasting(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("CoffeeDetail.roasting", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "CoffeeDetail.roasting"
        }

        return NSLocalizedString("CoffeeDetail.roasting", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
