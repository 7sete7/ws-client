const path = require('path');
const HtmlWebpackPlugin = require('webpack-html-plugin');
const WebpackShellPlugin = require('webpack-shell-plugin');

module.exports = {
//   entry: './src/index.coffee',
  entry: ['./src/server/index.coffee'],
  mode: 'development',
  target: 'node',
  output: {
    path: path.resolve(__dirname, '../build/server'),
    filename: 'index.js'
  },
  resolve: {
    extensions: ['.coffee', '.js'],
  },
  devServer: {
    port: 8080,
    // contentBase: './build'
    open: true
  },
  module: {
    rules: [
      {
        test: /\.coffee$/,
        use: [
          {
            loader: 'coffee-loader',
            options: { 
              transpile: {
                presets: ['@babel/preset-env']
              }
            }
          }
        ]
      }
    ]
  },
  plugins: [
    new WebpackShellPlugin({
        onBuildEnd: ['npm run run-server:dev']
    }),
  ]
}