import globals from "globals";
import pluginReact from "eslint-plugin-react";
import js from "@eslint/js";

export default [
  js.configs.recommended,
  {
    files: ["**/*.{js,mjs,cjs,jsx}"],
  },
  {
    languageOptions: {
      globals: {
        ...globals.browser,
        "$": true,
        "Turbo": true,
      }
    }
  },
  pluginReact.configs.flat.recommended,
  {
    rules: {
      "react/prop-types": "off",
      "react/display-name": "off",
      "no-undef": "warn"
    },
    ignores: [
      "./node_modules/*"
    ],
    settings: {
      react: {
        version: "detect",
      },
    },
  }
];