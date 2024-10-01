import { defineConfig } from "vite";
import Rails from "vite-plugin-rails";
import react from '@vitejs/plugin-react'
import {resolve} from "path";

export default defineConfig({
  clearScreen: false,
  build: { sourcemap: false },
  plugins: [
    Rails({
      fullReload: {
        additionalPaths: [
          "config/routes.rb",
          "app/views/**/*",
          "app/components/**/*",
          "app/javascripts/**/*",
        ],
        delay: 300,
      },
    }),
    react(),
  ],
  resolve: {
    alias: {
      "@routes": resolve(__dirname, 'app/javascripts/app/routes'),
      "@pages": resolve(__dirname, 'app/javascripts/app/pages'),
      "@ui": resolve(__dirname, 'app/javascripts/app/components/ui'),
      "@utils": resolve(__dirname, "app/javascripts/app/utils"),
      "@components": resolve(__dirname, "app/javascripts/app/components"),
      "@context": resolve(__dirname, "app/javascripts/app/contexts"),
      "@assets": resolve(__dirname, "app/javascripts/app/assets"),
      "@skeletons": resolve(__dirname, "app/javascripts/app/components/skeletons")
    }
  }
});
