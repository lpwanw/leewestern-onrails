const flowbite = require("flowbite-react/tailwind");
const zIndexClass = Array.from({ length: 14 }, (_,i) => {
  return `z-[${(i + 6) * 10}]`
});
const {
  default: flattenColorPalette,
} = require("tailwindcss/lib/util/flattenColorPalette");

module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/components/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/stylesheets/**/*.css",
    "./app/javascript/**/*.{js,jsx}",
    './node_modules/flowbite/**/*.js',
    flowbite.content(),
  ],
  darkMode: "class",
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
    flowbite.plugin(),
    addVariablesForColors,
  ],
};

function addVariablesForColors({ addBase, theme }) {
  let allColors = flattenColorPalette(theme("colors"));
  let newVars = Object.fromEntries(
    Object.entries(allColors).map(([key, val]) => [`--${key}`, val])
  );

  addBase({
    ":root": newVars,
  });
}
