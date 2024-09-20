import { defineConfig } from "vite";
import Rails from "vite-plugin-rails";
import react from '@vitejs/plugin-react'
import {resolve} from "path";

export default defineConfig({
  clearScreen: false,
  plugins: [
    Rails({
      fullReload: {
        additionalPaths: [
          "config/routes.rb",
          "app/views/**/*",
          "app/components/**/*",
          "app/javascript/**/*",
        ],
        delay: 300,
      },
    }),
    react(),
  ],
  resolve: {
    alias: {
      "@routes": resolve(__dirname, 'app/javascript/fe/routes'),
      "@pages": resolve(__dirname, 'app/javascript/fe/pages'),
      "@ui": resolve(__dirname, 'app/javascript/fe/components/ui'),
      "@utils": resolve(__dirname, "app/javascript/fe/utils")
    }
  }
});
