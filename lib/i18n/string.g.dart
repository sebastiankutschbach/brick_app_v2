
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 46 (23.0 per locale)
 *
 * Built on 2022-04-18 at 16:52 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	de, // 'de'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringEn _t = _currLocale.translations;
_StringEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}

	/// Sets plural resolvers.
	/// See https://unicode-org.github.io/cldr-staging/charts/latest/supplemental/language_plural_rules.html
	/// See https://github.com/Tienisto/flutter-fast-i18n/blob/master/lib/src/model/pluralization_resolvers.dart
	/// Either specify [language], or [locale]. Locale has precedence.
	/// Rendered Resolvers: ['en', 'de']
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) {
		final List<AppLocale> locales;
		if (locale != null) {
			locales = [locale];
		} else {
			switch (language) {
				case 'en':
					locales = [AppLocale.en];
					break;
				case 'de':
					locales = [AppLocale.de];
					break;
				default:
					locales = [];
			}
		}
		locales.forEach((curr) {
			switch(curr) {
				case AppLocale.en:
					_translationsEn = _StringEn.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);
					break;
				case AppLocale.de:
					_translationsDe = _StringDe.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);
					break;
			}
		});
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringEn _translationsEn = _StringEn.build();
late _StringDe _translationsDe = _StringDe.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.de: return _translationsDe;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringEn build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) {
		switch (this) {
			case AppLocale.en: return _StringEn.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);
			case AppLocale.de: return _StringDe.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.de: return 'de';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.de: return const Locale.fromSubtags(languageCode: 'de');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'de': return AppLocale.de;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization resolvers

typedef PluralResolver = String Function(num n, {String? zero, String? one, String? two, String? few, String? many, String? other});

// prepared by fast_i18n

String _pluralCardinalEn(num n, {String? zero, String? one, String? two, String? few, String? many, String? other}) {
	if (n == 0) {
		return zero ?? other!;
	} else if (n == 1) {
		return one ?? other!;
	}
	return other!;
}

String _pluralCardinalDe(num n, {String? zero, String? one, String? two, String? few, String? many, String? other}) {
	if (n == 0) {
		return zero ?? other!;
	} else if (n == 1) {
		return one ?? other!;
	}
	return other!;
}

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringEn.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver;

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	final PluralResolver? _cardinalResolver;
	// ignore: unused_field
	final PluralResolver? _ordinalResolver;

	// ignore: unused_field
	late final _StringEn _root = this;

	// Translations
	String get home => 'Home';
	String errorLoadingSetList({required Object error}) => 'There was an error while loading your set lists:\n$error';
	String errorLoadingMocList({required Object error}) => 'There was an error while loading your moc list:\n$error';
	String noOfSets({required num count}) => (_root._cardinalResolver ?? _pluralCardinalEn)(count,
		zero: 'No sets',
		one: '$count set',
		other: '$count sets',
	);
	String noOfParts({required num count}) => (_root._cardinalResolver ?? _pluralCardinalEn)(count,
		zero: 'No parts',
		one: '$count part',
		other: '$count parts',
	);
	String get dismiss => 'Dismiss';
	String get toSettingsPage => 'Go to settings';
	String get errMsgMissingCredentials => 'You have not yet configured your rebrickable credentials. Please go to the settings page and enter them.';
	String get errMsgWrongCredentials => 'You have entered wrong rebrickable credentials. Please go to the settings page and enter the correct ones.';
	String get settings => 'Settings';
	String get username => 'Username';
	String get password => 'Password';
	String get apiKey => 'API Key';
	String get enterUsername => 'Enter username';
	String get enterPassword => 'Enter password';
	String get enterApiKey => 'Enter API key';
	String get close => 'Close';
	String get noMocsFound => 'No mocs found for this set';
	String get noSetsFound => 'This set list does not contain any sets';
}

// Path: <root>
class _StringDe implements _StringEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringDe.build({PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: _cardinalResolver = cardinalResolver,
		  _ordinalResolver = ordinalResolver;

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	final PluralResolver? _cardinalResolver;
	// ignore: unused_field
	final PluralResolver? _ordinalResolver;

	// ignore: unused_field
	@override late final _StringDe _root = this;

	// Translations
	@override String get home => 'Startseite';
	@override String errorLoadingSetList({required Object error}) => 'Es gab einen Fehler beim Laden deiner Set Listen:\n$error';
	@override String errorLoadingMocList({required Object error}) => 'Es gab einen Fehler beim Laden deiner Moc Liste:\n$error';
	@override String noOfSets({required num count}) => (_root._cardinalResolver ?? _pluralCardinalDe)(count,
		zero: 'keine Sets',
		one: '$count Set',
		other: '$count Sets',
	);
	@override String noOfParts({required num count}) => (_root._cardinalResolver ?? _pluralCardinalDe)(count,
		zero: 'keine Teile',
		one: '$count Teil',
		other: '$count Teile',
	);
	@override String get dismiss => 'Verwerfen';
	@override String get toSettingsPage => 'Zu den Einstellungen';
	@override String get errMsgMissingCredentials => 'Du hast noch keine Zugangsdaten für Rebrickable hinterlegt. Bitte trage sie in den Einstellungen ein.';
	@override String get errMsgWrongCredentials => 'Du hast die falschen Zugangsdaten für Rebrickable hinterlegt. Bitte trage die korrekten Daten in den Einstellungen ein.';
	@override String get settings => 'Einstellungen';
	@override String get username => 'Benutzername';
	@override String get password => 'Passwort';
	@override String get apiKey => 'API Schlüssel';
	@override String get enterUsername => 'Gib deinen Benutzernamen ein';
	@override String get enterPassword => 'Gib dein Passwort ein';
	@override String get enterApiKey => 'Gib deinen API Schlüssel ein';
	@override String get close => 'Schließen';
	@override String get noMocsFound => 'Es wurden keine Mocs für dieses Set gefunden';
	@override String get noSetsFound => 'Diese Liste enthält keine Sets';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringEn {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'home': 'Home',
			'errorLoadingSetList': ({required Object error}) => 'There was an error while loading your set lists:\n$error',
			'errorLoadingMocList': ({required Object error}) => 'There was an error while loading your moc list:\n$error',
			'noOfSets': ({required num count}) => (_root._cardinalResolver ?? _pluralCardinalEn)(count,
				zero: 'No sets',
				one: '$count set',
				other: '$count sets',
			),
			'noOfParts': ({required num count}) => (_root._cardinalResolver ?? _pluralCardinalEn)(count,
				zero: 'No parts',
				one: '$count part',
				other: '$count parts',
			),
			'dismiss': 'Dismiss',
			'toSettingsPage': 'Go to settings',
			'errMsgMissingCredentials': 'You have not yet configured your rebrickable credentials. Please go to the settings page and enter them.',
			'errMsgWrongCredentials': 'You have entered wrong rebrickable credentials. Please go to the settings page and enter the correct ones.',
			'settings': 'Settings',
			'username': 'Username',
			'password': 'Password',
			'apiKey': 'API Key',
			'enterUsername': 'Enter username',
			'enterPassword': 'Enter password',
			'enterApiKey': 'Enter API key',
			'close': 'Close',
			'noMocsFound': 'No mocs found for this set',
			'noSetsFound': 'This set list does not contain any sets',
		};
	}
}

extension on _StringDe {
	Map<String, dynamic> _buildFlatMap() {
		return {
			'home': 'Startseite',
			'errorLoadingSetList': ({required Object error}) => 'Es gab einen Fehler beim Laden deiner Set Listen:\n$error',
			'errorLoadingMocList': ({required Object error}) => 'Es gab einen Fehler beim Laden deiner Moc Liste:\n$error',
			'noOfSets': ({required num count}) => (_root._cardinalResolver ?? _pluralCardinalDe)(count,
				zero: 'keine Sets',
				one: '$count Set',
				other: '$count Sets',
			),
			'noOfParts': ({required num count}) => (_root._cardinalResolver ?? _pluralCardinalDe)(count,
				zero: 'keine Teile',
				one: '$count Teil',
				other: '$count Teile',
			),
			'dismiss': 'Verwerfen',
			'toSettingsPage': 'Zu den Einstellungen',
			'errMsgMissingCredentials': 'Du hast noch keine Zugangsdaten für Rebrickable hinterlegt. Bitte trage sie in den Einstellungen ein.',
			'errMsgWrongCredentials': 'Du hast die falschen Zugangsdaten für Rebrickable hinterlegt. Bitte trage die korrekten Daten in den Einstellungen ein.',
			'settings': 'Einstellungen',
			'username': 'Benutzername',
			'password': 'Passwort',
			'apiKey': 'API Schlüssel',
			'enterUsername': 'Gib deinen Benutzernamen ein',
			'enterPassword': 'Gib dein Passwort ein',
			'enterApiKey': 'Gib deinen API Schlüssel ein',
			'close': 'Schließen',
			'noMocsFound': 'Es wurden keine Mocs für dieses Set gefunden',
			'noSetsFound': 'Diese Liste enthält keine Sets',
		};
	}
}
