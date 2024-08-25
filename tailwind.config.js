module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/components/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
  ],
  corePlugins: {
    aspectRatio: false,
  },
  plugins: [
    require("@tailwindcss/typography")({
      className: "typography",
    }),
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("flowbite/plugin"),
  ],
};
