const path = require("path");
const HtmlWebpackPlugin = require("webpack-html-plugin");
const WebpackShellPlugin = require("webpack-shell-plugin");

module.exports = {
  mode: "development",
  entry: path.join(__dirname, "../src/client/index.coffee"),
  module: {
    rules: [
      // {
      //   test: /\.(js|jsx)$/,
      //   exclude: /node_modules/,
      //   loader: 'babel-loader',
      //   query: { presets: ['@babel/preset-env', '@babel/preset-react'] }
      // },
      {
        test: /\.coffee$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "coffee-loader",
            options: {
              transpile: {
                presets: ["@babel/preset-env", "@babel/preset-react"],
                plugins: ["transform-react-jsx"]
              }
            }
          }
        ]
      }
      // {
      //     test:/\.(css)/,
      //     use: ['style-loader', 'css-loader'] TEM QUE INSTRALAR SAMERDA
      // }]
    ]
  },
  output: {
    path: __dirname + "../build/client",
    filename: "bundle.js"
  },

  devServer: {
    inline: true,
    contentBase: "./public",
    port: 3000,
    proxy: {
      "/api": "http://localhost:8080"
    }
  },
  plugins: [
    // new WebpackShellPlugin({
    //     onBuildEnd: ['npm run run-client:dev']
    // }),
  ]
};
