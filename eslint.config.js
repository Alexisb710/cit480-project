// eslint.config.js
import { ESLint } from "eslint";

export default [
  {
    ignores: ["node_modules/**"],  // Ignore node_modules
  },
  {
    files: ["**/*.js", "**/*.jsx"],  // Target .js and .jsx files
    languageOptions: {
      ecmaVersion: "latest",  // Set ECMAScript version
      sourceType: "module",   // Enable ES modules
    },
    rules: {
      "semi": ["error", "always"],  // Example: enforce semicolons
      "quotes": ["error", "single"],  // Example: enforce single quotes
      // Add more rules as needed
    },
  },
];
