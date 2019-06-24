const path = require('path');
const WebpackShellPlugin = require('webpack-shell-plugin');

module.exports = {
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
    open: true
  },
  resolve: {
    alias: {
      Utils: path.resolve(__dirname, '../src/utils/')
    },
    extensions: ['.coffee', '.js']
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
                presets: [
                  ["@babel/preset-env", { targets: { node: "10" } }]
                ]
              }
            }
          }
        ]
      }
    ]
  },
  plugins: [
    // new WebpackShellPlugin({
    //     onBuildEnd: ['npm run run-server:dev']
    // })
  ]
}