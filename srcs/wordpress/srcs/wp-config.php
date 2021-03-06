<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'root' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql-service' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'nmk+&tvF0e>m>C]3]Nkd8Wu_JLCI?-qy/j^+%.A8R:ir9L`4/{q^J?2Tc%}h47H-' );
define( 'SECURE_AUTH_KEY',  '{snK1!2u.y[$m7@<&8L]k8 9S)IJd|x?e10ool94I[sW#t3u`2P?SXL$KeGt.HLK' );
define( 'LOGGED_IN_KEY',    'mc0FCr<fKQ<Pb7<C6T8cg$).A1#na,ZTK=^z&cz|hyLi%p<8F`+=;604g=1n+hoa' );
define( 'NONCE_KEY',        '9o}~c<$3rDfSb|Em7S1qZpNQXU|[!EMU B%:IBmx1h?6{;7 $7Yo/1jY`SF|89vD' );
define( 'AUTH_SALT',        '&dymeE4P:KdhK,O>mQhtFvL@Fn7BjUy7c~D-I}`fx`}DLSOk6Px*g6m<AKr9tpBI' );
define( 'SECURE_AUTH_SALT', 'nY6MRF]a1!;mG;v0)Ua8;SnGIuzZ1`TG%R:{zuBRt: 8GioB;7c3VcL.O7w/RbtG' );
define( 'LOGGED_IN_SALT',   '0xsYqry4?@6o7jN| #UGBm?F<C;b$i+B#]G!(PtwbM$0O= :#2|&ght1O]u|O3M/' );
define( 'NONCE_SALT',       'F`+If!=fG}jUbqd^5,i]!!!C%geuL=e_v}y>BMa4cc9k?<#5sKM]QP{+~vq#,+.r' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
