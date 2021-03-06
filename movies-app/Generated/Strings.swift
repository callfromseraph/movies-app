// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// 18+
  internal static let adult = L10n.tr("Localizable", "adult")
  /// e1e23a5bd892bf9b19b7f9f402bed470
  internal static let apiKey = L10n.tr("Localizable", "api_key")
  /// https://image.tmdb.org/t/p/w500
  internal static let baseURLForImages = L10n.tr("Localizable", "base_URL_for_images")
  /// 0+
  internal static let notAdult = L10n.tr("Localizable", "not_adult")

  internal enum Module {
    /// MovieDetails
    internal static let movieDetails = L10n.tr("Localizable", "module.movie_details")
    /// Movies
    internal static let movies = L10n.tr("Localizable", "module.movies")
    /// Search
    internal static let search = L10n.tr("Localizable", "module.search")
  }

  internal enum MovieDetails {
    /// Cast
    internal static let cast = L10n.tr("Localizable", "movie_details.cast")
    /// Info
    internal static let info = L10n.tr("Localizable", "movie_details.info")
    /// Review
    internal static let review = L10n.tr("Localizable", "movie_details.review")
    /// MovieDetails
    internal static let storyboardName = L10n.tr("Localizable", "movie_details.storyboard_name")
    internal enum Cast {
      /// Cast
      internal static let storyboardId = L10n.tr("Localizable", "movie_details.cast.storyboard_id")
    }
    internal enum Info {
      /// Info
      internal static let storyboardId = L10n.tr("Localizable", "movie_details.info.storyboard_id")
    }
    internal enum Review {
      /// Review
      internal static let storyboardId = L10n.tr("Localizable", "movie_details.review.storyboard_id")
    }
  }

  internal enum Movies {
    /// MoviesList
    internal static let storyboardName = L10n.tr("Localizable", "movies.storyboard_name")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
