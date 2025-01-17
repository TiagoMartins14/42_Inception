<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('DB_NAME') );

/** Database username */
define( 'DB_USER', getenv('DB_USER') );

/** Database password */
define( 'DB_PASSWORD', trim(file_get_contents(getenv('DB_PASSWORD_FILE'))) );

/** Database hostname */
define( 'DB_HOST', getenv('DB_HOST') );

/** WordPress home URL */
DEFINE( 'WP_HOME', getenv('WP_SITEURL') );

/** WordPress site URL */
DEFINE( 'WP_SITEURL', getenv('WP_SITEURL') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '7:zO;I8A.x==)Pu-M1[/k~IeCk9*fvsx>;c3;DInG$O+@ q+S+e^X2di]`zd880;');
define('SECURE_AUTH_KEY',  'mc=+EZY>3@:+xwpTAA*0i>f(.>E0Y+Vi?~>X6v-A*Jf+pwW7nsXP.bbmuyMn&(9#');
define('LOGGED_IN_KEY',    'Q(.N_>^VroAI,G-5hSlW[nsk?j/W7s]!]KC0}dhX!T-Ts$e9LeA>:xU|?d4WFr}P');
define('NONCE_KEY',        '7SzIHd-Gwo_-(3z+3GH0|oJ4kY,ab8;AtlD#7+kZ*s2^sh=QH2QL{C{RiG}7aB:_');
define('AUTH_SALT',        'H]|4a%SUz$rvviDi(2lT0GzX3}js&zS9M)Lx[-Uyka$%tCc,xC#fir=OkyXFfkLX');
define('SECURE_AUTH_SALT', 't|,m< v($TO0WW@KU7 >{UPTA?IoF7VBR}De=B-4W>[i5,/t150yeh{Cdmo{|/n5');
define('LOGGED_IN_SALT',   '08`D<=v RF~6S{.4%|35Ei+i(^#lc|bI&!z0Or?8#:|vop+n|`.0]?BBS4i/Pylh');
define('NONCE_SALT',       'CqK8;5.j^Lz!C@g:SKPA~EN*q+xs}G-~89,N%ngHTL/ncd,nIM/E-NB&81-2>NM+');

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
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
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
?>
