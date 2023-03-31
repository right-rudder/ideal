const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'ideal-blue': '#004f9aff',
      },
      keyframes: {
        'plane-enter': {
          '0%': {
            opacity: 0,
            transform: 'translateX(-100%)',
          },
          '100%': {
            opacity: 1,
            transform: 'translateX(0)',
          },
        },
        'plane-leave': {
          '0%': {
            opacity: 1,
            transform: 'translateX(0)',
          },
          '50%': {
            opacity: 1,
            transform: 'translateX(50%)',
          },
          '100%': {
            opacity: 0,
            transform: 'translateX(100%)',
          },
        }
      },
      animation: {
        'plane-enter': 'plane-enter 0.7s ease-out forwards',
        'plane-leave': 'plane-leave 0.3s ease-out forwards',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
