const path = require('path');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const assets = path.resolve(__dirname, 'Public', 'assets');
const resources = path.resolve(__dirname, 'Sources', 'Resources');
const devMode = process.env.NODE_ENV !== 'production';

module.exports = {
  entry: path.resolve(resources, 'js', 'index.js'),
  output: {
    filename: path.join('js', 'main.js'),
    path: assets
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename:  path.join('css', 'main.css'),
    })
  ],
  module: {
    rules: [
      {
        test: /\.s(a|c)ss$/,
        use: [{
          loader: MiniCssExtractPlugin.loader
        }, {
          loader: 'css-loader',
        }, {
          loader: 'postcss-loader',
          options: {
            plugins: function() {
              return [
                require('autoprefixer')
              ];
            }
          }
        }, {
          loader: 'sass-loader'
        }]
      }
    ]
  },
  mode: devMode ? 'development' : 'production'
};
