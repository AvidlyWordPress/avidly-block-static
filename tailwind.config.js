module.exports = {
	purge: {
		content: [
			'./src/*.scss',
			'./src/*.js',
			'./inc/*.php',
			'./*.php'
		],
	},
	darkMode: false, // or 'media' or 'class'
	theme: {
	  extend: {},
	},
	variants: {},
	corePlugins: {
		preflight: false,
		container: false,
		animation: false,
		ringWidth: false,
		ringColor: false,
		ringOpacity: false,
		ringOffsetWidth: false,
		ringOffsetColor: false,
		dropShadow: false,
		borderOpacity: false,
		borderColor: false,
	},
	plugins: [],
}