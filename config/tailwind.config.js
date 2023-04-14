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
        paragraph: ['Nunito Sans','Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'ideal-blue': '#004F9A',
        'ideal-blue-light': '#2065A7',
        'ideal-blue-dark' : '#003B74',
        'ideal-blue-darker' : '#001E3A',
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
        },
        marquee: {
          '0%': { transform: 'translateX(0%)' },
          '100%': { transform: 'translateX(-168%)' },
        },
        marquee2: {
          '0%': { transform: 'translateX(168%)' },
          '100%': { transform: 'translateX(0%)' },
        },
        marqueemobile: {
          '0%': { transform: 'translateX(0%)' },
          '100%': { transform: 'translateX(-174%)' },
        },
        marquee2mobile: {
          '0%': { transform: 'translateX(174%)' },
          '100%': { transform: 'translateX(0%)' },
        },
        'slide-in-left': {
          '0%': {
            transform: 'translateX(-100%)',
            opacity: 0
          },
          '100%': {
            transform: 'translateX(0)',
            opacity: 1
          },
        },
        'slide-out-left': {
          '0%': {
            transform: 'translateX(0)',
            opacity: 1,
          },
          '100%': {
            transform: 'translateX(-100%)',
            opacity: 0,
          },
        },
      },
      animation: {
        'plane-enter': 'plane-enter 0.7s ease-out forwards',
        'plane-leave': 'plane-leave 0.3s ease-out forwards',


        marquee: 'marquee 55s linear infinite',
        marquee2: 'marquee2 55s linear infinite',
        marqueemobile: 'marqueemobile 55s linear infinite',
        marquee2mobile: 'marquee2mobile 55s linear infinite',

        'slide-in-left': 'slide-in-left 0.6s ease-out',
        'slide-in-left2': 'slide-in-left 0.7s ease-out',
        'slide-in-left3': 'slide-in-left 0.8s ease-out',
        'slide-in-left4': 'slide-in-left 1s ease-out',

        'slide-out-left': 'slide-out-left 0.3s ease-out',
        'slide-out-left2': 'slide-out-left 0.4s ease-out',
        'slide-out-left3': 'slide-out-left 0.5s ease-out',
        'slide-out-left4': 'slide-out-left 0.6s ease-out',
      },
      backgroundImage : {
        'home' : "url('collage_header.webp')",
        'ctahead' : "url('cta_banner_ideal.webp')",
        'sunset' : "url('sunset.webp')",
        'archbg' : "url('archbg.webp')",
        'piper' : "url('piper_sunset.webp')",
      },
      height: theme => ({
        'screen-1/2': '50vh',
        'screen-2/3': '66vh',
        'screen-1/3': 'calc(100vh / 3)',
        'screen-3/4': '75vh',
        'screen-4/5': '80vh',
        'screen-mobile' : '90.1vh', //depends on menu height
      }),
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
