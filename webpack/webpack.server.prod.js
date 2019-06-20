const path = require('path');

module.exports = {
  entry: ['./src/server/index.coffee'],
  mode: 'production',
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
  plugins: []
}