const flowbite = require("flowbite-react/tailwind");
const zIndexClass = Array.from({ length: 14 }, (_,i) => {
  return `z-[${(i + 6) * 10}]`
});
const {
  default: flattenColorPalette,
} = require("tailwindcss/lib/util/flattenColorPalette");

const backgroundBoxColors = [
  "sky-300",
  "pink-300",
  "green-300",
  "yellow-300",
  "red-300",
  "purple-300",
  "blue-300",
  "indigo-300",
  "violet-300",
].map(color => `hover:bg-[color:var(--${color})]`)

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
    extend: {
      gridTemplateColumns: {
        "boxes": "repeat(50, minmax(0, 1fr))",
      },
      gridTemplateRows: {
        "boxes": "repeat(50, minmax(0, 1fr))",
      }
    }
  },
  corePlugins: {
    aspectRatio: false,
  },
  safelist: [
    ...zIndexClass,
    ...backgroundBoxColors,
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
