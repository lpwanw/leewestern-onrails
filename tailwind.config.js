const zIndexClass = Array.from({ length: 14 }, (_,i) => {
  return `z-[${(i + 6) * 10}]`
});

module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/components/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.js",
    './node_modules/flowbite/**/*.js'
  ],
  theme: {
    fontFamily: {
      sans: ["Inter", "sans-serif"],
    },
  },
  corePlugins: {
    aspectRatio: false,
  },
  safelist: [
    ...zIndexClass,
  ],
  plugins: [
    require("@tailwindcss/typography")({
      className: "typography",
    }),
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("flowbite/plugin"),
  ],
};
