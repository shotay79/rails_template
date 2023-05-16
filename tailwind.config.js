module.exports = {
  plugins: [],
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/javascript/**/*.tsx',
  ],
  theme: {
    extend: {
      colors: {
        primary: '#0A1E41',
      }
    }
  }
}
