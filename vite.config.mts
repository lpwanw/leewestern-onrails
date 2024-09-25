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
          "app/frontend/**/*",
        ],
        delay: 300,
      },
    }),
    react(),
  ],
  resolve: {
    alias: {
      "@routes": resolve(__dirname, 'app/frontend/app/routes'),
      "@pages": resolve(__dirname, 'app/frontend/app/pages'),
      "@ui": resolve(__dirname, 'app/frontend/app/components/ui'),
      "@utils": resolve(__dirname, "app/frontend/app/utils"),
      "@components": resolve(__dirname, "app/frontend/app/components"),
      "@context": resolve(__dirname, "app/frontend/app/contexts"),
      "@assets": resolve(__dirname, "app/frontend/app/assets")
    }
  }
});
