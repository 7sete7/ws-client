const path = require("path");
const Webpack = require("webpack");
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  mode: "development",
  entry: path.join(__dirname, "../src/client/index.coffee"),
  module: {
    rules: [
      {
        test: /\.coffee$/,
        exclude: /node_modules/,
        use: [
          {
            loader: "coffee-loader",
            options: {
              transpile: {
                presets: [
                  ["@babel/preset-env", { targets: { node: "10" } }],
                  "@babel/preset-react"
                ],
                plugins: ["transform-react-jsx"]
              }
            }
          }
        ]
      },
      {
          test:/\.(css)/,
          use: ['style-loader', 'css-loader']
      },
      {
        test:/\.(less)/,
        use: ['style-loader', 'css-loader', 'less-loader']
      }
    ]
  },
  resolve: {
    alias: {
      Utils: path.resolve(__dirname, '../src/utils/'),
      client: path.resolve(__dirname, '../src/client/'),
    },
    extensions: ['.coffee', '.js']
  },
  output: {
    path: __dirname + "../build/client",
    filename: "bundle.js"
  },

  devServer: {
    inline: true,
    contentBase: "./public",
    port: 3000
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: __dirname + '/../public/index.html',
      favicon: __dirname + '/../public/favicon.ico'
    }),
    new Webpack.DefinePlugin({
      "process.env": process.env
    })
  ]
};
