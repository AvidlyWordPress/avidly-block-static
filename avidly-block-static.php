<?php
/**
 * Plugin Name:       Avidly Static Block
 * Description:       Example block based on WordPress Block Editor Handbook, Create a Block Tutorial.
 * Requires at least: 5.8
 * Requires PHP:      7.0
 * Version:           0.1.0
 * Author:            Avidly
 * Author URI:        https://www.avidlyagency.com/
 * License:           GPL-2.0-or-later
 * License URI:       https://www.gnu.org/licenses/gpl-2.0.html
 * Text Domain:       avidly-block-static
 *
 * @package           Avidly_Static_Block
 */

defined( 'ABSPATH' ) || die( 'No script kiddies please!' );

// Support for PHP translations.
load_plugin_textdomain( 'avidly-block-static', false, basename( dirname( __FILE__ ) ) . '/languages' );


/**
 * Registers the block using the metadata loaded from the `block.json` file.
 * Behind the scenes, it registers also all assets so they can be enqueued
 * through the block editor in the corresponding context.
 *
 * @see https://developer.wordpress.org/block-editor/reference-guides/block-api/block-metadata/
 */
add_action(
	'init',
	function() {
		// Create the block.
		register_block_type( __DIR__ );
	}
);


/**
 * Support for block JS translations.
 *
 * @link https://developer.wordpress.org/block-editor/how-to-guides/internationalization/#load-translation-file
 *
 * @return void
 */
add_action(
	'enqueue_block_editor_assets',
	function() {
		// Support for block JS translations.
		wp_set_script_translations(
			'avidly-block-static-editor-script', // Handle.
			'avidly-block-static', // Text domain.
			plugin_dir_path( __FILE__ ) . 'languages' // Uses filename in the form of ${domain}-${locale}-${handle}.json.
		);
	},
	1
);
