const path = require("path");
const Webpack = require("webpack");

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
                presets: ["@babel/preset-env", "@babel/preset-react"],
                plugins: ["transform-react-jsx"]
              }
            }
          }
        ]
      },
      {
          test:/\.(css)/,
          use: ['style-loader', 'css-loader']
      }
    ]
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
    new Webpack.DefinePlugin({
      "process.env": process.env
    })
  ]
};
